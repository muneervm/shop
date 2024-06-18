
import 'package:flutter/material.dart';
import 'package:shop/Api/api.dart';


class SalesPersonProvider extends ChangeNotifier {
  String _salesPerson = '';

  String get salesPerson => _salesPerson;

  get selectedSalesPerson => null;

  Future<void> fetchSalesPerson() async {
    try {

      Map<String, dynamic> responseData =
          await Api().authenticate('test@wahni.com', 'erp@123');
      String salesPerson = responseData['message']['sales_person'];
      _salesPerson = salesPerson;
      notifyListeners();
    } catch (e) {
      print('Error fetching sales person: $e');
   
    }
  }

  void setSelectedSalesPerson(String s) {}
}

  