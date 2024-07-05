import 'package:cartopia/features/account/widget/single_product.dart';
import 'package:cartopia/features/admin/services/admin_service.dart';
import 'package:cartopia/features/product_detail/screen/product_detail_screen.dart';
import 'package:cartopia/models/product.dart';
import 'package:flutter/material.dart';

class OrderPlacedScreen extends StatefulWidget {
  const OrderPlacedScreen({super.key});

  @override
  State<OrderPlacedScreen> createState() => _OrderPlacedScreenState();
}

class _OrderPlacedScreenState extends State<OrderPlacedScreen> {

  AdminService adminService = AdminService();

  List<Product> productList=[];

  void fetchadminorders()async{
    productList = await adminService.fetchOrderPlaced(context: context);
    setState(() {});
  }


  @override
  void initState() {
    super.initState();
    fetchadminorders();
  }



  @override
  Widget build(BuildContext context) {
    return productList.length==0 ? 
    Container(
      child: Text('Wait till we are fetching your orders/no ordes found'),
    )
    : GridView.builder(
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
      itemBuilder: (context,index){
        final product = productList![index];
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
                      ],
                    )
                  ],
                ),
              ),
            );
      });
  }
}