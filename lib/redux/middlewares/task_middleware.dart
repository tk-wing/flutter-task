import 'package:flutter_task/redux/actions/bucket_actions.dart';
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
    TypedMiddleware<AppState, GetTasksByDefaultFilterAction>(_getTasksByDefaultFilter(taskRepository)),
    TypedMiddleware<AppState, CreateTaskAction>(_createTask(taskRepository)),
    TypedMiddleware<AppState, UpdateTaskAction>(_updateTask(taskRepository)),
    TypedMiddleware<AppState, DeleteTaskAction>(_deleteTask(taskRepository)),
    TypedMiddleware<AppState, DeleteTasksActionByBucketId>(_deleteTasksByBucketId(taskRepository)),
  ];
}

Middleware<AppState> _getAllTask(TaskRepository taskRepository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    final taskEntities = await taskRepository.getAllTask();

    store.dispatch(SetTaskAction(taskEntities));
  };
}

void Function(Store<AppState> store, GetTasksByBucketIdAction action, NextDispatcher next) _getTasksByBucketId(
    TaskRepository taskRepository) {
  return (store, action, next) async {
    next(action);

    final taskEntities = await taskRepository.getTasksByBucketId(action.id);

    store.dispatch(SetTaskAction(taskEntities));
  };
}


void Function(Store<AppState> store, GetTasksByDefaultFilterAction action, NextDispatcher next)
    _getTasksByDefaultFilter(TaskRepository taskRepository) {
  return (store, action, next) async {
    next(action);

    final taskEntities = await taskRepository.getTaskByDefaultFilter(action.filterType);


    store.dispatch(SetTaskAction(taskEntities));
  };
}

void Function(Store<AppState> store, CreateTaskAction action, NextDispatcher next) _createTask(
    TaskRepository taskRepository) {
  return (store, action, next) async {
    next(action);

    final taskEntity = await taskRepository.createTask(action.taskModel);

    if(action.isAdd) {
      store.dispatch(AddTaskAction(taskEntity));
    }

    store.dispatch(GetFilteredBucketAction());
    store.dispatch(GetAllBucketAction());
  };
}

void Function(Store<AppState> store, UpdateTaskAction action, NextDispatcher next) _updateTask(
    TaskRepository taskRepository) {
  return (store, action, next) async {

    await taskRepository.updateTask(action.taskEntity);

    next(action);
    store.dispatch(GetFilteredBucketAction());
  };
}

void Function(Store<AppState> store, DeleteTaskAction action, NextDispatcher next) _deleteTask(
    TaskRepository taskRepository) {
  return (store, action, next) async {
    next(action);

    await taskRepository.deleteTask(action.taskEntity.id);

    store.dispatch(GetFilteredBucketAction());
    store.dispatch(GetAllBucketAction());
  };
}

void Function(Store<AppState> store, DeleteTasksActionByBucketId action, NextDispatcher next) _deleteTasksByBucketId(
    TaskRepository taskRepository) {
  return (store, action, next) async {
    next(action);

    await taskRepository.deleteTasksByBucketId(action.bucketId);

    store.dispatch(GetFilteredBucketAction());
  };
}
