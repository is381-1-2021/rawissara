import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/product_controller.dart';
import 'package:midterm_app/pages/OrderList.dart';
import 'package:midterm_app/pages/TaskOverview.dart';
import 'package:provider/provider.dart';

import 'controllers/note_controller.dart';
import 'controllers/task_controller.dart';
import 'models/NotesOperation.dart';
import 'models/form_model.dart';
import 'models/formpayment_model.dart';
import 'models/mood_model.dart';
import 'pages/AddQuote.dart';
import 'pages/AllQuote.dart';
import 'pages/ConfirmPayment.dart';
import 'pages/LogIn.dart';
import 'pages/ProductCatalog.dart';
import 'pages/TaskEdit.dart';
import 'pages/daily_mood.dart';
import 'pages/home.dart';
import 'pages/monthly_mood.dart';
import 'pages/mood_calendar2.dart';
import 'services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MoodModel(),
        ),
        ChangeNotifierProvider(
           create: (context) => FormModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotesOperation(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        context.read<FormModel>().isLogin = false;
      } else {
        print('User is signed in!');
        context.read<FormModel>().isLogin = true;
      }
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF8B82D0),
        accentColor: Color(0xFF5F478C),
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontFamily: 'Montserrat', color: Colors.black),
        ),
      ),
      initialRoute: '/2',
      routes: <String, WidgetBuilder>{
        '/1': (context) => LogIn(),
        '/2': (context) => Home(),
        '/3': (context) => AllTask(),
        '/4': (context) => TodoEntryScreen(), 
        '/5': (context) => ProductCatalog(),
        '/6': (context) => MakeOrder(),
        '/7': (context) => DailyMood(),
        '/8': (context) => AllMood(),
        '/9': (context) => AddQuote(),
        '/10': (context) => AllQuote(),
        '/11' : (context) => ShowListProduct(),
        '/12' : (context) => OrderList(),
        '/13' : (context) => TaskEdit()
      },
    );
  }
}
