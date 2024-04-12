import 'dart:convert';

import 'package:cartopia/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}){
   switch(response.statusCode){
    case 200:
      onSuccess();
      break;
    case 400:
      ShowSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      ShowSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    default:
      ShowSnackBar(context, jsonDecode(response.body));
   }
}