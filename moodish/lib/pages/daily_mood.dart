import 'package:flutter/material.dart';
import 'package:midterm_app/models/mood_model.dart';
import 'package:provider/provider.dart';

class DailyMood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Mood'),
        actions: [
          IconButton(
            icon: Icon(Icons.close_outlined),
            tooltip: 'close',
            onPressed: () {
              Navigator.pushNamed(context, '/8');
            },
          ),
        ],
      ),
      body: MoodForm(),
    );
  }
}

class MoodForm extends StatefulWidget {
  @override
  _MoodFormState createState() => _MoodFormState();
}

class _MoodFormState extends State<MoodForm> {
  final _formkey = GlobalKey<FormState>();
  String? _mood;
  String? _weather;
  String? _social;
  String? _romance;
  String? _health;
  String? _work;
  String? _hobby;
  String? _event;
  int? _rate;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: ListView(
        children: [
          Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.pin),
                  hintText: 'Enter 1-10',
                  labelText: 'Rate Today',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter rate today.';
                  }
                  try {
                    if (int.parse(value) < 1) {
                      return 'Please enter 1-10';
                    }
                    if (int.parse(value) > 10) {
                      return 'Please enter 1-10';
                    }
                  } catch (e) {
                    return 'Please enter number only';
                  }
                },
                onSaved: (value) {
                  _rate = int.parse(value!);
                },
                initialValue: context.read<MoodModel>().rate.toString(),
              ),
              //mood
              SizedBox(height: 10),
              Text(
                'How was your day?',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _mood = 'Excited'),
                    child: Container(
                      height: 70,
                      width: 70,
                      color: _mood != 'Excited'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/excited.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _mood = 'Happy'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _mood != 'Happy'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/happy.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _mood = 'Sad'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _mood != 'Sad'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/sad.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _mood = 'Angry'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _mood != 'Angry'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/angry.png'),
                    ),
                  ),
                ],
              ),
              Text('Excited           Happy            Sad             Angry'),
              //weather
              SizedBox(height: 30),
              Text(
                'Weather',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _weather = 'Sunny'), //แก้กางปีก
                    child: Container(
                      height: 60,
                      width: 60,
                      color: _weather != 'Sunny'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/sun.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _weather = 'Cloudy'),
                    child: Container(
                      height: 60,
                      width: 60,
                      color: _weather != 'Cloudy'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/cloud.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _weather = 'Rainy'),
                    child: Container(
                      height: 60,
                      width: 60,
                      color: _weather != 'Rainy'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/rain.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _weather = 'Snowy'),
                    child: Container(
                      height: 60,
                      width: 60,
                      color: _weather != 'Snowy'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/snowflake.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _weather = 'Windy'),
                    child: Container(
                      height: 60,
                      width: 60,
                      color: _weather != 'Windy'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/wind.png'),
                    ),
                  ),
                ],
              ),
              Text(
                  'Sunny         Cloudy         Rainy         Snowy         Windy'),
              //social
              SizedBox(height: 30),
              Text(
                'Social',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _social = 'Friend'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _social != 'Friend'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/laugh.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _social = 'Family'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _social != 'Family'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/family.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _social = 'Lover'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _social != 'Lover'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/love.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _social = 'Other'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _social != 'Other'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/face.png'),
                    ),
                  ),
                ],
              ),
              Text('Friend          Family            Lover            Other'),
              //romance
              SizedBox(height: 30),
              Text(
                'Romance',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _romance = 'Date'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _romance != 'Date'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/letter.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _romance = 'Anniversary'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _romance != 'Anniversary'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/date.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _romance = 'Gift'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _romance != 'Gift'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/giftbox.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _romance = 'Conflict'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _romance != 'Conflict'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/broken.png'),
                    ),
                  ),
                ],
              ),
              Text('Date        Anniversary      Gift           Conflict'),
              //health
              SizedBox(height: 30),
              Text(
                'Health',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _health = 'Sick'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _health != 'Sick'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/sick.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _health = 'Clinic'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _health != 'Clinic'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/stethoscope.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _health = 'Hospital'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _health != 'Hospital'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/hospital.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _health = 'Medicine'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _health != 'Medicine'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/medicine.png'),
                    ),
                  ),
                ],
              ),
              Text(
                  '      Sick            Clinic        Hospital       Medicine'),
              //work
              SizedBox(height: 30),
              Text(
                'Work',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _work = 'Ontime'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _work != 'Ontime'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/escape.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _work = 'Overtime'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _work != 'Overtime'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/overtime.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _work = 'Hangout'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _work != 'Hangout'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/beer.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _work = 'Business Trip'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _work != 'Business Trip'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/suitcase.png'),
                    ),
                  ),
                ],
              ),
              Text('      Ontime      Overtime      Hangout   Business Trip'),
              //hobby
              SizedBox(height: 30),
              Text(
                'Hobbies',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _hobby = 'Excercise'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _hobby != 'Excercise'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/exercise.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _hobby = 'Movie&TV'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _hobby != 'Movie&TV'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/tv.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _hobby = 'Gaming'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _hobby != 'Gaming'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/gaming.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _hobby = 'Reading'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _hobby != 'Reading'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/reading.png'),
                    ),
                  ),
                ],
              ),
              Text('Excercise    Movie&TV      Gaming       Reading'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _hobby = 'Playing Instrument'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _hobby != 'Playing Instrument'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/guitar.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _hobby = 'Taking a walk'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _hobby != 'Taking a walk'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/sneakers.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _hobby = 'Listening to music'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _hobby != 'Listening to music'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/headphones.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _hobby = 'Painting'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _hobby != 'Painting'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/paint.png'),
                    ),
                  ),
                ],
              ),
              Text(' Playing        Taking        Listening      Painting'),
              Text(
                  'Instrument      a walk        to music                        '),
              //event
              SizedBox(height: 30),
              Text(
                'Event',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _event = 'Cinema'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _event != 'Cinema'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/cinema.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _event = 'Theme park'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _event != 'Theme park'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/park.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _event = 'Shopping'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _event != 'Shopping'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/presents.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _event = 'Picnic'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _event != 'Picnic'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/picnic.png'),
                    ),
                  ),
                ],
              ),
              Text('Cinema    Theme park    Shopping        Picnic'),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() => _event = 'Stay home'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _event != 'Stay home'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/home.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _event = 'Party'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _event != 'Party'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/party.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _event = 'Restaurant'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _event != 'Restaurant'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/cutlery.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => setState(() => _event = 'Trip'),
                    child: Container(
                      height: 65,
                      width: 65,
                      color: _event != 'Trip'
                          ? Colors.transparent
                          : Color(0xFF8B82D0),
                      child: Image.asset('assets/van.png'),
                    ),
                  ),
                ],
              ),
              Text(
                  'Stay home       Party        Restaurant        Trip       '),
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                _formkey.currentState!.save();

                context.read<MoodModel>().event = _event;
                context.read<MoodModel>().health = _health;
                context.read<MoodModel>().hobby = _hobby;
                context.read<MoodModel>().mood = _mood;
                context.read<MoodModel>().rate = _rate;
                context.read<MoodModel>().romance = _romance;
                context.read<MoodModel>().social = _social;
                context.read<MoodModel>().weather = _weather;
                context.read<MoodModel>().work = _work;

                Navigator.pop(context);
              }
            },
            child: Text('Done'),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF5F478C),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
