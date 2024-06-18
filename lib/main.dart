import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shop/datastore.dart/hive.dart';
import 'package:shop/wahni.dart';


void main() 
 async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ShopAdapter());
  await Hive.openBox<Shop>('shops');

  runApp(
    const WahniApp());
}

