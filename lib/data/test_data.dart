import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/task/task.dart';

final List<BucketEntity> testBucketEntities = [
  BucketEntity.convertor(id: 1, name: 'マイタスク', iconColor: 0xFFFF9800),
  BucketEntity.convertor(id: 2, name: 'サンプル', iconColor: 0xFFFF9800),
];


final doneDate = DateTime.now().subtract(const Duration(days: 1));
final expiredDate = DateTime.now().add(const Duration(days: 1));


final List<TaskEntity> testTaskEntities = [
  TaskEntity.converter(id: 1, bucketId: 1, title: 'マイタスク1', description: 'This is my task1'),
  TaskEntity.converter(id: 2, bucketId: 1, title: 'マイタスク2', expiredAt: DateTime.now().add(const Duration(days: 3))),
  TaskEntity.converter(id: 3, bucketId: 1, title: 'マイタスク3', expiredAt: DateTime.now()),
  TaskEntity.converter(id: 4, bucketId: 1, title: 'マイタスク4'),
  TaskEntity.converter(id: 5, bucketId: 1, title: 'マイタスク5', doneAt: doneDate),
  TaskEntity.converter(id: 6, bucketId: 2, title: 'サンプルタスク1',description: 'フリーは目的文で対話する文献ますで以下、引用含むれフェアを例証権可能の引用趣旨でするられては下げある、ライセンスの文は、引用し目的を侵害考えことによって引用自由あるなていますあり。'),
  TaskEntity.converter(id: 7, bucketId: 2, title: 'サンプルタスク2', expiredAt: DateTime.now().add(const Duration(days: 8))),
  TaskEntity.converter(id: 8, bucketId: 2, title: 'サンプルタスク3', expiredAt: DateTime.now()),
  TaskEntity.converter(id: 9, bucketId: 2, title: 'サンプルタスク4'),
  TaskEntity.converter(id: 10, bucketId: 2, title: 'サンプルタスク5', doneAt: doneDate),
];
