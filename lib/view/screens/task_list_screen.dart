import 'package:flutter/material.dart';
import 'package:flutter_task/containers/task_create.dart';
import 'package:flutter_task/containers/task_edit.dart';
import 'package:flutter_task/containers/task_list_container.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/task/task.dart';

class TaskListScreen extends StatelessWidget {
  final BucketEntity bucketEntity;

  const TaskListScreen({
    @required this.bucketEntity,
  });

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(bucketEntity.name),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'タスク追加',
          onPressed: () => _toTaskCreateScreen(context),
        ),
        body: TasktListContainer(
          bucketEntity: bucketEntity,
          toTaskEditScreen: _toTaskEditScreen,
          ),
      ),
    );
  }

  void _toTaskCreateScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => TaskCreate(bucketId: bucketEntity.id, isAdd: true)),
    );
  }

  void _toTaskEditScreen(BuildContext context, TaskEntity taskEntity){
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => TaskEdit(taskEntity: taskEntity)),
    );
  }
}


