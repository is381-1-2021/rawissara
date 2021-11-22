import 'package:firebase_auth/firebase_auth.dart';
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
      body: TextForm(),
    );
  }
}

class TextForm extends StatefulWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  String _Email = '';
  String _Password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
               Container(
               height: 300,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/loginpic.png'),
                 ),
               ),
              ),
              Text('Login to your Moodish account',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  )),
              SizedBox(height: 20),
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
                onSaved: (value) {
                  _Password = value!;
                },
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      context.read<FormModel>().Email = _Email;

                    }
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: _Email, 
                              password: _Password);
                      Navigator.pushNamed(context, '/2');
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('No user found for that email.'),
                            ));
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Wrong password provided for that user.'),
                            ));
                      }
                    }
                    
                  },
                  child: Text('Log In'),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).accentColor,
                      fixedSize: Size(200, 60),
                      textStyle: TextStyle(fontSize: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                  ),
                ),
              ),
            ],
          ),
        ),
        
      ),
    );
  }
}