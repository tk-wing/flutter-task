import 'package:flutter/material.dart';
import 'package:flutter_task/data/default_task_list.dart';
import 'package:flutter_task/data/task_list.dart';

class TaskListScreen extends StatelessWidget {
  final BaseTaskList taskList;

  TaskListScreen({this.taskList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(taskList.name),
          centerTitle: true,
        ),
      ),
    );
  }
}
