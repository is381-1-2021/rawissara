import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
              Column(
                children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                 shape: CircleBorder(), 
                 primary: Colors.amberAccent,
              ),
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Text(
                  '2',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              onPressed: () {},
            ),
                ] ),
              SizedBox(height:20),
              Text(
                'Scan and Pay',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold, 
                ),
              ),
              SizedBox(height: 10.0),
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
              SizedBox(height: 20),
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
              ElevatedButton(
              style: ElevatedButton.styleFrom(
                 shape: CircleBorder(), 
                 primary: Colors.greenAccent,
              ),
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Icon(Icons.check),
                ),
              onPressed: () {},
              ),
              //SizedBox(height: 20.0),
              Image.asset(
              'assets/stepthree.png',
              width: 270,
              ),
              SizedBox(height: 20),
              Text(
                'Thank you for your order',
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold, 
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text(
                  'Your order detail and status are available on Order History.',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500, 
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () { 
                  Navigator.pushNamed(context, '/12');
                },
                child: Text('View Order History'),
                style: ElevatedButton.styleFrom(
                primary: Color(0xFF5F478C),
                fixedSize: Size(250, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () { 
                  
                  Navigator.popUntil(context, ModalRoute.withName('/5'));
                  //Navigator.pushNamed(context, '/5');
                },
                child: Text('Back to Store'),
                style: ElevatedButton.styleFrom(
                primary: Color(0xFF5F478C),
                fixedSize: Size(250, 60),
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