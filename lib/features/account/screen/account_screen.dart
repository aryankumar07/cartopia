import 'package:cartopia/features/account/widget/account_top_bar.dart';
import 'package:cartopia/features/account/widget/profile_bar.dart';
import 'package:cartopia/features/account/widget/single_product.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  List<String> productList = [
    'https://images.unsplash.com/photo-1524289286702-f07229da36f5?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1515940279136-2f419eea8051?q=80&w=3027&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1504274066651-8d31a536b11a?q=80&w=2448&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1533675180235-0ba57d720b51?q=80&w=3071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];



  @override
  Widget build(BuildContext context) {
  final user = Provider.of<userProvider>(context).user;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
                child: AccountTopBar(),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20,left: 10,right: 10),
                child: ProfileBar(user: user),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40,left: 10,right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Essentials',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      ),
                    ),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.shop_2),
                      title: Text('Your Orders'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.add_task_outlined),
                      title: Text('WishList'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.sell_rounded),
                      title: Text('Turn seller'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      onTap: (){},
                      leading: Icon(Icons.logout),
                      title: Text('Log Out'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),

            Container(
              height: 170,
              padding: EdgeInsets.only(top: 10,left: 10,right: 0,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                itemBuilder: (context,index){
                  return SingleProduct(imageUrl: productList[index],);
                }),
            )

          ],
        ),
      ),
    );
  }
}