import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/models/NotesOperation.dart';
import 'package:provider/provider.dart';

class AddQuote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController quoteText = new TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: Text('Add your quote'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: TextFormField(
                  controller: quoteText,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type today quote',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5F478C),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5F478C),
                  ),
                  validator: (quoteText) {
                    if (quoteText == null || quoteText.isEmpty) {
                    return 'Please enter your quote';
                    }
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5F478C),
                ),
                onPressed: () {
                Map <String, dynamic> data = {"quoteText":quoteText.text,"date":DateTime.now()}; 
                FirebaseFirestore.instance.collection("moodish_quotes")
                .add(data)
                .then((value) => print("New Quote Added"))
                .catchError((error) => print("Failed to add quote!!"));
                  Navigator.pop(context);
                },
                child: Text('Add Quote'),
              ),
            ],
          ),
        ));
  }
}
