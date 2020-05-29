import 'package:flutter/material.dart';
import 'package:flutter_task/resources/models/bucket.dart';
import 'package:flutter_task/resources/repository/bucket_repository.dart';

class ListViewModel extends ChangeNotifier {
  final BucketRepository _bucketRepository;

  ListViewModel({bucketRepository}) : this._bucketRepository = bucketRepository;

  List<BucketEntity> _buckets = List<BucketEntity>();
  List<BucketEntity> get buckets => _buckets;

  bool _isEditable = false;
  bool get isEditable => _isEditable;

  bool _isAddBucket = false;
  bool get isAddBucket => _isAddBucket;

  bool _isDeletable = false;
  bool get isDeleteable => _isDeletable;

  void onTapBucketEdit() {
    if (_buckets.length < 3) {
      _isAddBucket = true;
    }

    _checkDeletable();

    _isEditable = _isEditable != true;

    notifyListeners();
  }

  void _checkDeletable() => _isDeletable = _buckets.length > 1 ? true : false;

  Future<void> getBuckets() async {
    await _bucketRepository.getBuckets();
  }

  Future<void> createBucket(BucketModel bucketModel) async {
    await _bucketRepository.createBucket(bucketModel);
    _isEditable = false;
  }

  Future<void> updateBucket(BucketEntity bucketEntity) async {
    await _bucketRepository.updateBucket(bucketEntity);
    _isEditable = false;
  }

  Future<void> deleteBucket(BucketEntity bucketEntity) async {
    final result = await _bucketRepository.deleteBucket(bucketEntity);
    if (result == 0) {
      throw new Exception('Failed delete bucket');
    }
  }

  void onRepositoryUpdate(BucketRepository repository) {
    _buckets = repository.buckets;

    _checkDeletable();

    notifyListeners();
  }
}
