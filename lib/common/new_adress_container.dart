import 'package:cartopia/common/custom_tfield.dart';
import 'package:flutter/material.dart';

class NewAdressContainer extends StatelessWidget{

  final _addressFormkey = GlobalKey<FormState>();
  final TextEditingController flattextController;
  final TextEditingController areatextController;
  final TextEditingController pincodetextController;
  final TextEditingController towntextController;

  NewAdressContainer({
    super.key,
    required this.flattextController,
    required this.areatextController,
    required this.pincodetextController,
    required this.towntextController
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Form(
        key: _addressFormkey,
        child: Column(
          children: [
            SizedBox(height: 10,),
            CustomTextField(
              controler: flattextController, 
              hinttext: 'Flat,House No,Building'),
            SizedBox(height: 10,),
            CustomTextField(
              controler: areatextController, 
              hinttext: 'Area/Stret'),
            SizedBox(height: 10,),
            CustomTextField(
              controler: pincodetextController, 
              hinttext: 'Pincode'),
            SizedBox(height: 10,),
            CustomTextField(
              controler: towntextController, 
              hinttext: 'Town/City'),
            SizedBox(height: 10,),
          ],
        )),
    );
  }
}