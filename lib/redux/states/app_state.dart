import 'package:flutter/material.dart';
import 'package:flutter_task/redux/states/bucket_state.dart';
import 'package:flutter_task/redux/states/task_state.dart';

@immutable
class AppState {
  final BucketState _bucketListState;
  BucketState get bucketListState => _bucketListState;

  final TaskState _taskState;
  TaskState get taskState => _taskState;

  const AppState({BucketState bucketListState, TaskState taskState}):
    this._bucketListState = bucketListState,
    this._taskState = taskState;


  AppState.initState():
    this._bucketListState = BucketState.initState(),
    this._taskState = TaskState.initState();
}

