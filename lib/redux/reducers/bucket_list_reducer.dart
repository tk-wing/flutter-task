import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/redux/actions/bucket_list_actions.dart';
import 'package:flutter_task/redux/states/bucket_list_state.dart';
import 'package:redux/redux.dart';

// BUcket State & Reducers

BucketListState bocketListReducer(BucketListState state, dynamic action) {
  return BucketListState(
    buckets: bucketsReducer(state.buckets, action),
    isEditable: bucketEditReducer(state.isEditable, action),
    isCreatable: bucketCreatableReducer(state.isCreatable, action),
    isDeletable: bucketDeletableReducer(state.isDeletable, action)
  );
}

// バケット編集 結合
final bucketEditReducer = combineReducers<bool>([
  TypedReducer<bool, BucketEditAction>(_bucketEditReducer),
]);

bool _bucketEditReducer(bool state, BucketEditAction action) => action.isEditable;

// バケット作成判定 結合
final bucketCreatableReducer = combineReducers<bool>([
  TypedReducer<bool, BucketCreatableAction>(_bucketCreatableReducer),
]);

bool _bucketCreatableReducer(bool state, BucketCreatableAction action) => action.isCreatable;

// バケット削除判定 結合
final bucketDeletableReducer = combineReducers<bool>([
  TypedReducer<bool, BucketDeletableAction>(_bucketDeletableReducer),
]);

bool _bucketDeletableReducer(bool state, BucketDeletableAction action) => action.isDeletable;


// バケットリスト操作系 結合
final bucketsReducer = combineReducers<List<BucketEntity>>([
  TypedReducer<List<BucketEntity>, BucketCreateAction>(_bucketCreateReducer),
  TypedReducer<List<BucketEntity>, BucketUpdateAction>(_bucketUpdateReducer),
  TypedReducer<List<BucketEntity>, BucketDeleteAction>(_bucketDeleteReducer),
]);

List<BucketEntity> _bucketCreateReducer(
    List<BucketEntity> state, BucketCreateAction action) {
    return List.from(state)..add(action.bucket);
}

List<BucketEntity> _bucketUpdateReducer(List<BucketEntity> state, BucketUpdateAction action) {
  return state.map((bucket) => bucket.id == action.bucket.id ? action.bucket : bucket).toList();
}

List<BucketEntity> _bucketDeleteReducer(List<BucketEntity> state, BucketDeleteAction action) {
  return List.from(state)..remove(action.bucket);
}

