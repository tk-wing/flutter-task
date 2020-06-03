import 'package:flutter/material.dart';
import 'package:flutter_task/models/task/task.dart';

@immutable
class TaskState {
  final bool isLoading;
  final List<TaskEntity> tasks;

  const TaskState({
    this.isLoading,
    this.tasks,
    });

  TaskState.initState():
    this.isLoading = true,
    this.tasks = [];
}




