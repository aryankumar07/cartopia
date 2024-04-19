import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/features/account/screens/post_screens.dart';
import 'package:cartopia/features/accounts/screens/account_screen.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottombarWidth =40;
  double bottomBArBorderWidth = 5;
  List<Widget> pages = [
    PostScreen(),
    Center(
      child: Text('Analytics Page'),
    ),
    Center(
      child: Text('Cart Page'),
    ),
  ];

  void updatePage(int page){
    setState(() {
      _page = page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient 
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/app_logo.png',
                  width: 80,
                  height: 100,
                ),
              ),

              Text(
                'Admin',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                  ),
              )
            ],
          ),
        )),
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
              child: Icon(Icons.all_inbox_outlined),
            )),
        ]
        ),
    );
  }
}