import 'package:flutter/material.dart';
import 'package:midterm_app/models/task_model.dart';
import 'package:provider/provider.dart';
import 'TaskEdit.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO LIST"),
      ),
      body: TodoList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {Navigator.pushNamed(context, "/4")},
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
        builder: (context, todoModel, child) => ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: todoModel.todos.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFD376),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: 150,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.assignment_outlined, size: 30,),
                          onPressed: () {},
                        ),
                        Text(
                          '${todoModel.todos[index].title}',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ]
                    ),
                  ),
              );
              }
            )
          );
  }
}