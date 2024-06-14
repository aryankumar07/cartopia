import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget{

  final String imageUrl;
  final String category;
  final String desciption;
  final bool pos;

  CategoryCard({
    super.key,
    required this.imageUrl,
    required this.category,
    required this.desciption,
    required this.pos
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16))
      ),
      child: Container(
        height: 200,
        child: Row(
          children: [
            if(pos)...[
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,),
                    ),
                  ),
                  Text(
                    category
                  )
                ],
              ),
              Container(
                width: 200,
                child: Text(
                  desciption,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.brown
                  ),
                ),
              )
            ]
            else...[
              Container(
                width: 200,
                child: Text(
                  desciption,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.brown
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16))
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,),
                    ),
                  ),
                  Text(
                    category
                  )
                ],
              ),
            ]
          ],
        ),
      ),
    );
  }
}