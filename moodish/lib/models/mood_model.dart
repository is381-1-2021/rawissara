import 'package:flutter/material.dart';

class MoodModel extends ChangeNotifier {
  String? _mood;
  String? _weather;
  String? _social;
  String? _romance;
  String? _health;
  String? _work;
  String? _hobby;
  String? _event;
  int? _rate;
  String? _date;

  get mood => this._mood;

  set mood(value) {
    this._mood = value;
    notifyListeners();
  }

  get weather => this._weather;

  set weather(value) {
    this._weather = value;
    notifyListeners();
  }

  get social => this._social;

  set social(value) {
    this._social = value;
    notifyListeners();
  }

  get romance => this._romance;

  set romance(value) {
    this._romance = value;
    notifyListeners();
  }

  get health => this._health;

  set health(value) {
    this._health = value;
    notifyListeners();
  }

  get work => this._work;

  set work(value) {
    this._work = value;
    notifyListeners();
  }

  get hobby => this._hobby;

  set hobby(value) {
    this._hobby = value;
    notifyListeners();
  }

  get event => this._event;

  set event(value) {
    this._event = value;
    notifyListeners();
  }

  get rate => this._rate;

  set rate(value) {
    this._rate = value;
    notifyListeners();
  }

  get date => this._date;

  set date(value) {
    this._date = value;
    notifyListeners();
  }
}
