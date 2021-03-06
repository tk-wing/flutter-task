import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/task/task.dart';
import 'package:flutter_task/redux/actions/task.action.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/screens/task_input_screen.dart';
import 'package:redux/redux.dart';

class TaskCreate extends StatelessWidget {
  final bool isAdd;
  final int bucketId;

  const TaskCreate({
    this.isAdd = false,
    this.bucketId = 0,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, viewModel) {
        return TaskInputScreen.create(
          bucketEntites: viewModel.bucketEntities,
          onPressedSave: viewModel.onPressedSave,
          bucketId: bucketId,
          isAdd: isAdd,
        );
      },
    );
  }
}

class _ViewModel {
  final List<BucketEntity> bucketEntities;
  final Function(TaskModel, bool) onPressedSave;

  _ViewModel({@required this.bucketEntities, @required this.onPressedSave});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        bucketEntities: store.state.bucketState.bucketEntities,
        onPressedSave: (taskModel, isAdd) {
          store.dispatch(CreateTaskAction(taskModel: taskModel, isAdd: isAdd));
        });
  }
}
