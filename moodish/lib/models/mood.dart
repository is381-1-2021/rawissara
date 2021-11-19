import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:table_calendar/table_calendar.dart';

class Mood {
  final DateTime mood_date;
  final String mood;

  Mood(this.mood_date, this.mood);

  factory Mood.fromJson(
    Map<String, dynamic> json,
  ) {
    return Mood(
      (json['mood_date'] as Timestamp).toDate(),
      json['mood'] as String,
    );
  }
}

class AllMoods {
  final List<Mood> moods;

  AllMoods(this.moods);

  factory AllMoods.fromJson(
    List<dynamic> json,
  ) {
    var x = json.map((record) => Mood.fromJson(record)).toList();

    return AllMoods(x);
  }

  factory AllMoods.fromSnapshot(QuerySnapshot snapshot) {
    var x = snapshot.docs.map((record) {
      return Mood.fromJson(record.data() as Map<String, dynamic>);
    }).toList();

    return AllMoods(x);
  }
}

class MoodsOperation extends ChangeNotifier {
  List<Mood> _moods = [];

  List<Mood> get getMoods {
    return _moods;
  }

  MoodsOperation() {
    addNewMood('Happy');
  }

  void addNewMood(String mooddy) {
    Mood mood = Mood(DateTime.now(), mooddy);
    _moods.add(mood);
    notifyListeners();
  }
}