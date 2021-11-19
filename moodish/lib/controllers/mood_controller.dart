import 'dart:async';

import 'package:midterm_app/models/mood.dart';
import 'package:midterm_app/services/services.dart';



class MoodController {
  final Services services;
  List<Mood> moods = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  MoodController(this.services);

  Future<List<Mood>> fetchMoods() async {
    onSyncController.add(true);
    moods = await services.getMoods();
    onSyncController.add(false);

    return moods;
  }
}