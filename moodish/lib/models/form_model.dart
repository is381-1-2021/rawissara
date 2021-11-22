import 'package:flutter/material.dart';

//Login form
class FormModel extends ChangeNotifier {
  String? _Email;
  String? _Password;

  bool isLogin = false;
  bool isLogout = true;

  bool get getIsLogout => this.isLogout;

  set setIsLogout(bool isLogout){
    this.isLogout = isLogout;
    notifyListeners();
  } 

  bool get getIsLogin => this.isLogin;

  set setIsLogin(bool isLogin) {
    this.isLogin = isLogin;
    notifyListeners();
  } 

  get Email => this._Email;

  set Email(value) {
    this._Email = value;
    notifyListeners();
  }

  get Password => this._Password;

  set Password(value) => this._Password = value;
}
