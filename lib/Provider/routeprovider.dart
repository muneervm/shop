import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop/datastore.dart/hive.dart';

class RouteProvider with ChangeNotifier {
  List<String> _routes = [];
  String? _selectedRoute;

  List<String> get routes => _routes;
  String? get selectedRoute => _selectedRoute;

  Future<void> loadRoutesForDistributor(String? distributor) async {
    var box = await Hive.openBox<Shop>('shops');
    var shops = box.values.where((shop) => shop.distributor == distributor).toList();
    _routes = shops.map((shop) => shop.route).toSet().toList();
    notifyListeners();
  }

  void setSelectedRoute(String? route) {
    _selectedRoute = route;
    notifyListeners();
  }

  void reset() {
    _selectedRoute = null;
    _routes = [];
    notifyListeners();
  }
}
