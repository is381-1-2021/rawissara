import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List Pagecaption = ['Store','Payment','Favourite','Quote','Todolist','Mood'];

  List<IconData> Pageicon = [
    Icons.store,Icons.save_alt_rounded,Icons.favorite_rounded,
    Icons.class__rounded,Icons.dvr_rounded,Icons.emoji_emotions_rounded,
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(6, (index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/${index+1}');
            },
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(22.0),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Pageicon[index],
                        size: 60, 
                        color: Theme.of(context).primaryColor
                      ),
                      SizedBox(height: 15),
                      Text(
                        Pagecaption[index],
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),                      
                    ],
                  ),                 
                ),
              ),
            ),
          );
        }
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
    );
  }
}

class FourthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quote'),
      ),
    );
  }
}

class FifthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todolist'),
      ),
    );
  }
}

class SixthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood'),
      ),
    );
  }
}