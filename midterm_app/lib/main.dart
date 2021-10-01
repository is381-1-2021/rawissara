import 'package:flutter/material.dart';
import 'package:midterm_app/pages/Home.dart';

import 'pages/ConfirmPayment.dart';
import 'pages/ProductCatalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Flutter Demo',
     theme: ThemeData(
       primaryColor: Color(0xFF8B82D0),
       accentColor: Color(0xFF5F478C),
       textTheme: const TextTheme(
         bodyText2: TextStyle(
           fontFamily: 'Montserrat',
           color: Colors.black
         ),
       ),
     ),
     initialRoute: '/Home',
     routes: <String,WidgetBuilder> {
       '/Home':(context) => HomeScreen(),
       '/1': (context) => ProductCatalog(),
       '/2': (context) => ConfirmPayment(),
       '/3':(context) => ThirdPage(),
       '/4':(context) => FourthPage(),
       '/5':(context) => FifthPage(),
       '/6':(context) => SixthPage(),
     },
   );
 }
}