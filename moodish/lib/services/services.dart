import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:midterm_app/models/Note.dart';

abstract class Services{
  Future<List<Note>> getNotes();
}

class FirebaseServices extends Services{
  @override
  Future<List<Note>> getNotes() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore
          .instance
          .collection('moodish_quotes')
          .get();

    var all = AllNotes.fromSnapshot(snapshot);

    return all.notes;
  }
} 