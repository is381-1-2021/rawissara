import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class TodoEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Task Edit"),
        ),
        body: TaskEdit());
  }
}

class TaskEdit extends StatefulWidget{
  @override
  _TaskEditState createState() => _TaskEditState();
}

class _TaskEditState extends State<TaskEdit> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController headline = new TextEditingController();
  TextEditingController detail = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.assignment),
              hintText: 'Input task headline',
              labelText: 'TASK',
            ),
            controller: headline,
            validator: (headline) {
              if (headline == null || headline.isEmpty) {
                return 'Please enter task';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.info),
              hintText: 'Input task detail',
              labelText: 'DETAIL',
            ),
            controller: detail,
            validator: (detail) {
              if (detail == null || detail.isEmpty) {
                return 'Please enter task';
              }
            },
          ),
                    SizedBox(height: 15.0),
          ElevatedButton(
            onPressed: () {
                if (_formKey.currentState!.validate()) {
              
                  _formKey.currentState!.save();
                Map <String, dynamic> data = {"headline":headline.text, "detail":detail.text}; 
                FirebaseFirestore.instance.collection("moodish_task").add(data);

                Navigator.pop(context);
              }
            },
            child: Text('Submit'),
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
    );
  }
}
