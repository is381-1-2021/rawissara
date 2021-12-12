import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'model/balance_model.dart';

class NewExpense extends StatefulWidget{
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _formKey = GlobalKey<FormState>();
  var itemTextController = TextEditingController();
  var amountTextController = TextEditingController();

  DateTime _focusedDay = DateTime.utc(2021, 12, 12);
  DateTime? _selectedDay;
  
  String? selectedType;
  int selectedIndex = -1;
  List categories = ['assets/images/revenue.png','assets/images/food.png','assets/images/transport.png','assets/images/study.png','assets/images/activity.png','assets/images/shopping.png','assets/images/home.png'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Card(
        child: Container(
          color: Colors.black38,
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              calendar(),
              TextFormField(
                decoration: InputDecoration(labelText: 'item'),
                controller: itemTextController,
                validator: (itemTextController) {
                if (itemTextController == null || itemTextController.isEmpty) {
                  return 'Please enter item';
                }
              },
              ),
               TextFormField(
                decoration: InputDecoration(labelText: 'amount'),
                controller: amountTextController,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'([0-9\-])')),
                ],
                validator: (amountTextController){
                  if (amountTextController == null || amountTextController.isEmpty) {
                  return 'Please enter amount';
                }
                },
                //onSaved: (amountTextController) {
                //  amountTextController = double.parse(amountTextController.text!);
                //},
                //initialValue: context.read<BalanceModel>().balance.toString()
              ),
              SizedBox(height: 20),
              //select icon
              Container(
                margin: EdgeInsets.symmetric(vertical: 3.0),
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedType = categories[index];
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20.0,),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: index == selectedIndex 
                    ? Theme.of(context).primaryColor
                    : Colors.transparent,
                  ),
                  child: Image.asset(
                    categories[index],
                    width: 50,
                  ),
                  ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    context.read<BalanceModel>().balance = double.parse(amountTextController.text);
                    //Provider.of<BalanceModel>(context, listen:false)
                    //.addNewTransaction(double.parse(amountTextController.text));
                    //totalBalanceValue += double.parse(amountTextController.text);
                    //context.read<BalanceModel>().balance = totalBalanceValue;

                    Map<String, dynamic> data = {
                    "Amount": double.parse(amountTextController.text),
                    "Date": _selectedDay,
                    "Item" : itemTextController.text,
                    "Type" : selectedType,
                  };
                  FirebaseFirestore.instance.collection("mind_final")
                  .add(data)
                  .then((value) => print("New Transaction Added"))
                  .catchError((error) => print("Failed to add transaction!!"));
                  Navigator.pop(context);
                    }
                  }, 
                  child: Text('Confirm'),
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                    fixedSize: Size(200,50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    textStyle: TextStyle(fontSize: 20) 
                  ),
                ),
              )           
            ],
          ),
        ),
      ),
    );
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
}



