import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shop/datastore.dart/sharedpref.dart';

class Api2 {
  static const String baseUrl = 'https://wahni-mobapp.frappe.cloud/api/method/api.';
  static const String authenticateEndpoint = 'generic.mark_attendance';

  static Future<Map<String, dynamic>> attendance(
    String longitude, 
    String latitude, 
    String street, 
    String postalCode, 
    String district
  ) async {
    final token = await SharedPrefs.getToken(); // Get token from SharedPrefs
    if (token == null) {
      throw Exception('Token is not available');
    }

    final url = baseUrl + authenticateEndpoint;
    final data = {
      "longitude": longitude,
      "latitude": latitude,
      "street": street,
      "postal_code": postalCode,
      "district": district,
    };

    try {
      final dio = Dio();
      final response = await dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Connection': 'keep-alive',
            'Authorization': 'Basic $token',
          },
        ),
        data: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to mark attendance');
      }
    } catch (e) {
      throw Exception('Failed to mark attendance: $e');
    }
  }
}