import 'package:flutter_task/database/bucket/bucket.dart';
import 'package:flutter_task/database/database.dart';
import 'package:moor/moor.dart';

part 'bucket.dao.g.dart';

@UseDao(tables: [BucketRecords])
class BucketDao extends DatabaseAccessor<MyDataBase> with _$BucketDaoMixin {
  BucketDao(MyDataBase db) : super(db);

  Future<int> createBucket(BucketRecordsCompanion entry) => into(bucketRecords).insert(entry);

  Future updateBucket(BucketRecord bucketRecord) => update(bucketRecords).replace(bucketRecord);

  Future<int> deleteBucket(BucketRecord bucketRecord) => (delete(bucketRecords)..where((table) => table.id.equals(bucketRecord.id))).go();

  Future<List<BucketRecord>> get getBuckets => select(bucketRecords).get();

}
