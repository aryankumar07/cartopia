import 'package:cartopia/common/widgets/bottom_bar.dart';
import 'package:cartopia/features/account/screens/admin_screen.dart';
import 'package:cartopia/features/auth/screen/auth_screen.dart';
import 'package:cartopia/features/auth/services/auth_service.dart';
// import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:cartopia/provider/user_provider.dart';
import 'package:cartopia/router.dart';
import 'package:flutter/material.dart';
import 'package:cartopia/constants/global_var.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => UserProvider(),
      )
    ],
    child: Myapp()));
}

class Myapp extends StatefulWidget{
  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUser(context: context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Cartopia ',


      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
        )
      ),

      onGenerateRoute: (settings)=> generateRoute(settings),

      home: Provider.of<UserProvider>(context).user.token.isNotEmpty ? 
            Provider.of<UserProvider>(context).user.type=='user'?  BottomBar() : AdminScreen()
            :
            AuthScreen()
    );
  }
}