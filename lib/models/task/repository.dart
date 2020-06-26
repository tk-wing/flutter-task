
import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/models/task/task.dart';

abstract class ITaskRepository {
  Future<List<TaskEntity>> getAllTask();

  Future<List<TaskEntity>> getTasksByBucketId(int bucketId);

  Future<List<TaskEntity>> getTaskByDefaultFilter(FilterType filterType);

  Future<int> countTaskByDefaultFilter(FilterType filterType);

  Future<TaskEntity> createTask(TaskModel taskModel);

  Future<bool> updateTask(TaskEntity taskEntity);

  Future<bool> deleteTask(int id);

  Future<bool> deleteTasksByBucketId(int bucketId);

  Future<bool> multiDeleteTask(List<int> ids);
}
