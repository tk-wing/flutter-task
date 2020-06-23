import 'package:flutter/material.dart';
import 'package:flutter_task/models/task/task.dart';

class TaskList extends StatefulWidget {
  final List<TaskEntity> taskEntities;
  final VoidCallback onInit;
  final Function(BuildContext, TaskEntity) toTaskEditScreen;

  const TaskList({
    @required this.taskEntities,
    @required this.onInit,
    @required this.toTaskEditScreen,
  });

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<TaskEntity> get taskEntities => widget.taskEntities;

  @override
  void initState() {
    widget.onInit();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: taskEntities.length,
      itemBuilder: (context, index) => _buildItem(taskEntities[index], index),
    );
  }

  Widget _buildItem(TaskEntity taskEntity, int currentIndex) {
    return Card(
      child: ListTile(
        leading: Checkbox(value: taskEntity.doneAt != null, onChanged: (bool hoge) => print('hoge')),
        title: Text(taskEntity.title),
        subtitle: taskEntity.description != null ? Text(taskEntity.description, maxLines: 1) : null,
        onTap: () => widget.toTaskEditScreen(context, taskEntity),
        trailing: GestureDetector(
          child: Icon(Icons.menu),
          // TODO 並び替え
          onTap: () => print('humbger'),
        ),
      ),
    );
  }
}
