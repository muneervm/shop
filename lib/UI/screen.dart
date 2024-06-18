import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/2ndscreenpro.dart';
import 'package:shop/Provider/loginpro.dart';
import 'package:shop/UI/attendence.dart';
import 'package:shop/UI/login.dart';
import 'package:shop/UI/salesorder.dart';
import 'package:shop/UI/shoporder.dart';
import 'package:shop/datastore.dart/fluttersecure.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/night.png',
            fit: BoxFit.cover,
          ),
          Consumer<SalesPersonProvider>(
            builder: (context, salesPersonProvider, child) {
              if (salesPersonProvider.salesPerson.isEmpty) {
                salesPersonProvider.fetchSalesPerson();
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Screen1Content(
                  salesPerson: salesPersonProvider.salesPerson,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
class Screen1Content extends StatelessWidget {
  final String salesPerson;

  const Screen1Content({
    super.key,
    required this.salesPerson,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Lottie.network(
              'https://lottie.host/de297e96-485e-42e1-aa05-86b3fcdf6499/JI0yLDGMXp.json',
              height: 200, //
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 100),
            const Text(
              'Welcome Back',
              style: TextStyle(
                  fontSize: 23.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 10),
            Text(
              ' $salesPerson',
              style: const TextStyle(
                  fontSize: 23.0, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            const SizedBox(height: 120),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SalesorderWidget()),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart,  color: Colors.green),
                    label: const Text(
                      'Sales order',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await SecureStorage().deleteToken();
                      Provider.of<AuthProvider>(context, listen: false).clearFields();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const ShoporderWidget()),
                      );
                    },
                    icon: const Icon(Icons.shopping_cart, color: Colors.green),
                    label: const Text(
                      'Shop order',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AttendanceWidget()),
                      );
                    },
                    icon: const Icon(Icons.calendar_today, color: Colors.amber),
                    label: const Text(
                      'Attendance',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await SecureStorage().deleteToken();
                      Provider.of<AuthProvider>(context, listen: false).clearFields();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    icon: const Icon(Icons.logout,  color: Colors.red),
                    label: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                      textStyle: const TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}