import 'package:final_app/controller.dart';
import 'package:final_app/model/transaction_model.dart';
import 'package:final_app/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class TransList extends StatefulWidget{
  @override
  _TransListState createState() => _TransListState();
}

class _TransListState extends State<TransList> {
  List<TransModel> trans = List.empty();
  bool isLoading = false;
  var services = FirebaseServices();
  var controller;

   void initState() {
    super.initState();
    controller = TransController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getTrans() async {
    var newTrans = await controller.fetchTrans();

    setState(() => trans = newTrans);
  }
  
  Widget get body => isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
            itemCount: trans.isEmpty ? 1 : trans.length,
            itemBuilder: (ctx, index) {
              if (trans.isEmpty) {
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
                          '${trans[index].Item}',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${trans[index].Date.toString().substring(0, trans[index].Date.toString().lastIndexOf(':'))}',
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
                                        fontFamily: 'Montserrat',
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '\฿${trans[index].Amount}',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 18,
                                      color: trans[index].Type == 'assets/images/revenue.png' 
                                      ? Colors.greenAccent[700]
                                      :Colors.red,
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
                                    child: Image.asset(
                                      trans[index].Type,width:25
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
      floatingActionButton: FloatingActionButton(
        onPressed: _getTrans,
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
