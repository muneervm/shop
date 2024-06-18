import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/loginpro.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/wahni1.png',
                    width: 150,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 130),
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, _) => TextField(
                      style: const TextStyle(height: 2.0, color: Colors.black),
                      controller: authProvider.usernameController,
                      decoration: InputDecoration(
                        // labelText: 'Username',
                        hintText: 'Username',
                        prefixIcon: const Icon(Icons.hdr_auto_sharp),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, _) => TextField(
                      style: const TextStyle(height: 2.0, color: Colors.black),
                      controller: authProvider.passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      obscureText: true,
                    ),
                  ),
                  const SizedBox(height: 70),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          Provider.of<AuthProvider>(context, listen: false)
                              .login(context),
                      icon: const Icon(Icons.login,  color: Colors.blue),
                      label: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}