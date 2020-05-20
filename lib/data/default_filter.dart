import 'package:flutter/material.dart';
import 'package:flutter_task/data/task_list.dart';

class Filter extends BaseTaskList {
  final Icon icon;

  Filter({String name, int count = 0, this.icon}) : super(name: name, count: count);
}

List<Filter> defaultFilter = [
  Filter(icon: Icon(Icons.today), name: '今日'),
  Filter(icon: Icon(Icons.date_range), name: '近日中'),
  Filter(icon: Icon(Icons.event_busy), name: '期限なし'),
  Filter(icon: Icon(Icons.inbox), name: 'すべて'),
  Filter(icon: Icon(Icons.assignment_turned_in), name: '完了したタスク'),
];
