import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/task/task.dart';
import 'package:flutter_task/redux/actions/task.action.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/screens/task_input_screen.dart';
import 'package:redux/redux.dart';

class TaskEdit extends StatelessWidget {
  final TaskEntity taskEntity;

  const TaskEdit({this.taskEntity});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, viewModel) {
        return TaskInputScreen.edit(
          bucketEntites: viewModel.bucketEntities,
          taskEntity: taskEntity,
          onPressedUpdate: viewModel.onPressedUpdate,
          );
      },
    );
  }
}

class _ViewModel {
  final List<BucketEntity> bucketEntities;
  final ValueChanged<TaskEntity> onPressedUpdate;

  _ViewModel({@required this.bucketEntities, @required this.onPressedUpdate});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        bucketEntities: store.state.bucketState.bucketEntities,
        onPressedUpdate: (taskEntity) {
          store.dispatch(UpdateTaskAction(taskEntity));
        });
  }
}
