import 'package:flutter/material.dart';


class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal:30, vertical: 20),
          color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[ 
                  Container(
                    height: 380,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/accountpic.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Moodish',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 40,
                      fontWeight: FontWeight.bold
                    )
                  ) ,
                  Text(
                    'Get better life management',
                   textAlign: TextAlign.left,
                   style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 23,
                      fontWeight: FontWeight.bold
                    )
                  ) ,
                  SizedBox(height: 20.0),
                  Center(
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, '/1');
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF8B82D0),
                              fixedSize: Size(260, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () async {
                              Navigator.pushNamed(context, '/14'); 
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xFF8B82D0),
                              fixedSize: Size(260, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
      ),
      );
  }
}