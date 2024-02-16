import 'package:cartopia/Static/static_var.dart';
import 'package:cartopia/features/auth/screens/auth_screen.dart';
import 'package:cartopia/routes.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartopia',
      theme: ThemeData(
        scaffoldBackgroundColor: StaticVar.backgroundColor,
        colorScheme: ColorScheme.light(
          primary: StaticVar.secondaryColor,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          )
        )
      ),

      onGenerateRoute: (settings) =>  generateRoute(settings),
      home: AuthScreen()
    );
  }
}