

// import 'package:flutter/material.dart';
// import 'package:shop/Api/api.dart';
// import 'package:hive/hive.dart';
// import 'package:shop/datastore.dart/hive.dart';

// class ShopProvider with ChangeNotifier {
//   List<Shop> _shops = [];
//   bool _isLoading = false;
//   String _error = '';

//   List<Shop> get shops => _shops;
//   bool get isLoading => _isLoading;
//   String get error => _error;

//   Future<void> fetchShops() async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       final shops = await Api().getAllShops(); 
//       _shops = shops;
//      // log('Response data: ${shops.toString()}');
//       _error = '';
//       final box = Hive.box<Shop>('shops');
//       await box.clear();
//       await box.addAll(shops);
//     } catch (e) {
//       _error = e.toString();
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }