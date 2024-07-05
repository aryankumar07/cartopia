import 'package:carousel_slider/carousel_slider.dart';
import 'package:cartopia/features/home/widgets/crousel_slider.dart';
import 'package:cartopia/features/product_detail/service/product_detail_service.dart';
import 'package:cartopia/features/product_detail/widgets/delivery_card.dart';
import 'package:cartopia/features/product_detail/widgets/product_owner_card.dart';
import 'package:cartopia/features/product_detail/widgets/rating_display.dart';
import 'package:cartopia/features/product_detail/widgets/review_card.dart';
import 'package:cartopia/models/product.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-detail';
  final Product product;
  const ProductDetailScreen({
    super.key,
    required this.product,
    });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  ProductDetailService productDetailService = ProductDetailService();

  double averageRating=0;
  double myRating = 0;

  void calculateRatings() {
    final user = Provider.of<userProvider>(context,listen: false).user;
    for(int i=0;i<widget.product.rating!.length;i++){
      if(widget.product.rating![i].userId == user.id){
        myRating = widget.product.rating![i].rating;
      }
      averageRating += widget.product.rating![i].rating;
    }
    averageRating = averageRating/widget.product.rating!.length;
    print(averageRating);
  }

  void addToCart(){
    productDetailService.addToCart(context: context, product: widget.product);
  }

@override
  void initState() {
    super.initState();
    calculateRatings();
  }


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userProvider>(context,listen: false).user;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_ios)),
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              child: CarouselSlider(
                items: widget.product.images.map((i){
                  return Builder(
                    builder: (BuildContext context){
                      return Image.network(
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        i);
                    });
                }).toList(), 
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  height: 400
                )),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                widget.product.category,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black38
                ),
              ),
            ),
            SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                widget.product.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 5),
              child: Row(
                children: [
                  Card(
                    elevation: 8,
                    shadowColor: Colors.blue,
                    child: Container(
                      height: 210,
                      width: MediaQuery.of(context).size.width/2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(
                        //   color: Colors.black
                        // ),
                        borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                      child: ProductOwnerCard(price: widget.product.price,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      child: Column(
                        children: [
                          Card(
                            elevation: 6,
                            shadowColor: Colors.blueGrey,
                            child: Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width/2-50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(
                                //   color: Colors.black
                                // ),
                                borderRadius: BorderRadius.all(Radius.circular(16))
                              ),
                              child: DeliveryCard(),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Card(
                            elevation: 6,
                            shadowColor: Colors.blueGrey,
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width/2-50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(
                                //   color: Colors.black
                                // ),
                                borderRadius: BorderRadius.all(Radius.circular(16))
                              ),
                              child: Builder(
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: (){
                                      print('tapped');
                                      Scaffold.of(context).showBottomSheet(
                                        enableDrag: true,
                                        showDragHandle: true,
                                        sheetAnimationStyle: AnimationStyle(
                                          duration: Duration(seconds: 2),
                                          reverseDuration: Duration(seconds: 2),
                                        ),
                                        (BuildContext context) {
                                          return RatingDisplay(product: widget.product,rating: myRating,);
                                        }
                                      );
                                    },
                                    child: ReviewCard(
                                      rating: 4,
                                      product: widget.product,));
                                }
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            if(user.type=='user')...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){}, child: Text('Buy Now')),
                  ElevatedButton(onPressed: addToCart, child: Text('Add To Cart')),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}