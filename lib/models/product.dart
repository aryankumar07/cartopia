// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

class Product {
    final String name;
    final String description;
    final String category;
    final double price;
    final String? id;
    final String? userId;
    final double quantity;
    final List<String> images;

  Product({
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.quantity,
    required this.images,
    this.id,
    this.userId,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'quantity': quantity,
      'images': images,
      'id': id,
      'userId': userId,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: map['price'].toDouble() ?? 0.0,
      quantity: map['quantity'].toDouble() ?? 0.0,
      images: List<String>.from(map['images']),
      id: map['_id'],
      userId: map['userId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
