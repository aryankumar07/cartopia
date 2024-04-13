import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/features/accounts/widgets/below_bar.dart';
import 'package:cartopia/features/accounts/widgets/buttons_col.dart';
import 'package:cartopia/features/accounts/widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient 
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/app_logo.png',
                  width: 80,
                  height: 100,
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              )
            ],
          ),
        )),
        body: Column(
          children: [
            BelowBar(),
            SizedBox(height: 10,),
            ButtonCol(),
            SizedBox(height: 10,),
            Orders(),
          ],
        ),
    );
  }
}