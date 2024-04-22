// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  final String name;
  final String description;
  final double quantity;
  final double price;
  final String category;
  final String? id;
  final List<String> images;

  Product({
    required this.name, 
    required this.description, 
    required this.quantity, 
    required this.price, 
    required this.images, 
    required this.category,
    required this.id,
    });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'quantity': quantity,
      'price': price,
      'images': images,
      'category': category,
      'id': id,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      quantity: map['quantity'] ?? 0.0,
      price: map['price'] ?? 0.0,
      images: List<String>.from((map['images'])),
      category: map['category'] ?? '',
      id: map['_id'],
      );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
