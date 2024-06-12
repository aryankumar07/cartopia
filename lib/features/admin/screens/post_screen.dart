import 'package:cartopia/features/admin/screens/add_product_screen.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  void navigateToaddProductScreen(){
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Text('Products'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
         tooltip: 'Add a product',
         shape: CircleBorder(),
        child: Icon(Icons.add),
        onPressed: navigateToaddProductScreen),
    );
  }
}