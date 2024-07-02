// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {

  final String name;
  final String email;
  final String password;
  final String id;
  // final String address;
  final List<String> address;
  final String type;
  final String token;
  final List<dynamic> cart;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.id,
    required this.address,
    required this.type,
    required this.token,
    required this.cart,
  });



  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'id': id,
      'address': address,
      'type': type,
      'token': token,
      'cart':cart
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      id: map['_id'] ?? '',
      address: List<String>.from(map['address']),
      type: map['type'] ?? '',
      token: map['token'] ?? '',
      cart: List<Map<String,dynamic>>.from(map['cart']?.map((x)=>Map<String,dynamic>.from(x)))
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? name,
    String? email,
    String? password,
    String? id,
    List<String>? address,
    String? type,
    String? token,
    List<dynamic>? cart,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id ?? this.id,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
    );
  }
}
