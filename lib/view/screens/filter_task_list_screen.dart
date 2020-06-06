import 'package:flutter/material.dart';
import 'package:flutter_task/containers/filter_task_list_container.dart';
import 'package:flutter_task/data/default_filter.dart';

class FilterTaskListScreen extends StatelessWidget {
  final DefaultFilter defaultFilter;

  const FilterTaskListScreen({@required this.defaultFilter});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(defaultFilter.name),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'タスク追加',
          onPressed: null,
        ),
        body: FilterTaskListContainer(defaultFilter: defaultFilter),
      ),
    );
  }
}
