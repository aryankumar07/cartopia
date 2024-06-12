import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountTopBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.qr_code_scanner),
        Icon(Icons.settings)
      ],
    );
  }
}