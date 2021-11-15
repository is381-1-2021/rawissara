import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:midterm_app/models/Note.dart';
import 'package:midterm_app/models/Product_model.dart';
import 'package:midterm_app/models/Task.dart';

abstract class Services{
  Future<List<Note>> getNotes();
  Future<List<Task>> getTasks();
  Future<List<ProductModel>> getProducts();
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

  Future<List<Task>> getTasks() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore
          .instance
          .collection('moodish_task')
          .get();

    var all = AllTasks.fromSnapshot(snapshot);

    return all.tasks;
  }

  Future<List<ProductModel>> getProducts() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore
          .instance
          .collection('moodish_products')
          .get();

    var all = AllProducts.fromSnapshot(snapshot);

    return all.products;
  }
} 