import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/data/test_data.dart';
import 'package:flutter_task/models/date_format.dart';
import 'package:flutter_task/models/task/repository.dart';
import 'package:flutter_task/models/task/task.dart';
import 'package:intl/intl.dart';

class TaskRepository implements ITaskRepository {
  @override
  Future<List<TaskEntity>> getAllTask() async {
    return testTaskEntities;
  }

  @override
  Future<List<TaskEntity>> getTasksByBucketId(int bucketId) async {
    return testTaskEntities
        .where((taskEntity) => taskEntity.bucketId == bucketId)
        .toList();
  }

  @override
  Future<List<TaskEntity>> getTaskByDefaultFilter(FilterType filterType) async {
    List<TaskEntity> taskEntities;
    final dateFormat = DateFormat(date);
    final today = dateFormat.format(DateTime.now());
    final oneWeekLater = dateFormat.parse(today).add(const Duration(days: 8));
    switch (filterType) {
      case FilterType.Today:
        taskEntities = testTaskEntities
            .where(
              (testTaskEntity) =>
                  testTaskEntity.doneAt == null &&
                  testTaskEntity.expiredAt != null &&
                  dateFormat.format(testTaskEntity.expiredAt) == today,
            )
            .toList();
        break;
      case FilterType.UpComing:
        taskEntities = testTaskEntities
            .where((testTaskEntity) =>
                testTaskEntity.doneAt == null &&
                testTaskEntity.expiredAt != null &&
                dateFormat.format(testTaskEntity.expiredAt) != today &&
                testTaskEntity.expiredAt.isBefore(oneWeekLater))
            .toList();
        break;
      case FilterType.NoExpiration:
        taskEntities = testTaskEntities
            .where((testTaskEntity) =>
                testTaskEntity.doneAt == null &&
                testTaskEntity.expiredAt == null)
            .toList();
        break;
      case FilterType.All:
        taskEntities = testTaskEntities;
        break;
      case FilterType.Done:
        taskEntities = testTaskEntities
            .where((testTaskEntity) => testTaskEntity.doneAt != null)
            .toList();
        break;
    }

    return taskEntities;
  }

  @override
  Future<int> countTaskByDefaultFilter(FilterType filterType) async {
    int numberOfTask = 0;
    final dateFormat = DateFormat(date);
    final today = dateFormat.format(DateTime.now());
    final oneWeekLater = dateFormat.parse(today).add(const Duration(days: 8));
    switch (filterType) {
      case FilterType.Today:
        numberOfTask = testTaskEntities
            .where(
              (testTaskEntity) =>
                  testTaskEntity.doneAt == null &&
                  testTaskEntity.expiredAt != null &&
                  dateFormat.format(testTaskEntity.expiredAt) == today,
            )
            .length;
        break;
      case FilterType.UpComing:
        numberOfTask = testTaskEntities
            .where((testTaskEntity) =>
                testTaskEntity.doneAt == null &&
                testTaskEntity.expiredAt != null &&
                dateFormat.format(testTaskEntity.expiredAt) != today &&
                testTaskEntity.expiredAt.isBefore(oneWeekLater))
            .length;
        break;
      case FilterType.NoExpiration:
        numberOfTask = testTaskEntities
            .where((testTaskEntity) =>
                testTaskEntity.doneAt == null &&
                testTaskEntity.expiredAt == null)
            .length;
        break;
      case FilterType.All:
        numberOfTask = testTaskEntities.length;
        break;
      case FilterType.Done:
        numberOfTask = testTaskEntities
            .where((testTaskEntity) => testTaskEntity.doneAt != null)
            .length;
        break;
    }

    return numberOfTask;
  }

  @override
  Future<TaskEntity> createTask(TaskModel taskModel) async {
    final taksEntity = TaskEntity(
      bucketId: taskModel.bucketId,
      title: taskModel.title,
      description: taskModel.description,
      expiredAt: taskModel.expiredAt,
    );

    testTaskEntities.add(taksEntity);
    return taksEntity;
  }

  @override
  Future<bool> deleteTask(int id) async {
    testTaskEntities.removeWhere((testTaskEntity) => testTaskEntity.id == id);
    return true;
  }

  @override
  Future<bool> deleteTasksByBucketId(int bucketId) async {
    testTaskEntities
        .removeWhere((testTaskEntity) => testTaskEntity.bucketId == bucketId);
        return true;
  }

  @override
  Future<bool> multiDeleteTask(List<int> ids) async {
    ids.forEach((id) {
      testTaskEntities.removeWhere((testTaskEntity) => testTaskEntity.id == id);
    });
    return true;
  }

  @override
  Future<bool> updateTask(TaskEntity taskEntity) async {
    final index = testTaskEntities.indexWhere((testTaskEntity) => testTaskEntity.id == taskEntity.id);

    testTaskEntities[index] = taskEntity;

    return true;
  }
}
