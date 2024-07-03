import 'dart:convert';
import 'package:cartopia/common/new_adress_container.dart';
import 'package:cartopia/common/webview_screen.dart';
import 'package:cartopia/features/address/screens/change_address.dart';
import 'package:cartopia/features/cart/service/cart_service.dart';
import 'package:cartopia/locker.dart';
import 'package:cartopia/models/user.dart';
import 'package:cartopia/payment_configuration.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AddressScreen extends StatefulWidget {

  String choosenAddress;
  final String totalAmount; 

  static const String routeName = 'admin/address_screen';

  AddressScreen({
    super.key,
    required this.choosenAddress,
    required this.totalAmount,
  });

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {

  final CartService cartService = CartService();

  final TextEditingController flattextController = TextEditingController();
  final TextEditingController areatextController = TextEditingController();
  final TextEditingController pincodetextController = TextEditingController();
  final TextEditingController towntextController = TextEditingController();

  void storeaddress(){
    if(flattextController.text.isNotEmpty &&
       areatextController.text.isEmpty &&
       pincodetextController.text.isNotEmpty &&
       towntextController.text.isEmpty
    ){
      String newaddress = flattextController.text+" "+areatextController.text+" "+pincodetextController.text+" "+towntextController.text;
      widget.choosenAddress = newaddress;
      cartService.addnewAddress(context: context, address: newaddress);
    }
  }

Future<void> navigateToChangeaddress()async{
    widget.choosenAddress = await Navigator.pushNamed(context, ChangeAddress.routeName) as String;
    setState(() {});
  }

  String payment_string = PaymentConfigurationjson.defaultGooglePay;

  void onGooglePayResult(paymentResult) {
    if(flattextController.text.isNotEmpty &&
       areatextController.text.isEmpty &&
       pincodetextController.text.isNotEmpty &&
       towntextController.text.isEmpty
    ){
      String newaddress = flattextController.text+" "+areatextController.text+" "+pincodetextController.text+" "+towntextController.text;
      widget.choosenAddress = newaddress;
      cartService.addnewAddress(context: context, address: newaddress);
    }
    cartService.placeorder(
      context: context, 
      address: widget.choosenAddress, 
      totalsum: double.parse(widget.totalAmount));
  }

  void placeorder(){
    if(flattextController.text.isNotEmpty &&
       areatextController.text.isNotEmpty &&
       pincodetextController.text.isNotEmpty &&
       towntextController.text.isEmpty
    ){
      String newaddress = flattextController.text+" "+areatextController.text+" "+pincodetextController.text+" "+towntextController.text;
      widget.choosenAddress = newaddress;
      cartService.addnewAddress(context: context, address: newaddress);
    }
    cartService.placeorder(
      context: context, 
      address: widget.choosenAddress, 
      totalsum: double.parse(widget.totalAmount));
  }

  List<PaymentItem> paymentItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    paymentItems.add(PaymentItem(
      amount: widget.totalAmount,
      label: 'Total Amount',
      status: PaymentItemStatus.final_price
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios)),
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            SizedBox(
              height: 52,
              child: ListTile(
                title: Text('Deliver to :- ${widget.choosenAddress}'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: navigateToChangeaddress,
              ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width/2-10,
                    decoration: BoxDecoration(
                      color: Colors.grey
                    ),
                  ),
                  Text('OR',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.grey),),
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width/2-20,
                    decoration: BoxDecoration(
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: NewAdressContainer(
                  flattextController: flattextController, 
                  areatextController: areatextController, 
                  pincodetextController: pincodetextController, 
                  towntextController: towntextController),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: ()async{
                  placeorder();
                  // storeaddress();
                //   http.Response response = await http.post(
                //   Uri.parse('$baseUri/user/checkout'),
                // );

                // final String URL = jsonDecode(response.body)['url'];

                // // print(URL);

                // Navigator.pushNamed(context, WebviewScreen.routeName,arguments: URL);
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.brown
                    ),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Pay with Any Card{stripe}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                          )),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: double.infinity ,
                child: GooglePayButton(
                  paymentConfiguration: PaymentConfiguration.fromJsonString(payment_string),
                  paymentItems: paymentItems,
                  type: GooglePayButtonType.buy,
                  margin: const EdgeInsets.only(top: 15.0),
                  onPaymentResult: onGooglePayResult,
                  loadingIndicator: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}