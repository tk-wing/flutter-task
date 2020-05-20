import 'package:flutter/material.dart';
import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/data/default_task_list.dart';
import 'package:flutter_task/data/task_list.dart';
import 'package:flutter_task/view/components/filter_tile.dart';
import 'package:flutter_task/view/components/task_list_tile.dart';
import 'package:flutter_task/view/screens/task_list_screen.dart';
import 'package:flutter_task/viewModel/list_viewmodel.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ListViewModel>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'タスク追加',
          onPressed: null,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 8.0),
                child: Text('フィルター', style: TextStyle(color: Colors.white70)),
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemExtent: 40,
                  itemBuilder: (context, int i) => FilterTile(
                    filter: defaultFilter[i],
                    onTapNext: (filter) => _toTaskListScreen(filter, context),
                  ),
                  itemCount: defaultFilter.length,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('タスクリスト', style: TextStyle(color: Colors.white70)),
                      GestureDetector(
                          child: Icon(Icons.edit),
                          onTap: () => viewModel.onTapListEdit()),
                    ]),
              ),
              Divider(
                color: Colors.grey,
              ),
              Consumer<ListViewModel>(
                builder: (context, model, child) {
                  return AnimatedContainer(
                    curve: Curves.fastOutSlowIn,
                    height: model.isEditable ? 40 : 0,
                    duration: Duration(milliseconds: 300),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                            child: child,
                            opacity: animation,
                            );
                      },
                      child: model.isEditable
                          ? ListTile(
                              dense: true,
                              leading: GestureDetector(
                                child: Icon(
                                  Icons.add_circle,
                                  color: Colors.lightGreenAccent[700],
                                ),
                                onTap: () => print('add task list'),
                              ),
                              title: Text('タスクリスト追加'),
                            )
                          : Container(),
                    ),
                  );
                },
              ),
              Consumer<ListViewModel>(
                builder: (context, model, child) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemExtent: 40,
                    itemBuilder: (context, int i) => TaskListTile(
                      taskList: defaultTaskList[i],
                      isEditable: model.isEditable,
                      onTapNext: (taskList) =>
                          _toTaskListScreen(taskList, context),
                    ),
                    itemCount: defaultTaskList.length,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _toTaskListScreen(BaseTaskList taskList, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TaskListScreen(taskList: taskList)));
  }
}
