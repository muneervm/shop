import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/distibutorprovider.dart';
import 'package:shop/Provider/personprovider.dart';
import 'package:shop/UI/screen.dart';

class ShoporderWidget extends StatelessWidget {
  const ShoporderWidget({super.key});

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
          'Shop Order',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 25),
          onPressed: () {
            context.read<SalesProvider>().reset();
            context.read<DistributorProvider>().reset();

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const Screen1()),
            );
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/night.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              alignment: Alignment.center,
                              isExpanded: true,
                              hint: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Sales Person',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                              ),
                              value: selectedSalesPerson,
                              onChanged: (String? newValue) {
                                salesProvider.setSelectedSalesPerson(newValue);
                                distributorProvider.loadDistributorsForSalesPerson(newValue);
                              },
                              items: salesPeople.map((String salesPerson) {
                                return DropdownMenuItem<String>(
                                  value: salesPerson,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(salesPerson),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              alignment: Alignment.center,
                              isExpanded: true,
                              hint: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Distributor',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
                              ),
                              value: selectedDistributor,
                              onChanged: (String? newValue) {
                                distributorProvider.setSelectedDistributor(newValue);
                              },
                              items: distributors.map((String distributor) {
                                return DropdownMenuItem<String>(
                                  value: distributor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(distributor),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}