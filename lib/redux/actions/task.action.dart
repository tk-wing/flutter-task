
// タスク操作に関するアクション

import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/models/task/task.dart';

/// タスクのセット
class SetTaskAction {
  final List<TaskEntity> tasks;

  SetTaskAction(this.tasks);
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

/// タスク削除
class DeleteTasksActionByBucketId {
  final int bucketId;

  DeleteTasksActionByBucketId(this.bucketId);
}
