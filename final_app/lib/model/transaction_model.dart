import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TransModel {
  final String Item;
  final DateTime Date;
  final String Type;
  final int Amount;

  TransModel(this.Item, this.Date, this.Type, this.Amount);

  factory TransModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return TransModel(
      json['Item'] as String,
      (json['Date'] as Timestamp).toDate(),
      json['Type'] as String,
      json['Amount'] as int,
    );
  }
}

class AllTrans {
  final List<TransModel> trans;

  AllTrans(this.trans);

  factory AllTrans.fromJson(
    List<dynamic> json,
  ) {
    var x = json.map((record) => TransModel.fromJson(record)).toList();

    return AllTrans(x);
  }

  factory AllTrans.fromSnapshot(QuerySnapshot snapshot) {
    var x = snapshot.docs.map((record) {
      return TransModel.fromJson(record.data() as Map<String, dynamic>);
    }).toList();

    return AllTrans(x);
  }
}
