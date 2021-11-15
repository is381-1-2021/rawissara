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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [   
            SizedBox(height: 5.0),
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
              icon: Icon(Icons.account_circle_rounded),
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
              icon: Icon(Icons.access_time_rounded),
              hintText: 'amount',
              labelText: 'Amount',
            ),
            validator: (amount) {
              if (amount == null || amount.isEmpty) {
                return 'Please enter your amount';
              }
            },
          ),
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              icon: Icon(Icons.paste_rounded),
              hintText: 'Your E-mail',
              labelText: 'E-mail',
            ),
            validator: (email) {
              if (email == null || email.isEmpty) {
                return 'Please enter your E-mail';
              }
            },
            onSaved: (email) {
              email = email!;
            },
          ),
          SizedBox(height: 15.0),
          ElevatedButton(
            onPressed: () {
                if (_formKey.currentState!.validate()) {
              
                  _formKey.currentState!.save();
                Map <String, dynamic> data = {"itemName":itemName.text, "amount":amount.text,"email":email.text,"status":"waiting","order_date":DateTime.now()}; 
                FirebaseFirestore.instance.collection("moodish_order").add(data);

              //  context.read<PaymentModel>().name = itemName;
              //  context.read<PaymentModel>().orderref = _orderref;
              //  context.read<PaymentModel>().datetime = _datetime;
              //  context.read<PaymentModel>().amount = amount;
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
