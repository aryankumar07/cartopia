import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName  = 'admin/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 60),
            child: Text(
              'ADD PRODUCT',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white
              ),
              ),
          ),
        ),
      ),
    );
  }
}