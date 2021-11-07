import 'package:flutter/material.dart';
import 'package:midterm_app/models/mood_model.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MonthlyMood extends StatefulWidget {
  @override
  _MonthlyMoodState createState() => _MonthlyMoodState();
}

class _MonthlyMoodState extends State<MonthlyMood> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _date;

  @override
  Widget build(BuildContext context) {
    _date = DateFormat("dd-MM-yyyy").format(_focusedDay);
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Tracker'),
      ),
      body: Column(
        children: [
          Container(
            child: TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(20),
            height: 150,
            width: 350,
            color: Color(0xFF8B82D0),
            child: Consumer<MoodModel>(
              builder: (context, model, child) {
                return Text(
                  '$_date - Rate: ${model.rate}, Mood: ${model.mood}, Weater: ${model.weather}, Social: ${model.social}, Romance: ${model.romance}, Health: ${model.health}, Work: ${model.work}, Hobby: ${model.hobby}, Event: ${model.event}.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, '/7');
        },
        tooltip: 'Add today mood',
        child: Icon(Icons.add),
      ),
    );
  }
}
