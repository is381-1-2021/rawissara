import 'dart:collection';
import 'package:flutter/material.dart';
import 'Todo.dart';


class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(id: 1, title: "Go to hospital \n Go to vaccinated.", description: "My first todo"),
    Todo(id: 2, title: 'Watering a plant \n Cactus and banana.', description: "My second todo"),
    Todo(id: 3, title: 'Read final exam \n One night miracle.', description: "My third todo"),
  ];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  void add(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
}
