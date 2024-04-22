import 'package:cartopia/common/widgets/loader.dart';
import 'package:cartopia/features/accounts/widgets/single_product.dart';
import 'package:cartopia/features/admin/screens/add_product_screen.dart';
import 'package:cartopia/features/admin/service/admin_service.dart';
import 'package:cartopia/model/product.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final AdminService adminService = AdminService();
  List<Product>? products=[]; 

  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  void fetchAllProducts() async {
    products =  await adminService.fetchAllProduct(context);
    print(products);
    setState(() {});
  }

  void deleteProduct(String pId) async {
    final res = adminService.deleteProduct(context,pId);
    fetchAllProducts();
  }

  void navigateToADDProduct(){
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return products == null ? Loader() : Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2), 
          itemBuilder: (context,index){
            final productdata = products![index];
            return Column(
              children: [
                SizedBox(
                  height: 140,
                  child: SingleProduct(
                    link: productdata.images[0]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        productdata.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    IconButton(
                      onPressed: ()=>deleteProduct(productdata.id!), 
                      icon: Icon(Icons.delete_outline))
                  ],
                )
              ],
            );
          }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToADDProduct,
        tooltip: 'ADD A PRODUCT',
        child: Icon(Icons.add),
        ),
    );
  }
}