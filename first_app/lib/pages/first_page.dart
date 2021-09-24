import 'package:first_app/models/form_model.dart';
import 'package:first_app/pages/second_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget{
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? _message = 'Here is where we get value back';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.fingerprint),
            tooltip: 'Button1',
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.bungalow),
            tooltip: 'Button2',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<FormModel>(
                builder: (context, model, child) {
                  return Text('First Page-${model.firstName} ${model.lastname} ${model.age}');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SecondPage(),
                  ),
                );
              },
              child: Text('Go to ...'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/6' );
              },
              child: Text('Please click to fill the form.'),
            ),
          ],
        ),
      ),
    );
  }
}