import 'package:flutter/material.dart';
import 'package:flutter_task/models/task/task.dart';

class FilterTaskList extends StatefulWidget {
  final List<TaskEntity> taskEntities;
  final VoidCallback onInit;

  const FilterTaskList({
    @required this.taskEntities,
    @required this.onInit,
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
        leading: Checkbox(value: taskEntity.doneAt != null, onChanged: (bool hoge) => print('hoge')),
        title: Text(taskEntity.title),
        subtitle: taskEntity.description != null ? Text(taskEntity.description, maxLines: 1) : null,
        trailing: GestureDetector(
          child: Icon(Icons.menu),
          // TODO 並び替え
          onTap: () => print('humbger'),
        ),
      ),
    );
  }
}
