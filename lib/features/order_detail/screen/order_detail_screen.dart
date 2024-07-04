import 'package:cartopia/features/order_detail/widgets/order_card.dart';
import 'package:cartopia/models/order.dart';
import 'package:cartopia/models/product.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailScreen extends StatefulWidget {
  static const String routeName = '/order-detail';
  final Order order; 
  const OrderDetailScreen({
    super.key,
    required this.order,
    });

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {

  int currentstep =0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentstep = widget.order.status;
  }

  @override
  Widget build(BuildContext context) {
  List<Product> productlist = widget.order.products;
  List<int> quantityList = widget.order.quantity;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(Icons.arrow_back_ios)),
        title: Text('Order Detail'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text(
              'View Order Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Order Date : '),
                          SizedBox(width: 50,),
                          Text('${DateFormat().format(DateTime.fromMillisecondsSinceEpoch(widget.order.orderedAt))}')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Order Id :  '),
                          SizedBox(width: 50,),
                          Text('${widget.order.id}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Order Total'),
                          SizedBox(width: 50,),
                          Text('${widget.order.totalprice}'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(
              'Purchase Details',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index){
                    final Product product = productlist[0];
                    final int quantity = quantityList[0];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OrderCard(product: product,quantity: quantity,),
                    );
                  }),
            ),
            SizedBox(height: 10,),
            Text(
              'Tracking',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black
                  ),
                  color: Colors.white
                ),
                child: Stepper(
                  currentStep: currentstep,
                  controlsBuilder: (context,detail){
                    return SizedBox();
                  },
                  steps: [
                    Step(
                      title: Text('Pending'), 
                      content: Text('Your Order Is Yet To Be Delivered'),
                      isActive: currentstep>=0,
                      state: currentstep>0?StepState.complete : StepState.indexed
                    ),
                    Step(
                      title: Text('Completed'), 
                      content: Text('Your Order Have Been Delivered,Just Yet To Be Signed'),
                      isActive: currentstep>1,
                      state: currentstep>1? StepState.complete : StepState.indexed
                    ),
                    Step(
                      title: Text('Recieved'), 
                      content: Text('Your Order Has Been Deliverd,and Signed By You'),
                      isActive: currentstep>2,
                      state: currentstep>2?StepState.complete : StepState.indexed
                    ),
                    Step(
                      title: Text('Delivered'), 
                      content: Text('Your Order Has Been Delivered Completely'),
                      isActive: currentstep>=3,
                      state: currentstep>=3?StepState.complete : StepState.indexed
                    ),
                  ]
                  ),
              ),
            )
           ],
        ),
    );
  }
}