import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/mood_controller.dart';
import 'package:midterm_app/models/mood.dart';
import 'package:midterm_app/services/services.dart';


class AllMood extends StatefulWidget {
  @override
  _AllMoodState createState() => _AllMoodState();
}

class _AllMoodState extends State<AllMood> {
  List<Mood> moods = List.empty();
  bool isLoading = false;
  var services = FirebaseServices();
  var controller;

  void initState() {
    super.initState();
    controller = MoodController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getMoods() async {
    var newMoods = await controller.fetchMoods();

    setState(() => moods = newMoods);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: moods.isEmpty ? 1 : moods.length,
          itemBuilder: (ctx, index) {
            if (moods.isEmpty) {
              return Text('Tap button to fetch moods');
            }
            return Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              height: 120,
              decoration: BoxDecoration(
                  color: Color(0xFF9ADCF1),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${moods[index].mood_date.toString().substring(0, moods[index].mood_date.toString().lastIndexOf(' '))}',
                      style: TextStyle(color: Colors.black)),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        moods[index].mood,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            );
          },
        );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: _getMoods,
          child: Icon(
            Icons.refresh,
            size: 30,
          ),
        ),
        appBar: AppBar(
          title: Text('Mood Tracker'),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, '/7');
              },
            ),
          ],
        ),
        body: Center(child: body));
  }
}