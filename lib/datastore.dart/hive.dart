import 'package:hive/hive.dart';
 part 'hive.g.dart';
 

@HiveType(typeId: 0)
class Shop {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String mobileNumber;

  @HiveField(2)
  final String shopCode;

  @HiveField(3)
  final String route;

  @HiveField(4)
  final String distributor;

  @HiveField(5)
  final String salesPerson;

  @HiveField(6)
  final int visited;

  @HiveField(7)
  final int ordered;

  Shop({
    required this.name,
    required this.mobileNumber,
    required this.shopCode,
    required this.route,
    required this.distributor,
    required this.salesPerson,
    required this.visited,
    required this.ordered,
  });

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      name: json['name'],
      mobileNumber: json['mobile_number'],
      shopCode: json['shop_code'],
      route: json['route'],
      distributor: json['distributor'],
      salesPerson: json['sales_person'],
      visited: json['visited'],
      ordered: json['ordered'],
    );
  }
}