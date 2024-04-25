import 'package:cartopia/common/widgets/loader.dart';
import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/features/home/services/home_services.dart';
import 'package:cartopia/features/product_detail/screens/product_detail_screen.dart';
import 'package:cartopia/model/product.dart';
import 'package:flutter/material.dart';

class CategoryDealsScreen extends StatefulWidget {
static const String routeName = '/category-deals';
  final String category;
  const CategoryDealsScreen({
    super.key,
    required this.category,
    });

  @override
  State<CategoryDealsScreen> createState() => _CategoryDealsScreenState();
}

class _CategoryDealsScreenState extends State<CategoryDealsScreen> {
  HomeService homeService = HomeService();
  List<Product>? productList;  

  @override
  void initState() {
    super.initState();
    fetchCategoryProduct();
  }


  void fetchCategoryProduct() async {
    productList = await homeService.fetchCategoryProducts(
      context: context, 
      category: widget.category);
      setState(() {});
  }



  @override
  Widget build(BuildContext context) {

    void navigateToProductDetail(Product product){
      Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: product);
    }


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50), 
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient 
            ),
          ),
          title: Text(
            widget.category,
            style: TextStyle(
              color: Colors.black
            ),
            )
        )),
        body: productList==null ? Loader() : Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              alignment: Alignment.topLeft,
              child: Text(
                'keep looking for more ${widget.category} painting',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  overflow: TextOverflow.ellipsis
                ),
                ),
            ),
            SizedBox(
              height: 170,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15),
                itemCount: productList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.4,
                  mainAxisSpacing: 10
                  ),
                itemBuilder: (context,index){
                  final product = productList![index];
                  return GestureDetector(
                    onTap: ()=>navigateToProductDetail(product),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 130,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black12,
                                width: 0.5,
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(product.images[0]),
                            ),
                            ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            product.name,
                            style: TextStyle(
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
            )
          ],
        ),
    );
  }
}