import 'package:cartopia/common/widgets/bottom_bar.dart';
import 'package:cartopia/features/admin/screens/add_product_screen.dart';
import 'package:cartopia/features/auth/screen/auth_screen.dart';
import 'package:cartopia/features/home/screens/category_screen_deal.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:cartopia/features/product_detail/screens/product_detail_screen.dart';
import 'package:cartopia/features/search/screen/search_screen.dart';
import 'package:cartopia/model/product.dart';
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

    case CategoryDealsScreen.routeName:
    var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>CategoryDealsScreen(
          category: category,
        ));

    case SearchScreen.routeName:
    var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>SearchScreen(
          searchQuery: searchQuery ,
        ));

    case ProductDetailScreen.routeName:
    var product = routeSettings.arguments as Product;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_)=>ProductDetailScreen(
          product: product,
          ));

    default:
      return MaterialPageRoute(
        settings: routeSettings ,
        builder: (_)=>Scaffold(body: Center(child: Text('Route Not Found'),),));
  }
}