import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BelowBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  final user = Provider.of<UserProvider>(context).user;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      decoration: BoxDecoration(
        gradient: GlobalVariables.appBarGradient
      ),
      child: RichText(
        text: TextSpan(
          text: 'Hello, ',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black
        ),
        children: [
          TextSpan(
          text: user.name,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black
        ),)
        ]
        ),
        
        )
        );
  }
}