import 'package:cartopia/constants/bottom_bar.dart';
// import 'package:cartopia/features/auth/home/screens/home_screen.dart';
import 'package:cartopia/features/auth/screens/auth_screen.dart';
import 'package:cartopia/features/auth/service/auth_service.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:cartopia/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=> userProvider(),)
    ],
    child: Myapp()));
}

class Myapp extends StatefulWidget{
  Myapp({
    super.key,
  });

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  final AuthService authService = AuthService();

  @override
  void initState() {
    authService.getuserdata(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ETSY',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.green,
          iconTheme: IconThemeData(
            color: Colors.black
          )
        ),
        primarySwatch: Colors.green
      ),
      onGenerateRoute: (routeSettings) => generateRoute(routeSettings) ,
      home: Provider.of<userProvider>(context).user.token.isNotEmpty ? BottomBar() : AuthScreen(),
    );
  }
}