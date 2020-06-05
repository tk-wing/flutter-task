import 'package:flutter/material.dart';
import 'package:flutter_task/models/task/task.dart';

@immutable
class TaskState {
  final List<TaskEntity> tasks;

  const TaskState({
    this.tasks,
    });

  TaskState.initState():
    this.tasks = [];
}




