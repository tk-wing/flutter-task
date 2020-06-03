
import 'package:flutter_task/models/bucket/bucket.dart';

abstract class IBucketRepository {
  Future<List<BucketEntity>> getAllBucket();
}

