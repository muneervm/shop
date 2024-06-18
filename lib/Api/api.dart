

import 'package:dio/dio.dart';
import 'package:shop/datastore.dart/hive.dart';
import 'package:shop/datastore.dart/sharedpref.dart';


class Api {
  static const String baseUrl ='https://wahni-mobapp.frappe.cloud/api/method/api.';
  
  
  Map<String, dynamic> headers = {
    'Content-Type': 'application/json',
    'Connection': 'keep-alive',
  };

  final Dio dio = Dio();

  Future<Map<String, dynamic>> authenticate(String username, String password) async {
     const String authenticateEndpoint = 'auth.authenticate';
    const url = baseUrl + authenticateEndpoint;
    final body = {
      "username": username,
      "password": password,
      "version": 21
    };

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: headers,
        ),
        data: body,
      );

      if (response.statusCode == 200) {
        return response.data ;
      } else {
        throw Exception('Failed to authenticate');
      }
    } catch (e) {
      throw Exception('Failed to authenticate: $e');
    }
  }

  Future<List<Shop>> getAllShops() async {
     const String endpoint = 'shop.get_all_shops';
    String? token = await SharedPrefs.getToken();
    headers.addAll({'Authorization': 'Basic $token'});
    const url = baseUrl + endpoint;

    try {
      final response = await dio.post(
        url,
        options: Options(
          headers: headers,
        ),
      );
      headers.remove('Authorization');

      if (response.statusCode == 200) {
        final List<dynamic> shopList = response.data['message']['shops'];
        return shopList.map((json) => Shop.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch shops');
      }
    } catch (e) {
      throw Exception('Failed to fetch shops: $e');
    }
  }
 }