import 'package:flutter/material.dart';
import 'package:flutter_task/containers/task_edit.dart';
import 'package:flutter_task/models/task/task.dart';

class FilterTaskList extends StatefulWidget {
  final List<TaskEntity> taskEntities;
  final VoidCallback onInit;
  final Function(TaskEntity) onPressedUpdate;
  final Future<void> Function(BuildContext, TaskEntity) toTaskEditScreen;

  const FilterTaskList({
    @required this.taskEntities,
    @required this.onInit,
    @required this.onPressedUpdate,
    @required this.toTaskEditScreen,
  });

  @override
  _FilterTaskList createState() => _FilterTaskList();
}

class _FilterTaskList extends State<FilterTaskList> {
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
        leading: Checkbox(
          value: taskEntity.doneAt != null,
          onChanged: (_) => taskEntity.doneAt == null
          ? _onPressedDone(taskEntity)
          : _onPressedUndone(taskEntity)
        ),
        title: Text(taskEntity.title),
        subtitle: taskEntity.description != null
            ? Text(taskEntity.description, maxLines: 1)
            : null,
        onTap: () async {
          await widget.toTaskEditScreen(context, taskEntity);
          setState(() {
            widget.onInit();
          });
        },
        trailing: GestureDetector(
          child: Icon(Icons.menu),
          // TODO 並び替え
          onTap: () => print('humbger'),
        ),
      ),
    );
  }

  void _onPressedDone(TaskEntity taskEntity) {
    final cloneTaskEntity = taskEntity.clone();
    cloneTaskEntity.doneAt = DateTime.now();

    widget.onPressedUpdate(cloneTaskEntity);

  }

  void _onPressedUndone(TaskEntity taskEntity) {
    final cloneTaskEntity = taskEntity.clone();
    cloneTaskEntity.doneAt = null;

    widget.onPressedUpdate(cloneTaskEntity);

  }

}
