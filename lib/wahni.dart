
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/2ndscreenpro.dart';
import 'package:shop/Provider/attendenceprovider.dart';
import 'package:shop/Provider/distibutorprovider.dart';
// import 'package:shop/Provider/list.dart';
import 'package:shop/Provider/loginpro.dart';
import 'package:shop/Provider/nameprovider.dart';
import 'package:shop/Provider/routeprovider.dart';
//import 'package:shop/Provider/list.dart';
import 'package:shop/Provider/personprovider.dart';
import 'package:shop/UI/screen.dart';
import 'package:shop/UI/login.dart';
// import 'package:shop/UI/shop.dart';
//import 'package:shop/UI/shop.dart';

class WahniApp extends StatelessWidget {
  const WahniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => ShopProvider()),
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => SalesPersonProvider()),
         ChangeNotifierProvider(create: (_) => SalesProvider()),
        ChangeNotifierProvider(create: (_) => DistributorProvider()),
        ChangeNotifierProvider(create: (_) => RouteProvider()),
        ChangeNotifierProvider(create: (_) => ShopNameProvider()),
        ChangeNotifierProvider(create: (context) =>AttendanceProvider()),
             ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: InitialScreen(),
      ),
    );
  }
}
class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkLoginStatus();
    });
  }

  Future<void> _checkLoginStatus() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    print("Checking login status...");
    final isLoggedIn = await authProvider.checkLoginStatus();
    print("Login status: $isLoggedIn");

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  const Screen1()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}


