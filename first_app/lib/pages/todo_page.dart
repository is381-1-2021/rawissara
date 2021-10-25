import 'package:first_app/controllers/todo_controller.dart';
import 'package:first_app/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget{
  final TodoController controller;
  
  TodoPage({required this.controller});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos = List.empty();
  bool isLoading = false;

  void initState() {
    super.initState();

    widget.controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getTodos() async {
    var newTodos = await widget.controller.fetchTodos();

    setState(() => todos = newTodos);
  }

  Widget get body => isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
            itemCount: todos.isEmpty ? 1 : todos.length,
            itemBuilder: (ctx, index) {
              if (todos.isEmpty) {
                return Text('Tap button to fetch todos');
              }

              return CheckboxListTile(
                onChanged: null,
                value: todos[index].completed,
                title: Text(todos[index].title),
              );
            },
          );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Todos'),
      ),
      body: Center(child: body),
      floatingActionButton: FloatingActionButton(
        onPressed: _getTodos,
        child: Icon(Icons.add),
      ),
    );
  }
}