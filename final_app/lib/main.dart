
import 'package:final_app/AddExpenseUI.dart';
import 'package:final_app/AllExpenseUI.dart';
import 'package:final_app/showlist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/balance_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
           create: (context) => BalanceModel(),
        ),
      ],
      child: MyApp(),
    ),
  );  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFCDD86A),
        accentColor: Color(0xFF2CA05D),
      ),
      initialRoute: '/1',
      routes: <String, WidgetBuilder> {
        '/1': (context) => ExpenseList(),
        '/3': (context) => TransList()
      },
    );
  }
}
