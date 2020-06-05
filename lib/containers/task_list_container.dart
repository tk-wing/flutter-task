import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/task/task.dart';
import 'package:flutter_task/redux/actions/task.action.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/screens/task_list_screen.dart';
import 'package:redux/redux.dart';

class TasktListContainer extends StatelessWidget {
  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey();
  final BucketEntity bucketEntity;

  TasktListContainer({this.bucketEntity});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, viewModel) {
        return TaskListScreen(
          animatedListKey: _animatedListKey,
          bucketEntity: bucketEntity,
          taskEntities: viewModel.taskEntities,
          onInit: viewModel.onInit,
        );
      },
    );
  }
}

class _ViewModel {
  final bool isLoading;
  final List<TaskEntity> taskEntities;
  final Function(int) onInit;

  _ViewModel({@required this.isLoading, @required this.taskEntities, @required this.onInit});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isLoading: store.state.isLoading,
      taskEntities: store.state.taskState.tasks,
      onInit: (bucketId) => store.dispatch(
        GetTasksByBucketIdAction(bucketId),
      ),
    );
  }
}
