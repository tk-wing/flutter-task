import 'package:flutter/material.dart';
import 'package:flutter_task/data/default_task_list.dart';

class TaskListTile extends StatelessWidget {
  final TaskList taskList;
  final bool isEditable;
  final ValueChanged<TaskList> onTapNext;

  TaskListTile(
      {@required this.taskList,
      @required this.isEditable,
      @required this.onTapNext});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: true,
      dense: true,
      onTap: () => print('hogehoge'),
      leading: Icon(
        Icons.fiber_manual_record,
        color: Color(taskList.color),
      ),
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(taskList.name),
            isEditable
                ? GestureDetector(
                    child: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    onTap: () => print('delete'))
                : Text(taskList.count.toString()),
          ]),
      trailing: isEditable
          ? GestureDetector(
              child: Icon(Icons.menu), onTap: () => print('humbger'))
          : GestureDetector(
              child: Icon(Icons.navigate_next),
              onTap: () => onTapNext(taskList)),
    );
  }
}
