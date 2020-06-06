import 'package:flutter/material.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/task/task.dart';

class TaskList extends StatefulWidget {
  final List<TaskEntity> taskEntities;
  final VoidCallback onInit;

  const TaskList({
    @required this.taskEntities,
    @required this.onInit,
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
        trailing: GestureDetector(
          child: Icon(Icons.menu),
          // TODO 並び替え
          onTap: () => print('humbger'),
        ),
      ),
    );
  }
}

// class TaskList extends StatelessWidget {
//   final List<TaskEntity> taskEntities;

//   const TaskList({
//     @required this.taskEntities,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: taskEntities.length,
//       itemBuilder: (context, index) => _buildItem(taskEntities[index], index),
//       );
//     // return AnimatedList(
//     //   key: animatedListKey,
//     //   initialItemCount: taskEntities.length,
//     //   itemBuilder: (context, index, animation) {
//     //     //TODO
//     //     return _buildItem(context, taskEntities[index], animation);
//     //   },
//     // );
//   }

//   Widget _buildItem(TaskEntity taskEntity, int currentIndex) {
//     return Card(
//       child: ListTile(
//         leading: Checkbox(value: taskEntity.doneAt != null, onChanged: (bool hoge) =>  print('hoge')),
//           title: Text(taskEntity.title),
//           subtitle: taskEntity.description != null
//               ? Text(taskEntity.description, maxLines: 1)
//               : null,
//           trailing: GestureDetector(
//             child: Icon(Icons.menu),
//             // TODO 並び替え
//             onTap: () => print('humbger'),
//           ),
//       ),
//     );
//   }

//   // Widget _buildItem(BuildContext context, TaskEntity taskEntity,
//   //     Animation<double> animation) {
//   //   return SizeTransition(
//   //     sizeFactor: animation,
//   //     child: Card(
//   //       child: ListTile(
//   //         leading: Checkbox(value: taskEntity.doneAt != null, onChanged: (bool hoge) =>  print('hoge')),
//   //         title: Text(taskEntity.title),
//   //         subtitle: taskEntity.description != null
//   //             ? Text(taskEntity.description, maxLines: 1)
//   //             : null,
//   //         trailing: GestureDetector(
//   //           child: Icon(Icons.menu),
//   //           // TODO 並び替え
//   //           onTap: () => print('humbger'),
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
// }
