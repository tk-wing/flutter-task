import 'package:flutter/material.dart';
import 'package:flutter_task/models/task/task.dart';

class TaskList extends StatelessWidget {
  final GlobalKey<AnimatedListState> animatedListKey;
  final List<TaskEntity> taskEntities;


  const TaskList({
    @required this.animatedListKey,
    @required this.taskEntities,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: animatedListKey,
      initialItemCount: taskEntities.length,
      itemBuilder: (context, index, animation) {
        //TODO
        return _buildItem(context, taskEntities[index], animation);
      },
    );
  }

  Widget _buildItem(BuildContext context, TaskEntity taskEntity,
      Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          leading: Checkbox(value: taskEntity.doneAt != null, onChanged: (bool hoge) =>  print('hoge')),
          title: Text(taskEntity.title),
          subtitle: taskEntity.description != null
              ? Text(taskEntity.description, maxLines: 1)
              : null,
          trailing: GestureDetector(
            child: Icon(Icons.menu),
            // TODO 並び替え
            onTap: () => print('humbger'),
          ),
        ),
      ),
    );
  }
}
