import 'package:cartopia/models/user.dart';
import 'package:flutter/material.dart';

class userProvider extends ChangeNotifier {
  User _user = User(
    name: '', 
    email: '', 
    password: '', 
    id: '', 
    address: [], 
    type: '', 
    token: '',
    cart: [],
    );

    User get user => _user;

    void setUser(String user){
      _user = User.fromJson(user);
      notifyListeners();
    }

    void setUserFromModel(User user){
      _user = user;
      notifyListeners();
    }

}