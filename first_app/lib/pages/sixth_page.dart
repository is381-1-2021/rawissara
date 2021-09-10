import 'package:flutter/material.dart';

class SixthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form...'),
      ),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget{
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _firstName = '';
  String? _lastName = '';
  int? _age = 20;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Your first name',
              labelText: 'First Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty){
                return 'Please enter firstname.';
              }
            },
            onSaved: (value) {
              _firstName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.family_restroom),
              hintText: 'Your last name',
              labelText: 'Last Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty){
                return 'Please enter lastname.';
              }
            },
            onSaved: (value) {
              _lastName = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(Icons.emoji_food_beverage_sharp),
              hintText: 'Your age',
              labelText: 'Age',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter lastname.';
              }

              try{
                if(int.parse(value) < 15) {
                  return 'Please enter valid age => 15+';
                }                                                                            
              } catch (e) {
                return 'Please enter number only';
              }
            },
            onSaved: (value) {
              _age = int.parse(value!);
            },
          ),
          ElevatedButton(
            onPressed: () {
              if(_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
            

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Processing $_firstName $_lastName $_age'),
                ));
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}