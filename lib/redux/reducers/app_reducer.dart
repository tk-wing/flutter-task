import 'package:flutter_task/redux/reducers/bucket_list_reducer.dart';
import 'package:flutter_task/redux/states/app_state.dart';

// Root State

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    bucketListState: bocketListReducer(state.bucketListState, action),
  );
}
