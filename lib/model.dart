// class Shop {
//   final String name;
//   final String mobileNumber;
//   final String shopCode;
//   final String route;
//   final String distributor;
//   final String salesPerson;
//   final int visited;
//   final int ordered;

//   Shop({
//     required this.name,
//     required this.mobileNumber,
//     required this.shopCode,
//     required this.route,
//     required this.distributor,
//     required this.salesPerson,
//     required this.visited,
//     required this.ordered,
//   });

//   factory Shop.fromJson(Map<String, dynamic> json) {
//     return Shop(
//       name: json['name'],
//       mobileNumber: json['mobile_number'],
//       shopCode: json['shop_code'],
//       route: json['route'],
//       distributor: json['distributor'],
//       salesPerson: json['sales_person'],
//       visited: json['visited'],
//       ordered: json['ordered'],
//     );
//   }
// // }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop/Provider/distibutorprovider.dart';
// import 'package:shop/Provider/routeprovider.dart';
// import 'package:shop/Provider/salespro.dart';
// import 'package:shop/UI/shop.dart';

// class SalesPersonWidget extends StatelessWidget {
//   const SalesPersonWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/bg5.jpg'),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         centerTitle: true,
//         title: const Text(
//           'Sales Person',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
//           onPressed: () {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (BuildContext context) => const ShopScreen()),
//             );
//           },
//         ),
//       ),
//       body: Consumer<SalesProvider>(
//         builder: (context, salesProvider, child) {
//           var salesPeople = salesProvider.salesPersons;
//           var selectedSalesPerson = salesProvider.selectedSalesPerson;
//           return Consumer<DistributorProvider>(
//             builder: (context, distributorProvider, child) {
//               var distributors = distributorProvider.distributors;
//               var selectedDistributor = distributorProvider.selectedDistributor;
//               if (selectedDistributor != null && !distributors.contains(selectedDistributor)) {
//                 selectedDistributor = null;  // Reset the selected distributor if it's invalid
//               }
//               return Consumer<RouteProvider>(
//                 builder: (context, routeProvider, child) {
//                   var routes = routeProvider.routes;
//                   var selectedRoute = routeProvider.selectedRoute;
//                   if (selectedRoute != null && !routes.contains(selectedRoute)) {
//                     selectedRoute = null;  // Reset the selected route if it's invalid
//                   }
//                   return Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         DropdownButton<String>(
//                           alignment: Alignment.center,
//                           dropdownColor: Colors.amber,
//                           isExpanded: true,
//                           hint: const Text('Select Sales Person'),
//                           value: selectedSalesPerson,
//                           onChanged: (String? newValue) {
//                             salesProvider.setSelectedSalesPerson(newValue);
//                             distributorProvider.loadDistributorsForSalesPerson(newValue);
//                           },
//                           items: salesPeople.map((String salesPerson) {
//                             return DropdownMenuItem<String>(
//                               value: salesPerson,
//                               child: Text(salesPerson),
//                             );
//                           }).toList(),
//                         ),
//                         const SizedBox(height: 20),
//                         DropdownButton<String>(
//                           alignment: Alignment.center,
//                           dropdownColor: Colors.amber,
//                           isExpanded: true,
//                           hint: const Text('Select Distributor'),
//                           value: selectedDistributor,
//                           onChanged: (String? newValue) {
//                             distributorProvider.setSelectedDistributor(newValue);
//                             routeProvider.loadRoutesForDistributor(newValue);
//                           },
//                           items: distributors.map((String distributor) {
//                             return DropdownMenuItem<String>(
//                               value: distributor,
//                               child: Text(distributor),
//                             );
//                           }).toList(),
//                         ),
//                         const SizedBox(height: 20),
//                         DropdownButton<String>(
//                           alignment: Alignment.center,
//                           dropdownColor: Colors.amber,
//                           isExpanded: true,
//                           hint: const Text('Select Route'),
//                           value: selectedRoute,
//                           onChanged: (String? newValue) {
//                             routeProvider.setSelectedRoute(newValue);
//                           },
//                           items: routes.map((String route) {
//                             return DropdownMenuItem<String>(
//                               value: route,
//                               child: Text(route),
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
     