import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/distibutorprovider.dart';
import 'package:shop/Provider/nameprovider.dart';
import 'package:shop/Provider/routeprovider.dart';
import 'package:shop/Provider/personprovider.dart';
import 'package:shop/UI/screen.dart';

class SalesorderWidget extends StatelessWidget {
  const SalesorderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Sales Order',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25),
          onPressed: () {
            // Reset
            context.read<SalesProvider>().reset();
            context.read<DistributorProvider>().reset();
            context.read<RouteProvider>().reset();
            context.read<ShopNameProvider>().reset();

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const Screen1()),
            );
          },
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
          Center(
            child: Consumer<SalesProvider>(
              builder: (context, salesProvider, child) {
                var salesPeople = salesProvider.salesPersons;
                var selectedSalesPerson = salesProvider.selectedSalesPerson;
                return Consumer<DistributorProvider>(
                  builder: (context, distributorProvider, child) {
                    var distributors = distributorProvider.distributors;
                    var selectedDistributor = distributorProvider.selectedDistributor;
                    if (selectedDistributor != null && !distributors.contains(selectedDistributor)) {
                      selectedDistributor = null;  // Reset the selected distributor if it's invalid
                    }
                    return Consumer<RouteProvider>(
                      builder: (context, routeProvider, child) {
                        var routes = routeProvider.routes;
                        var selectedRoute = routeProvider.selectedRoute;
                        if (selectedRoute != null && !routes.contains(selectedRoute)) {
                          selectedRoute = null;  // Reset the selected route if it's invalid
                        }
                        return Consumer<ShopNameProvider>(
                          builder: (context, shopNameProvider, child) {
                            var shopNames = shopNameProvider.shopNames;
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: DropdownButton<String>(
                                      alignment: Alignment.center,
                                      dropdownColor: Colors.white,
                                      isExpanded: true,
                                      underline: Container(),
                                      hint: const Text('Sales Person',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                      value: selectedSalesPerson,
                                      onChanged: (String? newValue) {
                                        salesProvider.setSelectedSalesPerson(newValue);
                                        distributorProvider.loadDistributorsForSalesPerson(newValue);
                                        shopNameProvider.reset(); // Reset shop names
                                      },
                                      items: salesPeople.map((String salesPerson) {
                                        return DropdownMenuItem<String>(
                                          value: salesPerson,
                                          child: Text(salesPerson),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: DropdownButton<String>(
                                      alignment: Alignment.center,
                                      dropdownColor: Colors.white,
                                      isExpanded: true,
                                      underline: Container(),
                                      hint: const Text('Distributor',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                      value: selectedDistributor,
                                      onChanged: (String? newValue) {
                                        distributorProvider.setSelectedDistributor(newValue);
                                        routeProvider.loadRoutesForDistributor(newValue);
                                        shopNameProvider.reset(); // Reset shop names
                                      },
                                      items: distributors.map((String distributor) {
                                        return DropdownMenuItem<String>(
                                          value: distributor,
                                          child: Text(distributor),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: DropdownButton<String>(
                                      alignment: Alignment.center,
                                      dropdownColor: Colors.white,
                                      isExpanded: true,
                                      underline: Container(),
                                      hint: const Text('Route',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                                      value: selectedRoute,
                                      onChanged: (String? newValue) {
                                        routeProvider.setSelectedRoute(newValue);
                                        shopNameProvider.fetchShopNames(
                                          salesPerson: selectedSalesPerson,
                                          distributor: selectedDistributor,
                                          route: newValue,
                                        );
                                      },
                                      items: routes.map((String route) {
                                        return DropdownMenuItem<String>(
                                          value: route,
                                          child: Text(route),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: shopNames.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                                          child: Container(
                                            padding: const EdgeInsets.all(12.0),
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(255, 174, 202, 233),
                                              border: Border.all(color: Colors.black),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                            child: Row(
                                              children: [
                                                const CircleAvatar(
                                                  backgroundImage:  AssetImage('assets/co.png'), // Replace with actual image path
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  shopNames[index],
                                                  style: const TextStyle(fontSize: 17, color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}