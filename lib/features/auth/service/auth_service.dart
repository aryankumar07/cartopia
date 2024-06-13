import 'dart:convert';
import 'package:cartopia/constants/bottom_bar.dart';
import 'package:cartopia/constants/error_handle.dart';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:cartopia/models/user.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cartopia/locker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try{
      User user = User(
        name: name, 
        email: email, 
        password: password, 
        id: '', 
        address: '', 
        type: '', 
        token: '');

        http.Response res = await http.post(
          Uri.parse('$baseUri/api/signup'),
          body : user.toJson(),
          headers: <String,String>{
            'Content-Type' : 'application/json; charset=UTF-8'
          }
        );

        HttpErrorhandler(
          response: res, 
          context:context , 
          onpresed: (){
            showsnackbar(
              context, 
              'Account created login with same credentails');
          });
        
      
    }catch(e){
      showsnackbar(context, e.toString());
    }
  }

  void signinuser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {

    try{
      http.Response res = await http.get(
        Uri.parse('$baseUri/api/signin'),
        headers: <String,String>{
          'Content-Type' : 'application/json; charset=UTF-8',
          'email' : email,
          'password' : password
        }
      );

      HttpErrorhandler(
        response: res, 
        context: context, 
        onpresed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<userProvider>(context,listen : false).setUser(res.body);
          prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(context, BottomBar.routeName,(route)=>false);
        });

    }catch(e){

      showsnackbar(context, e.toString());

    }
  }
  void getuserdata({
    required BuildContext context
  }) async {
    try{
      print('getting user data');
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('x-auth-token');
      print(token);
      if(token==null){
        pref.setString('x-auth-token','');
      }

      var tokenres = await http.post(
        Uri.parse('$baseUri/isValidToken'),
        headers: <String,String>{
          'Content-Type' : 'application/json charset=UTF-8',
          'x-auth-token' : token!,
        },
      );

      final response = jsonDecode(tokenres.body);

      if(response==true){
        // print('token is verified');
        http.Response userRes = await http.get(
          Uri.parse('$baseUri/'),
          headers: <String,String>{
          'Content-Type' : 'application/json charset=UTF-8',
          'x-auth-token' : token!,
        },
        );

        var userprovider = Provider.of<userProvider>(context,listen: false);
        userprovider.setUser(userRes.body);
      }else{
        // print('token not verified');
        showsnackbar(context, 'token not verified');
      }

    }catch(e){
      showsnackbar(context, e.toString());
    }
  }



}