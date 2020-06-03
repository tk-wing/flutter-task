
import 'package:flutter_task/models/task/task.dart';

abstract class ITaskRepository {
  Future<List<TaskEntity>> getAllTask();

  Future<List<TaskEntity>> getTasksByBucketId(int bucketId);
}
