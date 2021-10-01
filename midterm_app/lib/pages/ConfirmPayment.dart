import 'package:flutter/material.dart';
 
class ConfirmPayment extends StatelessWidget{
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Confirm Payment'),
     ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           Image.asset(
             'assets/logo.PNG',
             width: 50,
           ),
           SizedBox(height: 5.0),
           Text(
             'Account Name: Moodish Co.,Ltd.',
             style: TextStyle(
               fontSize: 18,
               fontFamily: 'Montserrat',
               color: Color(0xFF5F478C),
               fontWeight: FontWeight.bold,
             ),
           ),
           SizedBox(height: 5.0),
           Text(
             'Promptpay: 081-234-5678',
             style: TextStyle(
               fontSize: 18,
               fontFamily: 'Montserrat',
               color: Color(0xFF5F478C),
               fontWeight: FontWeight.bold,
             ),
           ),
           SizedBox(height: 5.0),
           Image.asset(
             'assets/payment.jpg',
             width: 250,
           ),
           FormConfirm(),
         ],
       ),
     ),
   );
 }
}
 
class FormConfirm extends StatefulWidget{
 @override
 _FormConfirmState createState() => _FormConfirmState();
}
 
class _FormConfirmState extends State<FormConfirm> {
 final _formKey = GlobalKey<FormState>();

 String _name = '';
 String _orderref = '';
 String _datetime = '';
 int _amount = 50;
 
 @override
 Widget build(BuildContext context) {
   return Form(
     key: _formKey,
     child: Column(
       children: <Widget>[
         TextFormField(
           decoration: InputDecoration(
             icon: Icon(Icons.account_circle_rounded),
             hintText: 'Your Name',
             labelText: 'Name',
           ),
           validator: (value){
             if (value == null || value.isEmpty){
               return 'Please enter your Name';
             }
           },
           onSaved: (value) {
             _name = value!;
           },
         ),
         TextFormField(
           decoration: InputDecoration(
             icon: Icon(Icons.paste_rounded),
             hintText: 'Your Order Ref. 5 digit',
             labelText: 'Order Ref.',
           ),
           validator: (value){
             if (value == null || value.isEmpty){
               return 'Please enter your Order ref.';
             }
           },
           onSaved: (value) {
             _orderref = value!;
           },
         ),
         TextFormField(
           decoration: InputDecoration(
             icon: Icon(Icons.access_time_rounded),
             hintText: 'Your Transfer Datetime (D/M/Y H:M:S)',
             labelText: 'Transfer Datetime',
           ),
           validator: (value){
             if (value == null|| value.isEmpty){
               return 'Please enter your transfer datetime';
             }
           },
           onSaved: (value) {
             _datetime = value!;
           },
         ),
         TextFormField(
           decoration: InputDecoration(
             icon: Icon(Icons.money_rounded),
             hintText: 'Your Amount',
             labelText: 'Amount',
           ),
           validator: (value){
             if (value == null || value.isEmpty){
               return 'Please enter your amount';
             }
 
             try{
               if(int.parse(value) < 50) {
                 return 'Please enter amount > 50';
               }                                                                           
             } catch (e) {
               return 'Please enter number only';
             }

             var a = null;
             var b = '';
           },
           onSaved: (value) {
             _amount = int.parse(value!);
           },
         ),
         SizedBox(height: 15.0),
         ElevatedButton(
           onPressed: () {
             if (_formKey.currentState!.validate()) {
               _formKey.currentState!.save();
 
               var response = 'Thanks for your order :-D Khun $_name Order: $_orderref \n Transfer: ฿$_amount.00 $_datetime Status: Complete ';
 
               Navigator.pop(context, response);
              
             }
           },
           child: Text('Submit'),
           style: ElevatedButton.styleFrom(
                 primary: Color(0xFF5F478C),
                 fixedSize: Size(250,50),
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