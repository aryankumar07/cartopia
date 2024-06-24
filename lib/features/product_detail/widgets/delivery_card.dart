import 'package:flutter/material.dart';

class DeliveryCard extends StatefulWidget {
  const DeliveryCard({super.key});

  @override
  State<DeliveryCard> createState() => _DeliveryCardState();
}

class _DeliveryCardState extends State<DeliveryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.shopping_cart_checkout_rounded,color: Colors.green,),
              SizedBox(width: 15,),
              Text('In Stock')
            ],
          ),
          SizedBox(height: 20,),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: Colors.grey
            ),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Icon(Icons.event_available_rounded,color: Colors.black,),
              Container(
                width: MediaQuery.of(context).size.width/2-100,
                child: Text(
                  'delivery Tomorow',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}