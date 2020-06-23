import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/redux/actions/bucket_actions.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/resources/repositories/bucket_repository.dart';
import 'package:flutter_task/resources/repositories/task_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createBucketStoreMiddleware(
  BucketRepository bucketRepository,
  TaskRepository taskRepository,
) {
  return [
    TypedMiddleware<AppState, GetFilteredBucketAction>(_getFilteredBucket(taskRepository)),
    TypedMiddleware<AppState, GetAllBucketAction>(_getAllBucket(bucketRepository)),
    TypedMiddleware<AppState, CreateBucketAction>(_createBucket(bucketRepository)),
    TypedMiddleware<AppState, DeleteBucketAction>(_deleteBucket(bucketRepository)),
  ];
}

Middleware<AppState> _getFilteredBucket(TaskRepository taskRepository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) {
    next(action);
    defaultFilterBuckets.forEach((defaultFilteredBucket) async {
      final numberOfTask = await taskRepository.countTaskByDefaultFilter(defaultFilteredBucket.filterType);
      defaultFilteredBucket.count = numberOfTask;
    });

    store.dispatch(SetFilteredBucketAction(defaultFilterBuckets));
  };
}

Middleware<AppState> _getAllBucket(BucketRepository bucketRepository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    final bucketEntities = await bucketRepository.getAllBucket();

    store.dispatch(SetBucketAction(bucketEntities));
  };
}

void Function(Store<AppState> store, CreateBucketAction action, NextDispatcher next) _createBucket(
    BucketRepository bucketRepository) {
  return (store, action, next) async {
    next(action);

    final bucketEntity = await bucketRepository.createBucket(action.bucketModel);

    store.dispatch(AddBucketAction(bucketEntity));
  };
}

void Function(Store<AppState> store, DeleteBucketAction action, NextDispatcher next) _deleteBucket(
    BucketRepository bucketRepository) {
  return (store, action, next) async {
    await bucketRepository.deleteBucket(action.bucketEntity.id);

    next(action);
  };
}
