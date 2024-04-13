import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/features/accounts/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {

  List list = [
    'https://media.istockphoto.com/id/172858793/photo/aum-background.jpg?s=1024x1024&w=is&k=20&c=8ohhtVsbVsPwLaKZIJMeKrRZg1sIzbehvWtnsZhTiYA=',
    'https://media.istockphoto.com/id/172858793/photo/aum-background.jpg?s=1024x1024&w=is&k=20&c=8ohhtVsbVsPwLaKZIJMeKrRZg1sIzbehvWtnsZhTiYA=',
    'https://media.istockphoto.com/id/172858793/photo/aum-background.jpg?s=1024x1024&w=is&k=20&c=8ohhtVsbVsPwLaKZIJMeKrRZg1sIzbehvWtnsZhTiYA=',
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'See All',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: GlobalVariables.selectedNavBarColor
                ),
              ),
            ),
          ],
        ),

        Container(
          height: 170,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          padding: EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context,index){
              return SingleProduct(link: list[index]);
            }),
          )

      ],
    );
  }
}