import 'package:cartopia/common/new_adress_container.dart';
import 'package:cartopia/features/address/screens/change_address.dart';
import 'package:cartopia/models/user.dart';
import 'package:cartopia/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {

  String choosenAddress;

  static const String routeName = 'admin/address_screen';

  AddressScreen({
    super.key,
    required this.choosenAddress,
  });

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {

  final TextEditingController flattextController = TextEditingController();
  final TextEditingController areatextController = TextEditingController();
  final TextEditingController pincodetextController = TextEditingController();
  final TextEditingController towntextController = TextEditingController();

Future<void> navigateToChangeaddress()async{
    widget.choosenAddress = await Navigator.pushNamed(context, ChangeAddress.routeName) as String;
    setState(() {});
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
              )
          ],
        ),
      ),
    );
  }
}