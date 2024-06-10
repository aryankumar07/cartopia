import 'dart:convert';

import 'package:cartopia/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void HttpErrorhandler({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onpresed,
}){
  switch(response.statusCode) {
    case 200 :
    onpresed();
    break;
    case 400:
    showsnackbar(context, jsonDecode(response.body)['msg']);
    case 500:
    showsnackbar(context, jsonDecode(response.body)['error']);
    default:
    showsnackbar(context, response.body);
  }
}