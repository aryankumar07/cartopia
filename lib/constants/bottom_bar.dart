import 'package:cartopia/features/account/screen/account_screen.dart';
import 'package:cartopia/features/cart/screen/cart_screen.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {

  static const String routeName = '/actual-home';


  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _page = 0;

  final List<Widget> pages = [
    HomeScreen(),
    AccountScreen(),
    CartScreen()
  ];

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
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
              child: Icon(Icons.person),
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
              child: Icon(Icons.shopping_bag),
            )),
        ]),
    );
  }
}