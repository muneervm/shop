import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop/datastore.dart/hive.dart';

class DistributorProvider with ChangeNotifier {
  List<String> _distributors = [];
  String? _selectedDistributor;

  List<String> get distributors => _distributors;
  String? get selectedDistributor => _selectedDistributor;

  Future<void> loadDistributorsForSalesPerson(String? salesPerson) async {
    var box = await Hive.openBox<Shop>('shops');
    var shops = box.values.where((shop) => shop.salesPerson == salesPerson).toList();
    _distributors = shops.map((shop) => shop.distributor).toSet().toList();
    notifyListeners();
  }

  void setSelectedDistributor(String? distributor) {
    _selectedDistributor = distributor;
    notifyListeners();
  }

  void reset() {
    _selectedDistributor = null;
    _distributors = [];
    notifyListeners();
  }
}
