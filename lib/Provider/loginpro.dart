
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:shop/Api/api.dart';
// import 'package:shop/UI/screen.dart';
// import 'package:shop/datastore.dart/fluttersecure.dart';
// import 'package:shop/datastore.dart/sharedpref.dart';

// class AuthProvider extends ChangeNotifier {
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final SecureStorage secureStorage = SecureStorage();
  
//   Future<void> login(BuildContext context) async {
//     final username = usernameController.text;
//     final password = passwordController.text;

//     try {
//       final responseData = await Api().authenticate(username, password);
//       log('Authentication successful! Response data: $responseData');

//       final message = responseData['message'];
//       final token = message['token'];
//       await SharedPrefs.saveToken(token);
//       await secureStorage.writeToken(token); // Using SecureStorage here
//       // Navigate to the home page on successful login
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const Screen1()),
//       );

//       notifyListeners(); // Notify listeners after successful login
//     } catch (e) {
//       print('Authentication failed: $e');
//     }
//   }

//   Future<bool> checkLoginStatus() async {
//     var token = await SecureStorage().readToken();   
//     return token != null;
//   }
// }
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shop/Api/api.dart';
import 'package:shop/UI/screen.dart';
import 'package:shop/datastore.dart/fluttersecure.dart';
import 'package:shop/datastore.dart/sharedpref.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SecureStorage secureStorage = SecureStorage();

  Future<void> login(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;

    try {
      final responseData = await Api().authenticate(username, password);
      log('Authentication successful! Response data: $responseData');

      final message = responseData['message'];
      final token = message['token'];
      await SharedPrefs.saveToken(token);
      await secureStorage.writeToken(token); // Using SecureStorage here
      // Navigate to the home page on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Screen1()),
      );

      notifyListeners(); // Notify listeners after successful login
    } catch (e) {
      print('Authentication failed: $e');
    }
  }

  void clearFields() {
    usernameController.clear();
    passwordController.clear();
  }

  Future<bool> checkLoginStatus() async {
    var token = await SecureStorage().readToken();   
    return token != null;
  }
}