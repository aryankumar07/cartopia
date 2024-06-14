import 'package:cartopia/constants/loader.dart';
import 'package:cartopia/features/account/widget/single_product.dart';
import 'package:cartopia/features/home/screens/home_screen.dart';
import 'package:cartopia/features/home/service/home_service.dart';
import 'package:cartopia/models/product.dart';
import 'package:flutter/material.dart';

class CategoryDisplay extends StatefulWidget {

  static const String routeName = '/category-deals';

  final String category;


  const CategoryDisplay({
    super.key,
    required this.category
  });

  @override
  State<CategoryDisplay> createState() => _CategoryDisplayState();
}

class _CategoryDisplayState extends State<CategoryDisplay> {

  List<Product>? products;
  HomeService homeService = HomeService();

  void fetchtheproducts() async {
    products = await homeService
    .getCategoryProduct(
      context: context, 
      category: widget.category);
      setState(() {});

  }

  @override
  void initState() {
    super.initState();
    fetchtheproducts();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_ios)),
      ),
      body:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 20),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Displaying Arts for : ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w400
                      )
                    ),
                    TextSpan(
                      text: widget.category,
                      style: TextStyle(
                        color: Colors.brown,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ]
                )),
            ),

            products==null ? Loader() : 
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                  ), 
                  itemCount: products!.length,
                  itemBuilder: (context,index){
                    final product = products![index];
                    return Container(
                    padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 110,
                        child: SingleProduct(imageUrl: product.images[0])),
                        SizedBox(height: 10,),
                        Text(
                              product.name,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal
                              ),
                            ),
                    ],
                  ),
                );;
                  }),
            ),

          ],
        )
    );
  }
}