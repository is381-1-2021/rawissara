import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/models/formpayment_model.dart';
import 'package:midterm_app/pages/ProductDetail.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

class MakeOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make order'),
      ),
      body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                 shape: CircleBorder(), 
                 primary: Color(0xFF9ADCF1),
              ),
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Text(
                  '1',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 20),
            Text(
                'Order Form',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold, 
                ),
              ),
            SizedBox(height: 20.0),
            FormConfirm(),
          ],
        ),
      ),
    );
  }
}

//form ซื้อสินค้า
class FormConfirm extends StatefulWidget {
  @override
  _FormConfirmState createState() => _FormConfirmState();
}

class _FormConfirmState extends State<FormConfirm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController itemName = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController amount = new TextEditingController();
  //String _name = '';
  //String _orderref = '';
  //String _datetime = '';
  //int _amount = 50;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: itemName,
            decoration: InputDecoration(
              icon: Icon(Icons.menu_book_rounded),
              hintText: 'type product name',
              labelText: 'Select Product',
            ),
            validator: (itemName) {
              if (itemName == null || itemName.isEmpty) {
                return 'Please enter your product';
              }
            },
          ),
          TextFormField(
            controller: amount,
            decoration: InputDecoration(
              icon: Icon(Icons.money_rounded),
              hintText: 'amount',
              labelText: 'Amount',
            ),
            validator: (amount) {
              if (amount == null || amount.isEmpty) {
                return 'Please enter your amount';
              }
            },
          ),
          SizedBox(height: 15.0),
          ElevatedButton(
            onPressed: () {
                if (_formKey.currentState!.validate()) {
              
                  _formKey.currentState!.save();

                Map <String, dynamic> data = {"itemName":itemName.text, "amount":amount.text,"status":"waiting","order_date":DateTime.now()}; 
                FirebaseFirestore.instance.collection("moodish_order")
                .add(data)
                .then((value) => print("New Order Added"))
                .catchError((error) => print("Failed to add order!!"));

                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => PayandGo()));
              }
            },
            child: Text('Next'),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF5F478C),
              fixedSize: Size(250, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              textStyle: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
