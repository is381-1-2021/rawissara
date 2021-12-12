import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BalanceModel extends ChangeNotifier {
  double balance = 0;

  double get getBalance => this.balance;

  set setBalance(double balance) {
    this.balance = balance;
    notifyListeners();
  } 
  
}

/*
  var totalBalanceValue = 0;

  Widget getBalanceTotal() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("mind_final").get();

    snapshot.docs.forEach((doc) {
      setState(() {
        totalBalanceValue += doc.data["Amount"];
      });
      return totalBalanceValue.toString();
    })
  } */
