
import 'package:flutter_task/data/task_list.dart';

class TaskList extends BaseTaskList {
  final int color;

  TaskList({String name, int count = 0, this.color}): super(name: name, count: count);
}

List<TaskList> defaultTaskList = [
  TaskList(color: 0xFFF44335, name: 'マイタスク'),
  TaskList(color: 0xFF2196F3, name: '仕事'),
  TaskList(color: 0xFF4CAF50, name: '家'),
];

