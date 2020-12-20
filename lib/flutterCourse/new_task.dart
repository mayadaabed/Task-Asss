import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskass_db/flutterCourse/task_model.dart';
import '../db_Helper.dart';

class NewTasks extends StatefulWidget {
  @override
  _NewTasksState createState() => _NewTasksState();
}

class _NewTasksState extends State<NewTasks> {
  bool isComplete = false;
  int iscompInt;
  String taskName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new Tasks'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (value) {
                this.taskName = value;
              },
            ),
            Checkbox(
                value: isComplete,
                onChanged: (value) {
                  value ? iscompInt = 1: iscompInt = 0;
                  setState(() {});
                }),
            RaisedButton(
                child: Text('Add New Task'),
                onPressed: () {
                  Task task = Task(
                      taskName: this.taskName, isComplete: this.iscompInt);
                  DBHelper.dbHelper.insertnewTask(task);
                  Navigator.pop(context);
                })
          ],
        ),
      ),
    );
  }
}
