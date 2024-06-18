import 'package:cartopia/features/search/screen/search_screen.dart';
import 'package:flutter/material.dart';

class infoBar extends StatefulWidget{

  @override
  State<infoBar> createState() => _infoBarState();
}

class _infoBarState extends State<infoBar> {

  final TextEditingController searchController = TextEditingController();

  void naviagetToSearchScreen(){
    // print('navigating to a screen');
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: searchController.text);
  }
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))
              ),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'search for the product',
                  ),
                ),
                    ),
          ),
        GestureDetector(
          onTap: naviagetToSearchScreen,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Icon(Icons.search,color: Colors.white,),
            ),
        )
        ],
      );
  }
}