import 'package:flutter/material.dart';
import 'package:flutter_task/containers/task_list_container.dart';
import 'package:flutter_task/models/bucket/bucket.dart';

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
          onPressed: null,
        ),
        body: TasktListContainer(bucketEntity: bucketEntity),
      ),
    );
  }
}


