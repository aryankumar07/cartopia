import 'package:cartopia/features/admin/screens/add_product_screen.dart';
import 'package:cartopia/features/admin/screens/order_placed_screen.dart';
import 'package:cartopia/features/admin/screens/post_screen.dart';
import 'package:cartopia/models/product.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  int _page = 0;

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }

  List<Widget> adminList = [
    PostScreen(),
    Center(child: Text('analtics'),),
    // Center(child: Text('inbox'),),
    OrderPlacedScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome to Etst',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400
              ),
            ),
            Text(
              'Admin',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: updatePage,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        backgroundColor: Colors.white,
        iconSize: 24,
        items: [

          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: 52,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(
                  color: _page==0 ?  Colors.black : Colors.white,
                  width: 5
                ))
              ),
              child: Icon(Icons.home),
            )),

            BottomNavigationBarItem(
              label: '',
              icon: Container(
              width: 52,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(
                  color: _page==1 ?  Colors.black : Colors.white,
                  width: 5
                ))
              ),
              child: Icon(Icons.analytics),
            )),

            BottomNavigationBarItem(
              label: '',
              icon: Container(
              width: 52,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(
                  color: _page==2 ?  Colors.black : Colors.white,
                  width: 5
                ))
              ),
              child: Icon(Icons.all_inbox_outlined),
            ))
        ]),

        body: adminList[_page],

    );
  }
}