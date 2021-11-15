import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/product_controller.dart';
import 'package:midterm_app/models/Product_model.dart';
import 'package:midterm_app/pages/ProductCatalog.dart';

//payment page
class PayandGo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
          appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                'Scan and Pay',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold, 
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(height: 5.0),
              Image.asset(
              'assets/payment.jpg',
              width: 600,
              ),
              SizedBox(height: 20.0),
              Text(
                'How to pay',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold, 
                ),
              ),
              Text(
                '\n -press to save QR Code \n - open mobile banking app \n -select QR code and pay \n - press Next button after paid',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat' 
                ),
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                 Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => OrderConfirmation()));
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
        ),
      ),
  );
  }
}

//confirm page
class OrderConfirmation extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
          appBar: AppBar(
        title: Text('Order Confirmation'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset(
              'assets/icon.png',
              width: 200,
              ),
              SizedBox(height: 20.0),
              Text(
                'Thank you for your order',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold, 
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Your order detail and status are available on Order History.',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500, 
                ),
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () { 
                  Navigator.pushNamed(context, '/5');
                },
                child: Text('Back to Store'),
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
        ),
      ),
  );
  }
}