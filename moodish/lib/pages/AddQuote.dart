import 'package:flutter/material.dart';
import 'package:midterm_app/models/NotesOperation.dart';
import 'package:provider/provider.dart';

class AddQuote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String quote = '';
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
                  onChanged: (value) {
                    quote = value;
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5F478C),
                ),
                onPressed: () {
                //  Provider.of<NotesOperation>(context, listen: false)
                //      .addNewNote(date, quote);
                //  Navigator.pop(context);
                },
                child: Text('Add Quote'),
              ),
            ],
          ),
        ));
  }
}
