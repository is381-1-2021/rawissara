import 'package:flutter/material.dart';
import 'package:midterm_app/models/form_model.dart';
import 'package:provider/provider.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: LogInForm(),
    );
  }
}

class LogInForm extends StatelessWidget {
  const LogInForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/icon.png',
              width: 200,
            ),
            TextForm(),
          ],
        ),
      ),
    );
  }
}

class TextForm extends StatefulWidget {
  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final _formKey = GlobalKey<FormState>();

  String _Email = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color(0xFF5F478C),
              ),
              hintText: 'Your Email',
              labelText: 'Email',
              fillColor: Color(0xFF8B82D0),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email.';
              }
            },
            onSaved: (value) {
              _Email = value!;
            },
            initialValue: context.read<FormModel>().Email,
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(
                Icons.lock,
                color: Color(0xFF5F478C),
              ),
              hintText: 'Password',
              labelText: 'Password',
              fillColor: Color(0xFF8B82D0),
              suffixIcon: Icon(
                Icons.visibility,
                color: Color(0xFF5F478C),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password.';
              }
            },
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                context.read<FormModel>().Email = _Email;

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Log in success'),
                ));

                Navigator.pop(context);
              }
            },
            child: Text('Log In'),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).accentColor,
              fixedSize: Size(200,50),
              textStyle: TextStyle(fontSize: 20)
            ),
          ),
        ],
      ),
    );
  }
}
