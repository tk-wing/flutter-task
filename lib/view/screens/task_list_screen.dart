import 'package:flutter/material.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/task/task.dart';
import 'package:flutter_task/view/components/task_list.dart';

class TaskListScreen extends StatefulWidget {
  final GlobalKey<AnimatedListState> animatedListKey;
  final bool isLoading;
  final BucketEntity bucketEntity;
  final List<TaskEntity> taskEntities;
  final Function(int) onInit;

  const TaskListScreen({
    @required this.animatedListKey,
    @required this.isLoading,
    @required this.bucketEntity,
    @required this.taskEntities,
    @required this.onInit,
  });

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  void initState() {
    super.initState();
    widget.onInit(widget.bucketEntity.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.bucketEntity.name),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'タスク追加',
          onPressed: null,
        ),
        body: widget.isLoading
        ? const Center(child: CircularProgressIndicator())
        : TaskList(
          animatedListKey: widget.animatedListKey,
          taskEntities: widget.taskEntities,
        ),
      ),
    );
  }
}
