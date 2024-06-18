import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop/datastore.dart/hive.dart';

class ShopNameProvider with ChangeNotifier {
  List<String> _shopNames = [];

  List<String> get shopNames => _shopNames;

  Future<void> fetchShopNames({
    required String? salesPerson,
    required String? distributor,
    required String? route,
  }) async {
    if (salesPerson == null || distributor == null || route == null) {
      _shopNames = [];
    } else {
      var box = await Hive.openBox<Shop>('shops');
      var shops = box.values.where(
        (shop) =>
            shop.salesPerson == salesPerson &&
            shop.distributor == distributor &&
            shop.route == route,
      ).toList();
      _shopNames = shops.map((shop) => shop.name).toList();
    }
    notifyListeners();
  }

  void reset() {
    _shopNames = [];
    notifyListeners();
  }
}
