import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cartopia/common/custom_button.dart';
import 'package:cartopia/common/custom_tfield.dart';
import 'package:cartopia/constants/utils.dart';
import 'package:cartopia/features/admin/services/admin_service.dart';
import 'package:cartopia/features/home/widgets/crousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

final AdminService adminService = AdminService();

class AddProductScreen extends StatefulWidget {
  static const String routeName  = 'admin/add-product';
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  final TextEditingController productController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController qunatityController = TextEditingController();

  String current = 'Painting';

  List<File> images=[];

  final _addProductformkey = GlobalKey<FormState>();

  List<String> artForms =[
    'Painting', 
    'Sculpture',
    'Architecture',
    'Literature',
    'Cinema',
    'Theatre',
    'Music'
  ];

  void pickimages() async {
    List<File> res = await pickImages();
    print(res);
    setState(() {
      images = res;
    });
  }

  @override
  void dispose() {
    super.dispose();
    productController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    qunatityController.dispose();
  }
  
  void refershPage(){

  }

  void sellproduct(){
    if(images.isNotEmpty){
      adminService.sellProduct(
        context: context, 
        name: productController.text, 
        description: descriptionController.text, 
        category: current, 
        price: double.parse(priceController.text), 
        quantity: double.parse(qunatityController.text),
        images: images,
        // onpressed: refershPage, 
        );
    }else{
      showsnackbar(context, 'No images added');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 60),
            child: Text(
              'ADD PRODUCT',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.white
              ),
              ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Form(
            key: _addProductformkey,
            child: Column(
              children: [
                images.isNotEmpty ?
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    height: 150,
                  ),
                  items: images.map((e){
                    return Builder(
                      builder: (BuildContext context){
                        return Image.file(
                          e,
                          height: 150,
                          fit: BoxFit.fill,
                          );
                      });
                  }).toList(),
                )
                : GestureDetector(
                  onTap: pickimages,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(16),
                    dashPattern: [10,4],
                    strokeCap: StrokeCap.round,
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            Icon(Icons.folder),
                            Text('Select Product Images')
                          ],
                        ),
                      ),
                    )),
                ),

                  SizedBox(height: 30,),

                  CustomTextField(controler: productController, hinttext: 'Enter Product Name'),
                  SizedBox(height: 10,),

                  CustomTextField(controler: descriptionController, hinttext: 'Enter the product description',maxlines: 7,),
                  SizedBox(height: 10,),

                  CustomTextField(controler: priceController, hinttext: 'Product price'),
                  SizedBox(height: 10,),

                  CustomTextField(controler: qunatityController, hinttext: 'Stock'),

                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: current,
                      icon: Icon(Icons.arrow_drop_down),
                      items: artForms.map((String item){
                        return DropdownMenuItem(
                          value: item,
                          child: Container(child: Text(item)));
                      }).toList(), 
                      onChanged: (dynamic newval){
                        setState(() { 
                          current = newval!;
                        });
                      }),
                  ),
                  
                  SizedBox(height: 10,),
                  
                  CustomButton(
                    text: 'Sell product', 
                    onTap: sellproduct)
              ],
            ),
          ),
        ),
      ),
    );
  }
}