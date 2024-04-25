import 'package:cartopia/common/widgets/loader.dart';
import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/features/home/widgets/address_box.dart';
import 'package:cartopia/features/product_detail/screens/product_detail_screen.dart';
import 'package:cartopia/features/search/service/search_service.dart';
import 'package:cartopia/features/search/widgets/search_product.dart';
import 'package:cartopia/model/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const  String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({
    required this.searchQuery,
    super.key
    });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<Product>? products;
  SearchService searchService = SearchService();
  
  void navigateToSearchScreen(String query){
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: query);
  }

   @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  void fetchSearchedProduct() async {
    products = await searchService.fetchSearchProducts(
      context: context,
      searchQuery: widget.searchQuery
      );
    
    print(products);
      setState(() {});
  }

  void navigateToProductDetail(Product product){
    Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return products == null ? Loader()  : Scaffold(
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
      body: Column(
        children: [
          AddressBox(),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemCount: products!.length,
              itemBuilder: (context,index){
                return  GestureDetector(
                  onTap: ()=>navigateToProductDetail(products![index]),
                  child: SearchProduct(product: products![index]));
            }))
        ],
      )
    );
  }
}