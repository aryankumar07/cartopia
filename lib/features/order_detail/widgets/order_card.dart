import 'package:cartopia/models/product.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget{

  final Product product;
  final int quantity;

  OrderCard({
    super.key,
    required this.product,
    required this.quantity,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              width: 150,
              child: Image.network(product.images[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Container(
                // height: 60,
                width: MediaQuery.of(context).size.width/2,
                child: Text(
                  '${product.name} hbcww9 c9w cwc wcnw0cw cwnwnnowc wncwnwc',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis
                  ),
                  ),
              ),
              Row(
                children: [
                  Text('Quantity : '),
                  Text('$quantity'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}