import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/models/task/task.dart';
import 'package:flutter_task/redux/actions/task.action.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/components/filter_task_list.dart';
import 'package:redux/redux.dart';

class FilterTaskListContainer extends StatelessWidget {
  final DefaultFilter defaultFilter;
  final Future<void> Function(BuildContext, TaskEntity) toTaskEditScreen;

  const FilterTaskListContainer({@required this.defaultFilter, @required this.toTaskEditScreen});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, viewModel) => FilterTaskList(
        taskEntities: viewModel.taskEntities,
        onInit: () => viewModel.onInit(defaultFilter.filterType),
        onPressedUpdate: viewModel.onPressedUpdate,
        onPressedDelete: viewModel.onPressedDelete,
        toTaskEditScreen: toTaskEditScreen,
      ),
    );
  }
}

class _ViewModel {
  final List<TaskEntity> taskEntities;
  final Function(FilterType) onInit;
  final Function(TaskEntity) onPressedUpdate;
  final Function(TaskEntity) onPressedDelete;

  _ViewModel({
    @required this.taskEntities,
    @required this.onInit,
    @required this.onPressedUpdate,
    @required this.onPressedDelete,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        taskEntities: store.state.taskState.tasks,
        onInit: (filterType) => store.dispatch(GetTasksByDefaultFilterAction(filterType)),
        onPressedUpdate: (taskEntity) {
          store.dispatch(UpdateTaskAction(taskEntity));
        },
        onPressedDelete: (taskEntity) {
          store.dispatch(DeleteTaskAction(taskEntity));
        }
        );
  }
}
