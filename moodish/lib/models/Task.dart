import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String detail;
  final DateTime duedate;
  final String headline;
  bool completed;

  Task(this.detail, this.duedate, this.headline,this.completed);

  factory Task.fromJson(
    Map<String, dynamic> json,
  ) {
    return Task(
      json['detail'] as String,
      (json['duedate'] as Timestamp).toDate(),
      json['headline'] as String,
      json['completed'] as bool,
    );
  }
}

class AllTasks {
  final List<Task> tasks;

  AllTasks(this.tasks);

  factory AllTasks.fromJson(
    List<dynamic> json,
  ) {
    var x = json.map((record) => Task.fromJson(record)).toList();

    return AllTasks(x);
  }

  factory AllTasks.fromSnapshot(
    QuerySnapshot snapshot
  ) {
    var x = snapshot.docs.map((record) {
      return Task.fromJson(
        record.data() as Map<String, dynamic>
      );
    }).toList();

    return AllTasks(x);
  }
}