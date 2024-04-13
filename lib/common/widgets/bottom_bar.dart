import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/features/accounts/screens/account_screen.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatefulWidget {
  static const String routeName = '/actual-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottombarWidth =40;
  double bottomBArBorderWidth = 5;
  List<Widget> pages = [
    HomeScreen(),
    AccountScreen(),
    Center(child: Text('Shopping page'),)
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
         currentIndex: _page,
         selectedItemColor: GlobalVariables.selectedNavBarColor,
         unselectedItemColor: GlobalVariables.unselectedNavBarColor,
         backgroundColor: GlobalVariables.backgroundColor,
         iconSize: 28,
         onTap: updatePage,

        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottombarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page==0 ? GlobalVariables.selectedNavBarColor 
                    : GlobalVariables.backgroundColor,
                    width: bottomBArBorderWidth 
                  )
                )
              ),
              child: Icon(Icons.home_outlined),
            )),

            BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottombarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page==1 ? GlobalVariables.selectedNavBarColor 
                    : GlobalVariables.backgroundColor,
                    width: bottomBArBorderWidth 
                  )
                )
              ),
              child: Icon(Icons.person_outline_outlined),
            )),

            BottomNavigationBarItem(
            label: '',
            icon: Container(
              width: bottombarWidth,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: _page==2 ? GlobalVariables.selectedNavBarColor 
                    : GlobalVariables.backgroundColor,
                    width: bottomBArBorderWidth 
                  )
                )
              ),
              child: badges.Badge(
                badgeContent: Text('2'),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: Colors.white
                ),
                child: Icon(Icons.shopping_cart_outlined),
              )
            )),


            
        ]
        ),
        
    );
  }
}