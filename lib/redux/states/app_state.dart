import 'package:flutter/material.dart';
import 'package:flutter_task/redux/states/bucket_state.dart';
import 'package:flutter_task/redux/states/task_state.dart';

@immutable
class AppState {
  final bool _isLoading;
  bool get isLoading => _isLoading;

  final BucketState _bucketState;
  BucketState get bucketState => _bucketState;

  final TaskState _taskState;
  TaskState get taskState => _taskState;

  const AppState({bool isLoading, BucketState bucketState, TaskState taskState}):
    this._isLoading = isLoading,
    this._bucketState = bucketState,
    this._taskState = taskState;


  AppState.initState():
    this._isLoading = true,
    this._bucketState = BucketState.initState(),
    this._taskState = TaskState.initState();
}

