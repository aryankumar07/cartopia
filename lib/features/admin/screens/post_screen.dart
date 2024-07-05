import 'package:cartopia/constants/loader.dart';
import 'package:cartopia/features/account/widget/single_product.dart';
import 'package:cartopia/features/admin/screens/add_product_screen.dart';
import 'package:cartopia/features/product_detail/screen/product_detail_screen.dart';
import 'package:cartopia/models/product.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  void navigateToaddProductScreen() async {
    final result = await Navigator.pushNamed(context, AddProductScreen.routeName);
    if(result==true){
      final userId = Provider.of<userProvider>(context,listen: false).user.id;
      getProducts(userId);
    }
  }

  List<Product>? products;

  void getProducts(String userId)async{
    products = await adminService.getProducts(context: context, userId: userId);
    // print(products);
    setState(() {});
  }

  void deleteProduct(String productId) async {
    bool deleted = await adminService.detleteProduct(context: context, productId: productId);
    if(deleted){
      final userId = Provider.of<userProvider>(context,listen: false).user.id;
      getProducts(userId);
    }
  }
  
    @override
  void initState(){
    super.initState();
    // print('getting the product in the init state');
    final userId = Provider.of<userProvider>(context,listen: false).user.id;
    getProducts(userId);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: products==null ? Loader() 
      : Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: products!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
          itemBuilder: (context,index){
            final product = products![index];
            return Container(
              margin: EdgeInsets.all(5),
              child: GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: product);
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 130,
                      child: SingleProduct(imageUrl: product.images[0])),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                              product.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                        ),
                        
                        IconButton(
                          onPressed: (){
                            deleteProduct(product.id!);
                          }, 
                          icon: Icon(Icons.delete_outline))
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
         tooltip: 'Add a product',
         shape: CircleBorder(),
        child: Icon(Icons.add),
        onPressed: navigateToaddProductScreen),
    );
  }
}