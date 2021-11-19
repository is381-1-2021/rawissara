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
                    color: Color(0xFFFFD376),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  //height: 150,
                  child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Checkbox(
                          onChanged: null,
                          value: tasks[index].completed,
                          //title: Text(todos[index].title),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                          'DUEDATE : ${tasks[index].duedate.toString().substring(0, tasks[index].duedate.toString().lastIndexOf(' '))}',
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(height: 10),
                            Text(
                          '${tasks[index].headline}',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF5F478C),
                            fontWeight: FontWeight.bold
              //              foreground: Paint()
              //..style = PaintingStyle.stroke
              //..strokeWidth = 1
              //..color = Color(0xFF5F478C),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${tasks[index].detail}',
                          //textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                          ],
                        ),
                      ]
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