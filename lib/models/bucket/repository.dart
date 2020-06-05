
import 'package:flutter_task/models/bucket/bucket.dart';

abstract class IBucketRepository {
  Future<List<BucketEntity>> getAllBucket();
  Future<BucketEntity> createBucket(BucketModel bucketModel);
  Future<BucketEntity> updateBucket(BucketEntity bucketEntity);
  Future<void> deleteBucket(int id);
}

