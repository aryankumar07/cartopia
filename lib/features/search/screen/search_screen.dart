import 'package:cartopia/constants/loader.dart';
import 'package:cartopia/features/search/service/search_service.dart';
import 'package:cartopia/features/search/widgets/product_card.dart';
import 'package:cartopia/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {

   static const String routeName = '/search-screen';

   final String searchQuery;

  const SearchScreen({
    super.key,
    required this.searchQuery
    });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<Product>? products;

  SearchService searchService = SearchService();

  void fetchthesearchedProduct() async {
    products = await searchService.fetchSearchProducts(context: context, query: widget.searchQuery);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchthesearchedProduct();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton.filledTonal(
          onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: products==null ? Loader() : Center(
        child: ListView.builder(
          itemCount: products!.length,
          itemBuilder: (context,index){
            Product product = products![index];
            return ProductCard(
              product: product,
            );
          }),
      ),
    );
  }
}