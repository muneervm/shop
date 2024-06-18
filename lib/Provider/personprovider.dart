import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop/datastore.dart/hive.dart';

class SalesProvider with ChangeNotifier {
  List<String> _salesPersons = [];
  String? _selectedSalesPerson;

  List<String> get salesPersons => _salesPersons;
  String? get selectedSalesPerson => _selectedSalesPerson;

  SalesProvider() {
    _loadSalesPersons();
  }

  Future<void> _loadSalesPersons() async {
    var box = await Hive.openBox<Shop>('shops');
    var shops = box.values.toList();
    _salesPersons = shops.map((shop) => shop.salesPerson).toSet().toList();
    notifyListeners();
  }

  void setSelectedSalesPerson(String? salesPerson) {
    _selectedSalesPerson = salesPerson;
    notifyListeners();
  }

  void reset() {
    _selectedSalesPerson = null;
    notifyListeners();
  }
}
