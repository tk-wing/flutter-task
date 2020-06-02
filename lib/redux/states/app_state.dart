import 'package:flutter/material.dart';
import 'package:flutter_task/redux/states/bucket_list_state.dart';

@immutable
class AppState {
  final BucketListState _bucketListState;
  BucketListState get bucketListState => _bucketListState;

  const AppState({BucketListState bucketListState}):
    this._bucketListState = bucketListState;

  AppState.initState():
    this._bucketListState = BucketListState.initState();
}

