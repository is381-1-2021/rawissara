import 'package:flutter/material.dart';
import 'package:midterm_app/models/form_model.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFF8B82D0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              )
            ),
          ),
          SafeArea(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: 
                        Image.asset('assets/userpic.PNG',width: 125,),   
                  ),
                  Text(
                    'Welcome to Moodish',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xFF5F478C),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<FormModel>(
                      builder: (context, model, child) {
                        return Text('Email - ${model.Email}', 
                        style: TextStyle(
                          fontSize: 20, 
                          color: Colors.white
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/3');
                          },
                          child: Container(
                            child: Category(
                              title: 'Task',
                              png: 'assets/TaskOverview.png',
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/5');
                          },
                          child: Container(
                            child: Category(
                              title: 'Store',
                              png: 'assets/Store.png',
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/8');
                          },
                          child: Container(
                            child: Category(
                              title: 'Mood',
                              png: 'assets/DailyMood.png',
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/10');
                          },
                          child: Container(
                            child: Category(
                              title: 'Quote',
                              png: 'assets/DailyQuote.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      await Navigator.pushNamed(context, '/1');
                    }, 
                    icon: Icon(Icons.login), 
                    label: Text('Login/Logout'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF5F478C),
                      fixedSize: Size(250,50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String png;
  final String title;
  const Category({
    Key? key,
    required this.png,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          Image.asset(
            png,
            width: 100,
            height: 100,
          ),
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Color(0xFF5F478C),
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
