import 'package:flutter_task/redux/actions/task.action.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/resources/repositories/task_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createTaskStoreMiddleware(
  TaskRepository taskRepository,
) {
  return [
    TypedMiddleware<AppState, GetAllTasks>(_getAllTask(taskRepository)),
    TypedMiddleware<AppState, GetTasksByBucketIdAction>(_getTasksByBucketId(taskRepository)),
  ];
}

Middleware<AppState> _getAllTask(TaskRepository taskRepository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    final taskEntities = await taskRepository.getAllTask();

    store.dispatch(SetTaskAction(taskEntities));

  };
}

void Function(Store<AppState> store, GetTasksByBucketIdAction action,
    NextDispatcher next) _getTasksByBucketId(TaskRepository taskRepository) {
  return (store, action, next) async {
    next(action);

    final taskEntities = await taskRepository.getTasksByBucketId(action.id);

    store.dispatch(SetTaskAction(taskEntities));
  };
}
