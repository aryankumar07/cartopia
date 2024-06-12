import 'package:carousel_slider/carousel_slider.dart';
import 'package:cartopia/common/global_data.dart';
import 'package:flutter/material.dart';

class CrouselImageSlider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: GlobalData.deals.map((i){
        return Builder(
          builder: (BuildContext context){
            return Image.network(
              fit: BoxFit.fill,
              height: 200,
              width: double.infinity,
              i);
          });
      }).toList(), 
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 1,
        height: 200
      ));
  }
}