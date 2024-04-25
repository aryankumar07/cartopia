import 'package:carousel_slider/carousel_slider.dart';
import 'package:cartopia/constants/global_var.dart';
import 'package:flutter/material.dart';

class ClImages extends StatelessWidget{
  ClImages({
    super.key
  });

  @override
  Widget build(BuildContext context) { 
    return CarouselSlider(
      items: GlobalVariables.carouselImages.map((e){
        return Builder(
          builder: (BuildContext context) {
            return Image.network(
              e,
              fit: BoxFit.cover,
              height: 200,
              );
          });
      }).toList(), 
      options: CarouselOptions(
        // viewportFraction: 1,
        height: 200
      ));
  }
}