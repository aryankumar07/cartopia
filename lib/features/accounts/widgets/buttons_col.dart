import 'package:cartopia/features/accounts/widgets/account_button.dart';
import 'package:flutter/material.dart';

class ButtonCol extends StatefulWidget {
  const ButtonCol({super.key});

  @override
  State<ButtonCol> createState() => _ButtonColState();
}

class _ButtonColState extends State<ButtonCol> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width/2-5,
              child: AccountButton(text: 'Your order', onTap: (){})),
            SizedBox(
              width: MediaQuery.of(context).size.width/2-5,
              child: AccountButton(text: 'Turn Seller', onTap: (){})),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width/2-5,
              child: AccountButton(text: 'Log Out', onTap: (){})),
            SizedBox(
              width: MediaQuery.of(context).size.width/2-5,
              child: AccountButton(text: 'WishList', onTap: (){})),
          ],
        ),
      ],
    );
  }
}