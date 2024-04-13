import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewProduct extends StatefulWidget {
  const NewProduct({super.key});

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(8),
          child: Text(
            'Newest Product',
            style: TextStyle(
              fontSize: 20
            ),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1578301978859-714d194a5abf?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGFydCUyMGRyYXdpbmd8ZW58MHx8MHx8fDA%3D',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(15),
          child: Text(
            'Created by : ${user.name}',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network('https://images.unsplash.com/photo-1580193090099-5f31cf4e7202?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGFydCUyMGRyYXdpbmd8ZW58MHx8MHx8fDA%3D',fit: BoxFit.cover,height: 100,width: 100,),
              Image.network('https://images.unsplash.com/photo-1580196969807-cc6de06c05be?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGFydCUyMGRyYXdpbmd8ZW58MHx8MHx8fDA%3D',fit: BoxFit.cover,height: 100,width: 100,),
              Image.network('https://images.unsplash.com/photo-1547891654-e66ed7ebb968?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YXJ0fGVufDB8fDB8fHww',fit: BoxFit.cover,height: 100,width: 100,),
              Image.network('https://images.unsplash.com/photo-1561214115-f2f134cc4912?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGFydHxlbnwwfHwwfHx8MA%3D%3D',fit: BoxFit.cover,height: 100,width: 100,)
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(10),
          child: Text(
            'More By ${user.name}',
            style: TextStyle(
              color: GlobalVariables.selectedNavBarColor
            ),
          ),
        )
      ],
    );
  }
}