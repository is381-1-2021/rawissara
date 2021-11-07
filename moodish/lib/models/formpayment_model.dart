import 'package:flutter/material.dart';

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