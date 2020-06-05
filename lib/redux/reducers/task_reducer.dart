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

/// タスク操作系 結合
final taskCRUDReducer = combineReducers<List<TaskEntity>>([
  TypedReducer<List<TaskEntity>, SetTaskAction>(_setTaskReducer),
]);


/// タスクセット
List<TaskEntity> _setTaskReducer(List<TaskEntity> state, SetTaskAction action) => action.tasks;
