import 'package:cartopia/features/account/service/account_service.dart';
import 'package:cartopia/features/account/widget/account_top_bar.dart';
import 'package:cartopia/features/account/widget/profile_bar.dart';
import 'package:cartopia/features/account/widget/single_product.dart';
import 'package:cartopia/features/order_detail/screen/order_detail_screen.dart';
import 'package:cartopia/models/order.dart';
import 'package:cartopia/models/product.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  final AccountService accountService = AccountService();

  List<Order> orderList=[];

  Map<String,int> imageUrlMap={};
  List<String> imageUrl=[];

  void getorderList() async {
    orderList = await accountService.getUserOrders(context: context);
    for(int i=0;i<orderList.length;i++){
      List<Product> productList = orderList[i].products;
      for(int j=0;j<productList.length;j++){
        imageUrlMap[productList[j].images[0]]=i;
        imageUrl.add(productList[j].images[0]);
      }
    }
    print(imageUrlMap);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getorderList();
  }



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
                      onTap: ()async{
                        List<Order> orders= await accountService.getUserOrders(context: context);
                        print(orders);
                      },
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
              width: double.infinity,
              padding: EdgeInsets.only(top: 10,left: 10,right: 0,bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: orderList.length==0? 
              Text('No Orders Placed') 
              : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrl.length,
                itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      int pos = imageUrlMap[imageUrl[index]]!;
                      print(pos);
                      Navigator.pushNamed(
                        context, 
                        OrderDetailScreen.routeName,
                        arguments: orderList[pos]);
                    },
                    child: SingleProduct(imageUrl: imageUrl[index]));
                }),
            )

          ],
        ),
      ),
    );
  }
}