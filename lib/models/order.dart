// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cartopia/models/product.dart';

class Order {
  final String id;
  final List<Product> products;
  final List<int> quantity;
  final String address;
  final String userid;
  final int orderedAt;
  final int status;
  final double totalprice;

  Order({
    required this.id, 
    required this.products, 
    required this.quantity, 
    required this.address, 
    required this.userid, 
    required this.orderedAt, 
    required this.status,
    required this.totalprice
    });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'quantity': quantity,
      'address': address,
      'userid': userid,
      'orderedAt': orderedAt,
      'status': status,
      'totalprice':totalprice,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: map['_id'] ?? '',
      products: List<Product>.
      from(map['products']?.map((e)=>Product.fromMap((e['product'])))),
      quantity: List<int>
      .from(map['products']?.map((e)=>e['quantity'])),
      address: map['address'] ?? '',
      userid: map['userid'] ?? '',
      orderedAt: map['orderedAt']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      totalprice: map['totalprice'].toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(json.decode(source));
}
