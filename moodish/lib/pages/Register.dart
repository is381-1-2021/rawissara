import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:midterm_app/models/form_model.dart';
import 'package:midterm_app/pages/Account.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  FormModel profile = FormModel();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot){
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/regispic.png'),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text("Let's join Moodish world!!",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    )),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person, color: Color(0xFF5F478C)),
                      hintText: 'Your Email',
                      labelText: 'Email',
                    ),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "please enter your email"),
                      EmailValidator(errorText: "Please enter collected email"),
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String? email){
                      profile.Email = email!;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                      icon: Icon(Icons.lock, color: Color(0xFF5F478C)),
                      hintText: 'Password',
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.visibility, color: Color(0xFF5F478C))
                    ),
                    validator:RequiredValidator(errorText: "Please enter your password"),
                    obscureText: true,
                    onSaved: (String? password){
                      profile.Password = password!;
                    },
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                       style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).accentColor,
                          fixedSize: Size(200, 60),
                          textStyle: TextStyle(fontSize: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                          )
                      ),
                      child: Text("Create Account", style: TextStyle(fontSize: 20)),
                      onPressed: () async{
                        if(formKey.currentState!.validate()){
                        formKey.currentState!.save();
                        
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: profile.Email!, 
                            password: profile.Password!
                            ).then((value) {
                              formKey.currentState!.reset();
                              
                              Navigator.pop(context);
                            });                            
                        }
                      }

                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },);
  }
}