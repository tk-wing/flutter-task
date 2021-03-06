import 'package:flutter_task/data/test_data.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/bucket/repository.dart';

class BucketRepository implements IBucketRepository {
  @override
  Future<List<BucketEntity>> getAllBucket() async {
    testBucketEntities.forEach((testBucketEntity) {
      final taskCount = testTaskEntities
          .where((testTaskEntity) =>
              testTaskEntity.bucketId == testBucketEntity.id)
          .toList()
          .length;
      testBucketEntity.count = taskCount;
    });

    return testBucketEntities;
  }

  @override
  Future<BucketEntity> createBucket(BucketModel bucketModel) async {
    final bucketEntity = BucketEntity(
        id: DateTime.now().millisecondsSinceEpoch,
        name: bucketModel.name,
        iconColor: bucketModel.iconColor);

        testBucketEntities.add(bucketEntity);

        return bucketEntity;
  }

  @override
  Future<void> deleteBucket(int id) async {
    testBucketEntities.removeWhere((bucketEntity) => bucketEntity.id == id);
  }

  @override
  Future<BucketEntity> updateBucket(BucketEntity bucketEntity) async {
    final index = testBucketEntities.indexOf(bucketEntity);

    final currentEntity = testBucketEntities[index];
    currentEntity.name = bucketEntity.name;
    currentEntity.iconColor = bucketEntity.iconColor;

    testBucketEntities[index] = currentEntity;
    return currentEntity;
  }
}
