
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/attendenceprovider.dart';
import 'package:lottie/lottie.dart'; 

class AttendanceWidget extends StatelessWidget {
  const AttendanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AttendanceProvider(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/night.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Attendance',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        body: Stack(
          children: [
           
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/night.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //  content
            Center(
              child: Consumer<AttendanceProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const CircularProgressIndicator();
                  } else if (provider.errorMessage != null) {
                    return Text('Error: ${provider.errorMessage}');
                  } else if (provider.response != null) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 30),
                        Text('Attendance Marked Successfully',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold ),),
                      ],
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [  Lottie.network(
                          'https://lottie.host/7904b481-8162-46ca-8646-6ce6998b10e9/WeBxfWjJ5R.json', 
                          height: 200, 
                        ),
                        const SizedBox(height: 50),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              
                            ),
                          ),
                          onPressed: () {
                            provider.markAttendance();
                          },
                             icon: const Icon(Icons.check, color: Colors.green),
                           label:  const Text('Mark Attendance',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}