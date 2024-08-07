import 'package:cartopia/constants/bottom_bar.dart';
import 'package:cartopia/features/address/screens/address_screen.dart';
import 'package:cartopia/features/address/screens/change_address.dart';
import 'package:cartopia/features/admin/screens/add_product_screen.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:cartopia/features/auth/screens/auth_screen.dart';
import 'package:cartopia/features/home/widgets/category_display.dart';
import 'package:cartopia/features/order_detail/screen/order_detail_screen.dart';
import 'package:cartopia/features/product_detail/screen/product_detail_screen.dart';
import 'package:cartopia/features/search/screen/search_screen.dart';
import 'package:cartopia/models/order.dart';
import 'package:cartopia/models/product.dart';
import 'package:cartopia/common/webview_screen.dart';
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

    case ProductDetailScreen.routeName :
    final product = routeSettings.arguments as Product;
    return MaterialPageRoute(
      builder: (_)=>ProductDetailScreen(
        product: product));

    case AddressScreen.routeName :
    Map<String,dynamic> data = routeSettings.arguments as Map<String,dynamic>;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>AddressScreen(
        choosenAddress: data['choosenadress'],
        totalAmount: data['totalamount'],
      ));


    case ChangeAddress.routeName:
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>ChangeAddress());

    case WebviewScreen.routeName:
    final URL = routeSettings.arguments as String;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>WebviewScreen(
        URL: URL,
      ));

    case OrderDetailScreen.routeName:
    final order = routeSettings.arguments as Order;
    return MaterialPageRoute(
      settings: routeSettings,
      builder: (_)=>OrderDetailScreen(order: order));


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