import 'package:flutter_task/redux/actions/bucket_actions.dart';
import 'package:flutter_task/redux/actions/task.action.dart';
import 'package:flutter_task/redux/reducers/bucket_reducer.dart';
import 'package:flutter_task/redux/reducers/task_reducer.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:redux/redux.dart';

import 'helper_reducer.dart';

// Root State

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    isLoading: loadReducer(state.isLoading, action),
    bucketState: bocketReducer(state.bucketState, action),
    taskState: taskReducer(state.taskState, action),
  );
}

final loadReducer = combineReducers<bool>([
  TypedReducer<bool, GetAllBucketAction>(setLoading),
  TypedReducer<bool, SetBucketAction>(setLoaded),
  TypedReducer<bool, GetAllTasks>(setLoading),
  TypedReducer<bool, GetTasksByDefaultFilterAction>(setLoading),
  TypedReducer<bool, GetTasksByBucketIdAction>(setLoading),
  TypedReducer<bool, SetTaskAction>(setLoaded),
]);
