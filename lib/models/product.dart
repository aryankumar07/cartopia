// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:cartopia/models/rating.dart';

class Product {
    final String name;
    final String description;
    final String category;
    final double price;
    final String? id;
    final String? userId;
    final double quantity;
    final List<String> images;
    final List<Rating>? rating;

  Product({
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.quantity,
    required this.images,
    // this.rating,
    this.id,
    this.userId,
    this.rating,
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
      'rating':rating,
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
      rating: map['rating'] != null ? List<Rating>.from(map['rating']?.map((x)=>Rating.fromMap(x))) : null
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  Product copyWith({
    String? name,
    String? description,
    String? category,
    double? price,
    String? id,
    String? userId,
    double? quantity,
    List<String>? images,
    List<Rating>? rating,
  }) {
    return Product(
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      quantity: quantity ?? this.quantity,
      images: images ?? this.images,
      rating: rating ?? this.rating,
    );
  }
}
