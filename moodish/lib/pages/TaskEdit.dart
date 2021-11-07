import 'package:flutter/material.dart';
import 'package:midterm_app/models/Todo.dart';
import 'package:midterm_app/models/task_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class TodoEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Task Edit"),
        ),
        body: TodoForm());
  }
}

class TodoForm extends StatefulWidget {
  @override
  TodoFormState createState() {
    return TodoFormState();
  }
}

class TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  final TodoModel? todoModel;

  TodoFormState({this.todoModel});

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void createTodo(Function addTodo) {
    var todo = new Todo(
        title: titleController.text, description: descriptionController.text);
    addTodo(todo);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Consumer<TodoModel>(
            builder: (context, todoModel, child) => Column(children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.assignment),
                      hintText: 'input task headline',
                      labelText: 'TASK'),
                    controller: titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter task.';
                        }
                      },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.info),
                      hintText: 'input task detail',
                      labelText: 'DETAIL'),
                    controller: descriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter task detail.';
                        }
                      },
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).accentColor,
                      fixedSize: Size(200,50),
                      textStyle: TextStyle(fontSize: 20)
                    ),
                    child: Text("Save"),
                    onPressed: () => {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save(),
                      createTodo(todoModel.add),
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('TASK ADDING SUCCEED!'),
                      ))
                      },
                    },
                  ),
                ]
              )
            )
          );
        }
      }
