// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:shop/Provider/list.dart';
// import 'package:shop/UI/salesorder.dart';
// import 'package:shop/datastore.dart/hive.dart';


// class ShopScreen extends StatelessWidget {
//   const ShopScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => ShopProvider()..fetchShops(),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           flexibleSpace: Container(
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/b2.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           centerTitle: true,
//           title: const Text('Shops', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 30)),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
//             onPressed: () {
//             //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const S()));
//              },
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.person, color: Colors.white, size: 30),
//               onPressed: () {
//               //  Navigator.push(
//               //     context,
//               //     MaterialPageRoute(builder: (context) =>  const SalesPersonWidget()),
//               //   );
//               },
//             ),
//           ],
//         ),
//         body: Consumer<ShopProvider>(
//           builder: (context, shopProvider, child) {
//             if (shopProvider.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (shopProvider.error.isNotEmpty) {
//               return Center(child: Text(shopProvider.error));
//             } else {
//               return ValueListenableBuilder<Box<Shop>>(
//                 valueListenable: Hive.box<Shop>('shops').listenable(),
//                 builder: (context, box, widget) {
//                   if (box.isEmpty) {
//                     return const Center(child: Text('No shops available'));
//                   } else {
//                     return ListView.builder(
//                       itemCount: box.length,
//                       itemBuilder: (context, index) {
//                         final shop = box.getAt(index);
//                         return Container(
//                           margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
//                           decoration: BoxDecoration(
//                             color:  Colors.white,
//                             border: Border.all(color: Colors.black),
//                             borderRadius: BorderRadius.circular(10.0),
                            
//                           ),
//                           child: ListTile(
//                             title: Text(shop?.name ?? 'No name'),
//                              leading: const CircleAvatar(
//                                backgroundImage: AssetImage("assets/co.png"),),// const Icon(Icons.account_circle_rounded,size: 30,),
//                             subtitle: Text('Code: ${shop?.shopCode ?? 'No code'}, Route: ${shop?.route ?? 'No route'}'),
//                             trailing: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text('Distributor: ${shop?.distributor ?? 'No distributor'}'),
//                                 Text('Sales Person: ${shop?.salesPerson ?? 'No sales person'}'),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }