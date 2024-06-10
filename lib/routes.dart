import 'package:cartopia/constants/bottom_bar.dart';
import 'package:cartopia/features/auth/home/screens/home_screen.dart';
import 'package:cartopia/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){

    
    case AuthScreen.routeName :
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=> AuthScreen()
      );

    case HomeScreen.routeName :
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=> HomeScreen()
      );

    case BottomBar.routeName :
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=> BottomBar()
      );


    default :
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=> Scaffold(
        body: Center(
          child: Container(
            child: Text("Eror 404 page"),
          ),
        ),
      )
      );

  }
}