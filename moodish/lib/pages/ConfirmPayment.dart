import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/models/Product_model.dart';
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
                'Order Product',
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
  //final _formKey = GlobalKey<FormState>();
  //TextEditingController itemName = new TextEditingController();
  //TextEditingController amount = new TextEditingController();
  var selectedProduct;
  final products = [
    'Digital Notebook: Sweet Home ฿99',
    'App Icons: Picnic Day ฿159'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      //key: _formKey,
      //child: Column(
        children: <Widget>[
      //    TextFormField(
      //      controller: itemName,
      //      decoration: InputDecoration(
      //        icon: Icon(Icons.menu_book_rounded),
      //        hintText: 'type product name',
      //        labelText: 'Select Product',
      //      ),
      //      validator: (itemName) {
      //        if (itemName == null || itemName.isEmpty) {
      //          return 'Please enter your product';
      //        }
      //      },
      //    ),
      //    TextFormField(
      //      controller: amount,
      //      decoration: InputDecoration(
      //        icon: Icon(Icons.money_rounded),
       //       hintText: 'amount',
      //        labelText: 'Amount',
       //     ),
      //      validator: (amount) {
      //        if (amount == null || amount.isEmpty) {
      //          return 'Please enter your amount';
      //        }
      //      },
      //    ),
          Icon(
            Icons.shopping_cart_outlined,
            size: 50,
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              //Icon(Icons.production_quantity_limits),
              SizedBox(width: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF9ADCF1), width:2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String> (
                    hint: Text('Select product'),
                    value: selectedProduct,
                    items: products.map(buildMenuItem).toList(),
                    onChanged: (selectedProduct) => setState(() => this.selectedProduct = selectedProduct),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {
                //if (_formKey.currentState!.validate()) {
              
                //  _formKey.currentState!.save();

                Map <String, dynamic> data = {"itemName":selectedProduct,"amount":selectedProduct,"status":"waiting","order_date":DateTime.now()}; 
                FirebaseFirestore.instance.collection("moodish_order")
                .add(data)
                .then((value) => print("New Order Added"))
                .catchError((error) => print("Failed to add order!!"));

                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => PayandGo()));
              },
            //},
            child: Text('Check Out'),
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
      );
    //);
  }

  DropdownMenuItem<String> buildMenuItem(String product) => DropdownMenuItem(
    value: product,
    child: Text(
      product,
      style: TextStyle(fontWeight: FontWeight.w500),
    ),
  );

}


class ProductItem {
  final String title;
  final int price;

  const ProductItem({
    Key? key, 
    required this.title,
    required this.price, 
    });
}

List<ProductItem> products = [
  ProductItem(
    title: 'Digital Notebook: Sweet Home',
    price: 199,
  ),
  ProductItem(
    title: 'App Icons: Picnic Day',
    price: 99,
  ),
  ProductItem(
    title: 'Digital Memo: Space Galaxy',
    price: 159,
  ),
  ProductItem(
    title: 'Digital Sticker: Moodish v.2',
    price: 129,
  ),
];