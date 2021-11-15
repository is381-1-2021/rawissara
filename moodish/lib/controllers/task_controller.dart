import 'dart:async';

import 'package:midterm_app/models/Task.dart';
import 'package:midterm_app/services/services.dart';

class TaskController {
  final Services services;
  List<Task> tasks = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  TaskController(this.services);

  Future<List<Task>> fetchTasks() async {
    onSyncController.add(true);
    tasks = await services.getTasks();
    onSyncController.add(false);

    return tasks;
  }
} 