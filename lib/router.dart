import 'package:cartopia/common/widgets/bottom_bar.dart';
import 'package:cartopia/features/admin/screens/add_product_screen.dart';
import 'package:cartopia/features/auth/screen/auth_screen.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){

    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>AuthScreen());

    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>HomeScreen());
      
    case BottomBar.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>BottomBar ());

        case AddProductScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>AddProductScreen());

    default:
      return MaterialPageRoute(
        settings: routeSettings ,
        builder: (_)=>Scaffold(body: Center(child: Text('Route Not Found'),),));
  }
}