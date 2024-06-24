import 'package:flutter/material.dart';

class ProductOwnerCard extends StatefulWidget {

  final double price;

  const ProductOwnerCard({
    super.key,
    required this.price,
  });

  @override
  State<ProductOwnerCard> createState() => _ProductOwnerCardState();
}

class _ProductOwnerCardState extends State<ProductOwnerCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 10,
          left: 10,
          child: CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage('https://plus.unsplash.com/premium_photo-1670282393309-70fd7f8eb1ef?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGdpcmx8ZW58MHx8MHx8fDA%3D'),
          ),
        ),

        Positioned(
          top: 5,
          right: 5,
          child: IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.arrow_circle_up_rounded,
              size: 30,
              )),
        ),

        Positioned(
          top: 100,
          left: 10,
          child: Container(
            child: Text(
              '\$${widget.price}.00',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: Colors.black
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 20,
          left: 10,
          child: Text(
            'Chat with Angellina',
            style: TextStyle(
              decoration: TextDecoration.underline
            ),
          ),
        )

      ],
    );
  }
}