import 'package:flutter/material.dart';
import 'package:flutter_task/database/bucket/bucket.dao.dart';
import 'package:flutter_task/database/database.dart';
import 'package:flutter_task/resources/models/bucket.dart';
import 'package:moor/moor.dart';

class BucketRepository extends ChangeNotifier {
  final BucketDao _dao;

  BucketRepository({dao}) : this._dao = dao;

  List<BucketEntity> _buckets = List();
  List<BucketEntity> get buckets => _buckets;

  Future<void> getBuckets() async {
    try {
      final bucketRecords = await _dao.getBuckets;
      _buckets = _toBucketEntities(bucketRecords);
    } on Exception catch (error) {
      print("error: ${error}");
    } finally {
      notifyListeners();
    }
  }

  Future<int> createBucket(BucketModel bucketModel) async {
    final entry = BucketRecordsCompanion(
      name: Value(bucketModel.name),
      iconColor: Value(bucketModel.iconColor.toString()),
    );
    return await _dao.createBucket(entry);
  }

  Future<void> updateBucket(BucketEntity bucketEntity) async {
    final bucketRecord = _toBucketRecord(bucketEntity);
    await _dao.updateBucket(bucketRecord);
    notifyListeners();
  }

  Future<int> deleteBucket(BucketEntity bucketEntity) async {
    final bucketRecord = _toBucketRecord(bucketEntity);
    return await _dao.deleteBucket(bucketRecord);
  }

  List<BucketEntity> _toBucketEntities(List<BucketRecord> bucketRecords) {
    var bucketEntities = List<BucketEntity>();

    bucketRecords.forEach((bucketRecord) {
      bucketEntities.add(BucketEntity(
        id: bucketRecord.id,
        name: bucketRecord.name,
        iconColor: int.parse(bucketRecord.iconColor),
      ));
    });

    return bucketEntities;
  }

  BucketRecord _toBucketRecord(BucketEntity bucketEntity) {
      return BucketRecord(
      id: bucketEntity.id,
      name: bucketEntity.name,
      iconColor: bucketEntity.iconColor.toString(),
    );
  }
}
