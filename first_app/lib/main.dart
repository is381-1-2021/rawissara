import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.green,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.purple),
        ),
      ),
      initialRoute: '/fourth',
      routes: <String,WidgetBuilder> {
        '/first': (context) => FirstPage(),
        '/second': (context) => SecondPage(),
        '/third': (context) => ThirdPage(),
        '/fourth': (context) => FourthPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Image cat1 = Image.asset('assets/cat1.png',width: 120);
  Image cat2 = Image.asset('assets/cat2.png',width: 120);

  Image catOnShow = Image.asset('assets/cat1.png',width: 120);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              width: 200.0,
              margin: EdgeInsets.only(bottom:50.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.25),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: catOnShow, 
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState((){
                      catOnShow = cat1;
                      _counter--;
                    });
                  }, 
                  child: Text('ลด'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      catOnShow = cat2;
                      _counter++;
                    });
                  }, 
                  child: Text('เพิ่ม'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.fingerprint),
            tooltip: 'Button1',
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.bungalow),
            tooltip: 'Button2',
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Text('First Page'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Table(
          children: [
            TableRow(
              children: [
                Container(
                  margin: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade300,
                  ),
                  child: Text('ID')
                ),
                Container(
                  margin: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade300,
                  ),
                  child: Text('Name')
                ),
                Container(
                  margin: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade300,
                  ),
                  child: Text('Gender')
                ),
              ],
            ),
            TableRow(
              children: [
                Text('1'),
                Text('Winai'),
                Text('Male'),
              ],
            ),
            TableRow(
              children: [
                Text('2'),
                Text('Pimnares'),
                Text('Female'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Third Page'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.cloud),
              ),
              Tab(
                icon: Icon(Icons.shower),
              ),
              Tab(
                icon: Icon(Icons.wb_sunny),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Cloudy'),
            ),
            Center(
              child: Text('Rainy'),
            ),
            Center(
              child: Text('Sunny'),
            ),
          ],
        ),
      ),
    );
  }
}

class FourthPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A','B','C','D','E','F','G','H','I'];
    final List<int> colorCodes = <int>[600,500,100];
    return Scaffold(
      appBar: AppBar(
        title: Text('Fourth Page'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemCount: entries.length,
        itemBuilder: (context, index){
          return Container(
            height: 100.0,
            color: Colors.amber[colorCodes[index %3]],
            child: Center(
              child: Text('Entry ${entries[index]}'),
            ),
          );
        },
        separatorBuilder: (context, int) => Divider(),
      ),
    );
  }
}
