import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_task/containers/app_loading.dart';
import 'package:flutter_task/containers/task_edit.dart';
import 'package:flutter_task/models/task/task.dart';

class FilterTaskList extends StatefulWidget {
  final List<TaskEntity> taskEntities;
  final VoidCallback onInit;
  final Function(TaskEntity) onPressedUpdate;
  final Function(TaskEntity) onPressedDelete;
  final Future<void> Function(BuildContext, TaskEntity) toTaskEditScreen;

  const FilterTaskList({
    @required this.taskEntities,
    @required this.onInit,
    @required this.onPressedUpdate,
    @required this.onPressedDelete,
    @required this.toTaskEditScreen,
  });

  @override
  _FilterTaskList createState() => _FilterTaskList();
}

class _FilterTaskList extends State<FilterTaskList> {
  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey<AnimatedListState>();
  List<TaskEntity> get taskEntities => widget.taskEntities;

  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return AppLoading(
      builder: (context, isLoading) {
        return isLoading
            ? Container()
            : AnimatedList(
                key: _animatedListKey,
                initialItemCount: taskEntities.length,
                itemBuilder: (context, index, animation) {
                  return _buildItem(taskEntities[index], index, animation);
                },
              );
      },
    );
  }

  Widget _buildItem(TaskEntity taskEntity, int currentIndex, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Dismissible(
        key: Key(taskEntity.id.toString()),
        child: Card(
          child: Slidable(
            actionPane: const SlidableDrawerActionPane(),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.red,
                icon: Icons.delete,
                onTap: () {
                  widget.onPressedDelete(taskEntity);
                  _animatedListKey.currentState.removeItem(
                    currentIndex,
                    (context, animation) => _buildItem(taskEntity, currentIndex, animation),
                  );
                },
              ),
            ],
            child: ListTile(
              leading: Checkbox(
                  value: taskEntity.doneAt != null,
                  onChanged: (_) => taskEntity.doneAt == null ? _onPressedDone(taskEntity) : _onPressedUndone(taskEntity)),
              title: Text(taskEntity.title),
              subtitle: taskEntity.description != null ? Text(taskEntity.description, maxLines: 1) : null,
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
          ),
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
