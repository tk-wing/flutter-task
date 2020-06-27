import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/task/task.dart';
import 'package:flutter_task/redux/actions/task.action.dart';
import 'package:flutter_task/redux/states/task_state.dart';
import 'package:redux/redux.dart';

// タスク Reducers
TaskState taskReducer(TaskState state, dynamic action) {
  return TaskState(
    tasks: taskCRUDReducer(state.tasks, action),
  );
}

///
final taskBucketEntityReducer = combineReducers<BucketEntity>([
  TypedReducer<BucketEntity, SetBucketEntity>(_setBucketEntityReducer),
]);

BucketEntity _setBucketEntityReducer(BucketEntity state, SetBucketEntity action) => action.bucketEntity;

///
final taskFilterBUcketReducer = combineReducers<DefaultFilter>([
  TypedReducer<DefaultFilter, SetFilterBucketEntity>(_setFilterBucketEntityReducer),
]);

DefaultFilter _setFilterBucketEntityReducer(DefaultFilter state, SetFilterBucketEntity action) => action.filterBucket;

/// タスク操作系 結合
final taskCRUDReducer = combineReducers<List<TaskEntity>>([
  TypedReducer<List<TaskEntity>, SetTaskAction>(_setTaskReducer),
  TypedReducer<List<TaskEntity>, AddTaskAction>(_taskCreateReducer),
  TypedReducer<List<TaskEntity>, UpdateTaskAction>(_taskUpdateReducer),
  TypedReducer<List<TaskEntity>, DeleteTaskAction>(_taskDeleteReducer),
]);

List<TaskEntity> _taskCreateReducer(
    List<TaskEntity> state, AddTaskAction action) {
  return List.from(state)..add(action.taskEntity);
}

List<TaskEntity> _taskUpdateReducer(
    List<TaskEntity> state, UpdateTaskAction action) {
  return state.map((taskEntity) => taskEntity.id == action.taskEntity.id ? action.taskEntity : taskEntity).toList();
}

List<TaskEntity> _taskDeleteReducer(
    List<TaskEntity> state, DeleteTaskAction action) {
      return List.from(state)..remove(action.taskEntity);
}

/// タスクセット
List<TaskEntity> _setTaskReducer(
        List<TaskEntity> state, SetTaskAction action) =>
    action.tasks;
