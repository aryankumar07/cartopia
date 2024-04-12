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
    default:
      return MaterialPageRoute(
        settings: routeSettings ,
        builder: (_)=>Scaffold(body: Center(child: Text('Route Not Found'),),));
  }
}