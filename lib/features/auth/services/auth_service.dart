import 'dart:convert';
import 'package:cartopia/common/widgets/bottom_bar.dart';
import 'package:cartopia/constants/error_handle.dart';
import 'package:cartopia/constants/secret.dart';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:cartopia/model/user_model.dart';
import 'package:cartopia/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthService {

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try{

      User user = User(
        id: '', 
        name: name,
        email: email,
        password: password, 
        address: '', 
        type: '', 
        token: '');

        print(user);

      
      http.Response res = await http.post(
        Uri.parse('$uri/admin/signup'), 
        body: jsonEncode({
          "email" : email,
          "password" : password,
          "name" : name,
        }),
        headers: {
          "Content-Type" : "application/json; charset=UTF-8"
        }
        );

        print(res.body);

        httpErrorHandle(
          response: res, 
          context: context, 
          onSuccess: (){
            ShowSnackBar(context, 
            'Account Created! login with same credentials ');
          });
        
    }catch(e){
      ShowSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try{

      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'), 
        body: jsonEncode({
          "email" : email,
          "password" : password,
        }),
        headers: {
          "Content-Type" : "application/json; charset=UTF-8"
        }
        );

        print(res.body);

        httpErrorHandle(
          response: res, 
          context: context, 
          onSuccess:  () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context,listen: false).setUser(res.body);
            await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
            Navigator.pushNamedAndRemoveUntil(
              context, 
              BottomBar.routeName, 
              (route) => false);
          });
        
    }catch(e){
      ShowSnackBar(context, e.toString());
    }
  }

  void getUser({
    required BuildContext context, 
  }) async {
    print('getting user');
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token =  prefs.get('x-auth-token').toString();
      print('the token is $token');
      if(token==null){
        prefs.setString('x-auth-token', '');
      }
      http.Response res = await http.post(
        Uri.parse('$uri/tokenIsValid'), 
        headers: {
          "Content-Type" : "application/json; charset=UTF-8",
          "x-auth-token" : token,
        }
        );

        var resposne = jsonDecode(res.body);
        print('the response we got is : $resposne');
        if(res.statusCode==200){
          //geting user data
          http.Response res = await http.get(
            Uri.parse('$uri/'),
            headers: <String,String>{
              'Content-Type' : 'application/json; charset=UTF-8',
              'x-auth-token' : token
            }
          );
          print('after getting user body');
          print(res.body);
          var userProvider = Provider.of<UserProvider>(context,listen: false);
          userProvider.setUser(res.body); 
        } 
        
    }catch(e){
      ShowSnackBar(context, e.toString());
    }
  }

}