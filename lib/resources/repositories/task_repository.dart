
import 'package:flutter_task/data/test_data.dart';
import 'package:flutter_task/models/task/repository.dart';
import 'package:flutter_task/models/task/task.dart';

class TaskRepository implements ITaskRepository {

  @override
  Future<List<TaskEntity>> getAllTask() async{
    return testTaskEntities;
  }

  @override
  Future<List<TaskEntity>> getTasksByBucketId(int bucketId) async{
    return testTaskEntities.where((taskEntity) => taskEntity.bucketId == bucketId).toList();
  }
}
