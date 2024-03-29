import 'package:cartopia/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
  switch(routeSettings.name){
    case AuthScreen.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_) => AuthScreen(),
      );
    default:
    return MaterialPageRoute(
    settings: routeSettings,
      builder: (_) => Scaffold(
        body: Center(
          child: Text('This Screen Doesnot Exits'),
        ),
      ));
    }

}