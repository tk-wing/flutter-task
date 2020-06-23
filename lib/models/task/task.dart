import 'package:flutter/material.dart';
import 'package:flutter_task/models/entity.dart';

enum TaskStatus {
  OPEN,
  DONE,
}

class TaskModel {
  int bucketId;
  String title;
  String description;
  TaskStatus status;
  DateTime expiredAt;
  DateTime doneAt;

  TaskModel(
      {@required this.bucketId,
      @required this.title,
      this.description,
      this.expiredAt})
      : status = TaskStatus.OPEN;
}

class TaskEntity extends BaseEntity<TaskEntity> implements TaskModel {
  @override
  int bucketId;

  @override
  String title;

  @override
  String description;

  @override
  TaskStatus status;

  @override
  DateTime expiredAt;

  @override
  DateTime doneAt;

  TaskEntity({
    @required int id,
    @required this.bucketId,
    @required this.title,
    this.description,
    this.expiredAt,
    this.doneAt,
  }) : super(id: id);

  TaskEntity.converter({
    @required int id,
    @required this.bucketId,
    @required this.title,
    this.description,
    this.expiredAt,
    this.doneAt,
  }) : super(id: id);

  @override
  TaskEntity clone() {
    return TaskEntity(
      id: this.id,
      bucketId: this.bucketId,
      title: this.title,
      description: this.description,
      expiredAt: this.expiredAt,
    );
  }
}
