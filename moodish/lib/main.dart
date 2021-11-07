import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/models/task_model.dart';
import 'package:midterm_app/pages/TaskOverview.dart';
import 'package:provider/provider.dart';

import 'controllers/note_controller.dart';
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
import 'services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = NoteController(services);
  
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
          create: (context) => PaymentModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => NotesOperation(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoModel(),
        ),
      ],
      child: MyApp(controller: controller),
    ),
  );
}

class MyApp extends StatelessWidget {
  final NoteController controller;
  MyApp({required this.controller});

  @override
  Widget build(BuildContext context) {
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
        '/3': (context) => TodoScreen(),
        '/4': (context) => TodoEntryScreen(), 
        '/5': (context) => ProductCatalog(),
        '/6': (context) => ConfirmPayment(),
        '/7': (context) => DailyMood(),
        '/8': (context) => MonthlyMood(),
        '/9': (context) => AddQuote(),
        '/10': (context) => AllQuote(controller: controller),
      },
    );
  }
}
