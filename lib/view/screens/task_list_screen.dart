import 'package:flutter/material.dart';
import 'package:flutter_task/containers/task_list_container.dart';
import 'package:flutter_task/models/bucket/bucket.dart';

class TaskListScreen extends StatelessWidget {
  final BucketEntity bucketEntity;

  const TaskListScreen({
    @required this.bucketEntity,
  });

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(bucketEntity.name),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'タスク追加',
          onPressed: null,
        ),
        body: TasktListContainer(bucketEntity: bucketEntity),
      ),
    );
  }
}

// class TaskListScreen extends StatefulWidget {
//   final GlobalKey<AnimatedListState> animatedListKey;
//   final BucketEntity bucketEntity;
//   final List<TaskEntity> taskEntities;
//   final Function(int) onInit;

//   const TaskListScreen({
//     @required this.bucketEntity,
//   });

//   @override
//   _TaskListScreenState createState() => _TaskListScreenState();
// }

// class _TaskListScreenState extends State<TaskListScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(widget.bucketEntity.name),
//           centerTitle: true,
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           tooltip: 'タスク追加',
//           onPressed: null,
//         ),
//         body: TasktListContainer(bucketEntity: ,),
//         // body: AppLoading(
//         //   builder: (context, isLoading) {
//         //     return isLoading
//         //         ? const Center(
//         //             child: CircularProgressIndicator(),
//         //           )
//         //         : TaskList(
//         //             animatedListKey: widget.animatedListKey,
//         //             taskEntities: widget.taskEntities,
//         //           );
//         //   },
//         // ),
//       ),
//     );
//   }
// }
