import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/model/transaction_model.dart';
import 'package:flutter/material.dart';

class BalanceModel extends ChangeNotifier {
  //final DateTime DateAdd;
  final double Balance;
  get getBalance => this.Balance;

  set setBalance(Balance) {
    notifyListeners();
  } 

  BalanceModel(this.Balance);

  factory BalanceModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return BalanceModel(
      //(json['DateAdd'] as Timestamp).toDate(),
      json['Balance'] as double,
    );
  }

  BalanceModel.fromSnapshot(DocumentSnapshot snapshot) :
    //DateAdd = snapshot['DateAdd'].toDate(),
    Balance = snapshot['Balance'];
  
}

class TotalOperation extends ChangeNotifier{
  double sum = 1000;
  double get getSum => this.sum;
  set setSum(double sum) {
     this.sum = sum;
     notifyListeners();
  }

  List<BalanceModel> _balance = [];
  List<BalanceModel> get getBalance{
    return _balance;
  }

  BalanceOperaion() {
    getTotalBalance(0.0);
  }

  void getTotalBalance(double sum){
   BalanceModel balance = BalanceModel(0.0);
    _balance.add(balance);
    
    _balance.forEach((item) { 
      sum = sum + item.Balance;
    });
    FirebaseFirestore.instance.collection('mind_todos')
    .doc('TpLRZioBLR3mLNZR9Mj9')
    .update({'Balance': FieldValue.increment(sum)})
    .then((_) => print('Updated Balance'))
    .catchError((error) => print('Failed: $error'));
    notifyListeners();
  }

  void showTotalBalance(){

  }
}