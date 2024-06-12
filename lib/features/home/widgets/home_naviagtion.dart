import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:cartopia/features/home/widgets/crousel_slider.dart';
import 'package:cartopia/features/home/widgets/search_bar.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {

  bool _option1 = true;
  bool _option2 = false;

  void changeToart(){
    setState(() {
      _option1 = true;
      _option2 = false;
    });
  }

  void changeToaddProduct(){
    setState(() {
      _option1 = false;
      _option2 = true;
    });
  }

  


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userProvider>(context).user;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 20),
          height: 100,
          decoration: BoxDecoration(
            color: Colors.brown
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${user.name} | ${user.email}',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    Text(
                      'Deliver To',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: GestureDetector(
                      onTap: changeToart,
                      child: Container(
                        child: Text(
                          'Arts',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                          ),
                          ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15),
                    child: GestureDetector(
                      onTap: changeToaddProduct,
                      child: Container(
                        child: Text(
                          'Categroies',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.white
                          ),
                          ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

        if(_option1)...[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: infoBar(),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Sweet Hot Deals of the Month',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
          CrouselImageSlider(),
        ],

        if(_option2)...[
          Text('prodcuts column')
        ]

      ],
    );
  }
}