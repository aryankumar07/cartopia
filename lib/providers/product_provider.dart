import 'package:cartopia/models/product.dart';
import 'package:flutter/material.dart';

class productProvider extends ChangeNotifier {

  Product _product = Product(
    name: '', 
    description: '', 
    category: '', 
    price: 0.0, 
    quantity: 0.0, 
    images: [],
    );

    Product get product => _product;

    void setProduct(String product){
      _product = Product.fromJson(product);
      notifyListeners();
    }


}