import 'package:flutter/material.dart';

class GlobalVariables {
   static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 194, 210, 196),
      Color.fromARGB(255, 63, 70, 70),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(115, 96, 67, 1);
  static const backgroundColor = Color.fromARGB(255, 255, 255, 255);
  static const Color greyBackgroundCOlor = Color.fromARGB(255, 241, 243, 225);
  static var selectedNavBarColor = Color.fromARGB(255, 225, 208, 158)!;
  static const unselectedNavBarColor = Colors.black87;

   static const List<String> carouselImages = [
    'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dHlwZXMlMjBvZyUyMGFydHxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dHlwZXMlMjBvZyUyMGFydHxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/flagged/photo-1572392640988-ba48d1a74457?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8dHlwZXMlMjBvZyUyMGFydHxlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1579762715118-a6f1d4b934f1?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHR5cGVzJTIwb2clMjBhcnR8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1579541814924-49fef17c5be5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dHlwZXMlMjBvZyUyMGFydHxlbnwwfHwwfHx8MA%3D%3D',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'hardCover',
      'image': 'assets/images/hardcover.png',
    },
    {
      'title': 'Oil painting',
      'image': 'assets/images/oilPainting.png',
    },
    {
      'title': 'crayons',
      'image': 'assets/images/crayon.png',
    },
    {
      'title': 'water color',
      'image': 'assets/images/waterpaint.png',
    },
    {
      'title': 'wall',
      'image': 'assets/images/wall.png',
    },
  ];


}