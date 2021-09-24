import 'package:flutter/material.dart';

class FormModel extends ChangeNotifier {
  String? _firstName;
  String? _lastname;
  int? _age;
  
  get firstName => this._firstName;

  set firstName(value) {
    this._firstName = value;
    notifyListeners();
  }

  get lastname => this._lastname;

  set lastname(value) {
    this._lastname = value;
    notifyListeners();
  }

  get age => this._age;

  set age(value) {
    this._age = value;
    notifyListeners();
  }
}
