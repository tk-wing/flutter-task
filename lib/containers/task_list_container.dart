import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/task/task.dart';
import 'package:flutter_task/redux/actions/task.action.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/components/task_list.dart';
import 'package:redux/redux.dart';

class TasktListContainer extends StatelessWidget {
  final BucketEntity bucketEntity;
  final Future<void> Function(BuildContext, TaskEntity) toTaskEditScreen;

  const TasktListContainer({
    @required this.bucketEntity,
    @required this.toTaskEditScreen,
    });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, viewModel) =>
      TaskList(
        taskEntities: viewModel.taskEntities,
        onInit: () => viewModel.onInit(bucketEntity.id),
        onPressedUpdate: viewModel.onPressedUpdate,
        toTaskEditScreen: toTaskEditScreen,
        )
    );
  }
}

class _ViewModel {
  final bool isLoading;
  final List<TaskEntity> taskEntities;
  final Function(int) onInit;
  final Function(TaskEntity) onPressedUpdate;

  _ViewModel({@required this.isLoading, @required this.taskEntities, @required this.onInit, @required this.onPressedUpdate,});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.isLoading,
      taskEntities: store.state.taskState.tasks,
      onInit: (bucketId) => store.dispatch(
        GetTasksByBucketIdAction(bucketId),
      ),
      onPressedUpdate: (taskEntity) {
          store.dispatch(UpdateTaskAction(taskEntity));
      }
    );
  }
}
