import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String detail;
  final String headline;

  Task(this.detail, this.headline);

  factory Task.fromJson(
    Map<String, dynamic> json,
  ) {
    return Task(
      json['detail'] as String,
      json['headline'] as String,
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