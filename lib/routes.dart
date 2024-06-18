import 'package:cartopia/constants/bottom_bar.dart';
import 'package:cartopia/features/admin/screens/add_product_screen.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:cartopia/features/auth/screens/auth_screen.dart';
import 'package:cartopia/features/home/widgets/category_display.dart';
import 'package:cartopia/features/search/screen/search_screen.dart';
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

    case AddProductScreen.routeName :
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=> AddProductScreen()
      );

    case CategoryDisplay.routeName :
    var category = routeSettings.arguments as String;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=> CategoryDisplay(
        category: category,
      )
      );
    
    case SearchScreen.routeName :
    String searchQuery = routeSettings.arguments as String;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=> SearchScreen(
        searchQuery: searchQuery,
      )
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