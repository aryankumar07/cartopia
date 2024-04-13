import 'package:cartopia/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget{

  AddressBox({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 114, 226, 221),
          Color.fromARGB(255, 162, 236, 233)  
        ])
      ),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined,size: 20,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Delivert to :- ${user.name}-${user.address }',
                style: TextStyle(
                  fontWeight: FontWeight.w500
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )),
            Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.arrow_drop_down_outlined,size: 18 ,),
              )
        ],
      ),
    );
  }
}