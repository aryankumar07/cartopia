import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/features/home/screens/category_screen_deal.dart';
import 'package:flutter/material.dart';

class TopCategories extends StatefulWidget {
  const TopCategories({super.key});

  @override
  State<TopCategories> createState() => _TopCAtegoriesState();
}

class _TopCAtegoriesState extends State<TopCategories> {

  void NavigateToCategory(String category){
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,arguments: category ); 
  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: GlobalVariables.categoryImages.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: ()=>NavigateToCategory(GlobalVariables.categoryImages[index]['title']!),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20,top: 20),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50 ),
                    child: Image.asset(
                      GlobalVariables.categoryImages[index]['image']!,
                      fit: BoxFit.cover,
                      height: 40,
                       width: 40,
                      ),
                  ),
                ),
                Text(
                  GlobalVariables.categoryImages[index]['title']!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          );
        })),
    );
  }
}