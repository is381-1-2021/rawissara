import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:midterm_app/models/Task.dart';

class TasksOperation extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get getTasks {
    return _tasks;
  }

  TasksOperation() {
    addNewTask('ไม่จำเป็นต้องแข่งขัน เพราะเรานั้นไม่ใช่ไก่', 'qwerrtfsdigh;defoigh');
  }

  void addNewTask(String detail, String headline) {
    Task task = Task(detail, headline);
    _tasks.add(task);
    notifyListeners();
  }
}