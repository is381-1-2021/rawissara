import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/order_controller.dart';
import 'package:midterm_app/models/formpayment_model.dart';
import 'package:midterm_app/services/services.dart';

class OrderList extends StatefulWidget{
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  List<OrderModel> orders = List.empty();
  bool isLoading = false;
  var services = FirebaseServices();
  var controller;

   void initState() {
    super.initState();
    controller = OrderController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getOrders() async {
    var newOrders = await controller.fetchOrders();

    setState(() => orders = newOrders);
  }
  
  Widget get body => isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
            itemCount: orders.isEmpty ? 1 : orders.length,
            itemBuilder: (ctx, index) {
              if (orders.isEmpty) {
                return Text('Refresh to view your order');
              }
              Size size = MediaQuery.of(context).size;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${orders[index].itemName.toString().substring(0, orders[index].itemName.toString().lastIndexOf('฿'))}',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Order Time: ${orders[index].order_date.toString().substring(0, orders[index].order_date.toString().lastIndexOf(':'))}',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                          ),
                        ),
                        Divider(thickness: 2),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Amount',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',color: Colors.grey,fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '${orders[index].itemName.toString().substring(0, orders[index].itemName.toString().lastIndexOf('฿'))}',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                ),
                              ],
                            ),
                              VerticalDivider(thickness: 2),
                               Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Status',
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',color: Colors.grey,fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15.0,
                                      vertical: 5.0,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22.0),
                                      color: orders[index].status == 'waiting' ? Colors.amberAccent:Colors.greenAccent[700]),
                                    child: Text(
                                      '${orders[index].status}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8B82D0),
      floatingActionButton: FloatingActionButton(
        onPressed: _getOrders,
        child: Icon(
          Icons.arrow_drop_down_rounded,
          size: 50,
        ),
      ),
      appBar: AppBar(
        title: Text('Order History'),
        elevation: 0,
      ),
      body: Center(child: body)
    );
  }
}