import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderModel{
  final String itemName;
  final DateTime order_date;
  final String status;
  final String amount;

  OrderModel(this.itemName, this.order_date, this.status,this.amount);

  factory OrderModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return OrderModel(
      json['itemName'] as String,
      (json['order_date'] as Timestamp).toDate(),
      json['status'] as String,
      json['amount'] as String,
    );
  }
}

class AllOrders {
  final List<OrderModel> orders;

  AllOrders(this.orders);

  factory AllOrders.fromJson(
    List<dynamic> json,
  ){
    var x = json.map((record) => OrderModel.fromJson(record)).toList();
  
    return AllOrders(x);
  }

  factory AllOrders.fromSnapshot(
    QuerySnapshot snapshot
  ) {
    var x = snapshot.docs.map((record) {
      return OrderModel.fromJson(
        record.data() as Map<String, dynamic>
      );
    }).toList();

    return AllOrders(x);
  }
}




//provider เดิม
class PaymentModel extends ChangeNotifier{
 String? _name;
 String? _orderref;
 String? _datetime;
 int? _amount;
  
  get name => this._name;

  set name(value) {
    this._name = value;
    notifyListeners();
  }

  get orderref => this._orderref;

  set orderref(value) {
    this._orderref = value;
    notifyListeners();
  }

  get datetime => this._datetime;

  set datetime(value) {
    this._datetime = value;
    notifyListeners();
  }

  get amount => this._amount;

  set amount(value) {
    this._amount = value;
    notifyListeners();
  }
}
