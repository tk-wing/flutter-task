import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/redux/actions/bucket_actions.dart';
import 'package:flutter_task/redux/reducers/helper_reducer.dart';
import 'package:flutter_task/redux/states/bucket_state.dart';
import 'package:redux/redux.dart';


BucketState bocketReducer(BucketState state, dynamic action) {
  return BucketState(
    buckets: bucketsReducer(state.buckets, action),
    isEditable: bucketEditReducer(state.isEditable, action),
    isCreatable: bucketCreatableReducer(state.isCreatable, action),
    isDeletable: bucketDeletableReducer(state.isDeletable, action)
  );
}

// バケットリスト操作系 結合
final bucketsReducer = combineReducers<List<BucketEntity>>([
  TypedReducer<List<BucketEntity>, SetBucketAction>(_bucketSetReducer),
  TypedReducer<List<BucketEntity>, AddBucketAction>(_bucketCreateReducer),
  TypedReducer<List<BucketEntity>, UpdateBucketAction>(_bucketUpdateReducer),
  TypedReducer<List<BucketEntity>, DeleteBucketAction>(_bucketDeleteReducer),
]);

List<BucketEntity> _bucketSetReducer(
    List<BucketEntity> state, SetBucketAction action) => action.bucketEntites;

List<BucketEntity> _bucketCreateReducer(
    List<BucketEntity> state, AddBucketAction action) {
    return List.from(state)..add(action.bucketEntity);
}

List<BucketEntity> _bucketUpdateReducer(List<BucketEntity> state, UpdateBucketAction action) {
  return state.map((bucketEntity) => bucketEntity.id == action.bucketEntity.id ? action.bucketEntity : bucketEntity).toList();
}

List<BucketEntity> _bucketDeleteReducer(List<BucketEntity> state, DeleteBucketAction action) {
  return List.from(state)..remove(action.bucketEntity);
}


// バケット編集 結合
final bucketEditReducer = combineReducers<bool>([
  TypedReducer<bool, EditableAction>(setAble),
  TypedReducer<bool, UneditableAction>(setUnable),
  TypedReducer<bool, CreateBucketAction>(setUnable),
  TypedReducer<bool, UpdateBucketAction>(setUnable),
]);

// バケット作成判定 結合
final bucketCreatableReducer = combineReducers<bool>([
  TypedReducer<bool, CreatablenAction>(setAble),
  TypedReducer<bool, UnCreatableAction>(setUnable),
]);


// バケット削除判定 結合
final bucketDeletableReducer = combineReducers<bool>([
  TypedReducer<bool, DeletableAction>(setAble),
  TypedReducer<bool, UndeletableAction>(setUnable),
]);
