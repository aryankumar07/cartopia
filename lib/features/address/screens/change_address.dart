import 'package:flutter/material.dart';

class ChangeAddress extends StatelessWidget{

  static const String routeName = 'admin/change-address';

  ChangeAddress({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context,'changed address');
          }, 
          icon: Icon(Icons.arrow_back_ios)),
        title: Text('Choose Address'),
      ),
      body: Center(child: Text('Working'),),
    );
  }
}