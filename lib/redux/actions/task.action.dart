
// タスク操作に関するアクション

import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/task/task.dart';

/// タスクのセット
class SetTaskAction {
  final List<TaskEntity> tasks;

  SetTaskAction(this.tasks);
}

///
class SetBucketEntity {
  final BucketEntity bucketEntity;

  SetBucketEntity(this.bucketEntity);
}

///
class SetFilterBucketEntity {
  final DefaultFilter filterBucket;

  SetFilterBucketEntity(this.filterBucket);
}

/// 全タスクの取得
class GetAllTasks {}

/// バケット内のタスク取得
class GetTasksByBucketIdAction {
  final int id;

  GetTasksByBucketIdAction(this.id);
}

/// DefaultFilterのタスク取得
class GetTasksByDefaultFilterAction {
  final FilterType filterType;

  GetTasksByDefaultFilterAction(this.filterType);
}

/// タスク追加
class AddTaskAction {
  final TaskEntity taskEntity;

  AddTaskAction(this.taskEntity);
}

/// タスク作成
class CreateTaskAction {
  final bool isAdd;
  final TaskModel taskModel;

  CreateTaskAction({
    this.isAdd = false,
    this.taskModel,
    });
}

/// タスク更新
class UpdateTaskAction {
  final TaskEntity taskEntity;

  UpdateTaskAction(this.taskEntity);

}

/// バケットIDにてタスク削除
class DeleteTasksActionByBucketId {
  final int bucketId;

  DeleteTasksActionByBucketId(this.bucketId);
}
