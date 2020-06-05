import 'package:flutter_task/redux/actions/bucket_actions.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/resources/repositories/bucket_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createBucketStoreMiddleware(
  BucketRepository bucketRepository,
) {
  return [
    TypedMiddleware<AppState, GetAllBucketAction>(_getAllBucket(bucketRepository)),
    TypedMiddleware<AppState, CreateBucketAction>(_createBucket(bucketRepository)),
    TypedMiddleware<AppState, UpdateBucketAction>(_updateBucket(bucketRepository)),
    TypedMiddleware<AppState, DeleteBucketAction>(_deleteBucket(bucketRepository)),
  ];
}

Middleware<AppState> _getAllBucket(BucketRepository bucketRepository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);

    final bucketEntities = await bucketRepository.getAllBucket();

    store.dispatch(SetBucketAction(bucketEntities));
  };
}

void Function(Store<AppState> store, CreateBucketAction action,
    NextDispatcher next) _createBucket(BucketRepository bucketRepository) {
  return (store, action, next) async {
    next(action);

    final bucketEntity = await bucketRepository.createBucket(action.bucketModel);

    store.dispatch(AddBucketAction(bucketEntity));
  };
}

void Function(Store<AppState> store, UpdateBucketAction action,
    NextDispatcher next) _updateBucket(BucketRepository bucketRepository) {
  return (store, action, next) async {
    await bucketRepository.updateBucket(action.bucketEntity);

    next(action);
  };
}

void Function(Store<AppState> store, DeleteBucketAction action,
    NextDispatcher next) _deleteBucket(BucketRepository bucketRepository) {
  return (store, action, next) async {
    await bucketRepository.deleteBucket(action.bucketEntity.id);

    next(action);
  };
}

