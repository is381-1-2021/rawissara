import 'package:flutter/material.dart';

class FormModel extends ChangeNotifier {
  String? _Email;
  get Email => this._Email;

  set Email(value) {
    this._Email = value;
    notifyListeners();
  }
}
