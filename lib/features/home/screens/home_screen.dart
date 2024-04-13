import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/features/home/widgets/address_box.dart';
import 'package:cartopia/features/home/widgets/crousel_image.dart';
import 'package:cartopia/features/home/widgets/newset_product.dart';
import 'package:cartopia/features/home/widgets/top_categories.dart';
import 'package:cartopia/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
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
              Expanded(
                child: Container(
                  height: 42,
                  margin: EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: (){},
                          child: Padding(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                            ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.only(top: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide.none
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1, 
                          )
                        ),
                        hintText: 'Search a painting',
                        hintStyle: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        )
                      ),
                    ),
                  )
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Icon(Icons.mic),
                    ),
              )
            ],
          ),
        )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressBox(),
            TopCategories(),
            Container(
              alignment: Alignment.topLeft,
              child: Text('Deal of the days'),
            ),
            ClImages(),
            SizedBox(height: 30,),
            NewProduct(),
          ],
        ),
      )
    );
  }
}