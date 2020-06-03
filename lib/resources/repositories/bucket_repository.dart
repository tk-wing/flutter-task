import 'package:flutter_task/data/test_data.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/bucket/repository.dart';

class BucketRepository implements IBucketRepository {
  @override
  Future<List<BucketEntity>> getAllBucket() async {
    return testBucketEntities;
  }
}
