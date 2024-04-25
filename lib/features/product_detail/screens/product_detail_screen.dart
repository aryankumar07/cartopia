import 'package:carousel_slider/carousel_slider.dart';
import 'package:cartopia/common/widgets/custom_button.dart';
import 'package:cartopia/common/widgets/stars.dart';
import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/features/search/screen/search_screen.dart';
import 'package:cartopia/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


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


  void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: query);
  }



  @override
  Widget build(BuildContext context) {
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
                      onFieldSubmitted: navigateToSearchScreen,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                  children: [
                    Text(
                    widget.product.id!,
                    ),
                    Stars(ratings: 4),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Text(
                  widget.product.name
                ),
                ),
            CarouselSlider(
              items: widget.product.images.map((e){
              return Builder(
                builder: (BuildContext context) {
                  return Image.network(
                    e,
                    fit: BoxFit.cover,
                    height: 200,
                  );
                });
              }).toList(), 
              options: CarouselOptions(
              // viewportFraction: 1,
              height: 300
            )),
        
            SizedBox(height: 10,),
        
            Container(
              color: Colors.grey,
              height: 10,
            ),
        
            SizedBox(height: 10,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Creater Price : ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  ),
                ),
        
                Text(
                  '\$${widget.product.price}',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.normal,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
        
            Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.product.description,
                    style: TextStyle(),
                  ),
                ),
        
            Container(
              color: Colors.grey,
              height: 10,
            ),
            SizedBox(height: 10,),
        
            CustomButton(
              text: 'Buy Now', 
              onTap: (){}),
            SizedBox(height: 20,),
            CustomButton(
              text: 'Add To Cart', 
              onTap: (){},
              color: Color.fromRGBO(209, 155, 119, 0.1),),

            SizedBox(height: 10,),
            Text(
              'Rate The Product',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),

            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context,_)=>Icon(Icons.star,color: GlobalVariables.secondaryColor,), 
              onRatingUpdate: (rating){}),

            ],
          ),
        ),
    );
  }
}