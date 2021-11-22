import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/task_controller.dart';
import 'package:midterm_app/models/Task.dart';
import 'package:midterm_app/services/services.dart';
import 'package:provider/provider.dart';
import 'TaskEdit.dart';

class AllTask extends StatefulWidget {
  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  List<Task> tasks = List.empty();
  bool isLoading = false;
  bool completed = false;
  var services = FirebaseServices();
  var controller;
  void initState() {
    super.initState();
    controller = TaskController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getTasks() async {
    var newTasks = await controller.fetchTasks();

    setState(() => tasks = newTasks);
  }

  Widget get body => isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
            itemCount: tasks.isEmpty ? 1 : tasks.length,
            itemBuilder: (ctx, index) {
              if (tasks.isEmpty) {
                return Text('Tap button to fetch tasks');
              }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: (tasks[index].completed == true)
                      ? Colors.grey
                      : Color(0xFFFFD376),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: CheckboxListTile(
                  value: tasks[index].completed,
                  isThreeLine: true,
                  onChanged: (bool? value) {
                    setState(() {
                      tasks[index].completed = value!;
                    });
                    
                    
                    Map<String, dynamic> data = {"completed": value};
                    FirebaseFirestore.instance
                        .collection("moodish_task")
                        .doc('')
                        .update(data)
                        .then((value) => print("Tasks status Updated"))
                        .catchError((error) =>
                            print("Failed to update tasks status!!"));

                    //Navigator.pop(context);
                  },
                  subtitle: Text(
                      'DUEDATE : ${tasks[index].duedate.toString().substring(0, tasks[index].duedate.toString().lastIndexOf(' '))}'),
                  title: Column(
                    children: [
                      Text(
                        '${tasks[index].headline}',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF5F478C),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${tasks[index].detail}',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.pushNamed(context, '/4');},
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      appBar: AppBar(
        title: Text('All your tasks'),
        actions: [
         IconButton(
           icon: Icon(Icons.refresh),
           onPressed: _getTasks,
         ),
      ],
      ),
      body: Align(
          alignment: Alignment.centerLeft,
          child: body
          ),
    );
  }
}