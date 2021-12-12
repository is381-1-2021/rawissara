import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/AddExpenseUI.dart';
import 'package:final_app/model/transaction_model.dart';
import 'package:final_app/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';
import 'controller.dart';
import 'model/balance_model.dart';

class ExpenseList extends StatefulWidget {
  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  DateTime _focusedDay = DateTime.utc(2021, 12, 12);
  DateTime? _selectedDay;

  List<TransModel> trans = List.empty();
  //bool isLoading = false;
  double total = 0.0;

  var services = FirebaseServices();
  var controller;

  void initState() {
   super.initState();
   queryValues();
  }

  void queryValues() {
    FirebaseFirestore.instance
    .collection("mind_final")
    .where("Date", isEqualTo: _focusedDay)
    .snapshots()
    .listen((QuerySnapshot querySnapshot) { 
      //querySnapshot.docs.forEach((document) => this.total += document.data["Amount"]);
      //double tempTotal = querySnapshot.docs.fold(0, (tot, doc) => tot + doc.data['Amount']);
      setState(() {
      //  total = tempTotal;
      });
      debugPrint(total.toString());
    });
  }
 
  Widget calendar(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.0),
          gradient: LinearGradient(colors: [Color(0xFF2CA05D),Color(0xFFCDD86A)])
        ),
        child: TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.week,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            }
          },  
        ),
      ),
    );
  }

  void showModal(BuildContext ctx) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.black38,
      shape: RoundedRectangleBorder(
		  	borderRadius: BorderRadius.vertical(
		  		top: Radius.circular(30.0),
		  	),
		  ),
      context: ctx, 
      builder: (_){
        return NewExpense();
      },);
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){}, 
                  icon: Icon(Icons.calendar_view_week),color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<BalanceModel>(
                      builder: (context, model, child){
                        return Text(
                          "total: $total",
                          //'฿${model.balance}',
                           style: TextStyle(
                              fontSize: 20, 
                              color: Colors.white
                          ),
                        );
                      },
                    )
                  ),
                  IconButton(onPressed: () {}, 
                  icon: Icon(Icons.settings),color: Colors.white),
                ],
              ),  
              calendar(),
              Flexible(
                child: StreamBuilder(
                  stream: FirebaseFirestore
                          .instance
                          .collection('mind_final')
                          .where('Date', isEqualTo: _selectedDay)
                          .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                      child: Column(
                        children: <Widget>[
                          CircularProgressIndicator(),
                          Text("Loading . . . "),
                        ],
                      ),
                    );
                    }
                    else {
                      return ListView.builder(
                        shrinkWrap: true,            
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.only(left:20.0,right:20,top:15),
                            child: Card(                              
                              color: Colors.black,
                              elevation: 15,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                decoration: BoxDecoration( 
                                  borderRadius: BorderRadius.circular(20),                               
                                  gradient: LinearGradient(colors: [Color(0xFF1D1D1D),Color(0xFF292728)],begin: Alignment.topCenter,end: Alignment.bottomCenter)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.0,
                                        vertical: 5.0,
                                      ),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            snapshot.data!.docs[index]["Type"],
                                            width:50
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            snapshot.data!.docs[index]["Item"],
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '\฿${snapshot.data!.docs[index]["Amount"]}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 18,
                                        color: snapshot.data!.docs[index]["Type"] == 'assets/images/revenue.png' 
                                        ? Colors.greenAccent[700]
                                        :Colors.red,
                                        fontWeight: FontWeight.bold
                                      ),
                                      ),
                                    ],
                                  ),
                                ), 
                              ],
                            ),
                          ),
                        ),
                           ),
                          );                          
                        },
                      );
                    }
                  }
                ),
              ),
            ],
          ),
        ),        
      backgroundColor: Color(0xFF1D1D1D),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModal(context),
        child: Icon(Icons.add,),
        ),
      ),
    );

  }
}

