import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/redux/actions/bucket_actions.dart';
import 'package:flutter_task/redux/reducers/helper_reducer.dart';
import 'package:flutter_task/redux/states/bucket_state.dart';
import 'package:redux/redux.dart';


BucketState bocketReducer(BucketState state, dynamic action) {
  return BucketState(
    filteredBuckets: filteredBucketsReducer(state.filteredBuckets, action),
    bucketEntities: bucketsReducer(state.bucketEntities, action),
    isEditable: bucketEditReducer(state.isEditable, action),
    isCreatable: bucketCreatableReducer(state.isCreatable, action),
    isDeletable: bucketDeletableReducer(state.isDeletable, action)
  );
}

// フィルターバケット
final filteredBucketsReducer = combineReducers<List<DefaultFilter>>([
  TypedReducer<List<DefaultFilter>, SetFilteredBucketAction>(_filteredBucketsReducer),
]);

List<DefaultFilter> _filteredBucketsReducer(List<DefaultFilter> state, SetFilteredBucketAction action ) => action.defaultFilteredBuckets;

// バケットリスト操作系
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


// バケット編集
final bucketEditReducer = combineReducers<bool>([
  TypedReducer<bool, EditableAction>(setAble),
  TypedReducer<bool, UneditableAction>(setUnable),
  TypedReducer<bool, CreateBucketAction>(setUnable),
  TypedReducer<bool, UpdateBucketAction>(setUnable),
]);

// バケット作成判定
final bucketCreatableReducer = combineReducers<bool>([
  TypedReducer<bool , CreateAvailabilityAction>(_bucketCreateAvailabilityReducer),
]);

bool _bucketCreateAvailabilityReducer (bool state, CreateAvailabilityAction action) {
  return action.numberOfBucketEntites < 3;
}



// バケット削除判定
final bucketDeletableReducer = combineReducers<bool>([
  TypedReducer<bool, DeleteAvailabilityAction>(_bucketDeleteAvailabilityReducer),
]);

bool _bucketDeleteAvailabilityReducer (bool state, DeleteAvailabilityAction action) {
  return action.numberOfBucketEntites > 1;
}
