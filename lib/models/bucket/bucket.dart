import 'package:flutter/material.dart';
import 'package:flutter_task/models/entity.dart';

class BucketModel {
  String name;
  int iconColor;

  BucketModel({@required this.name, this.iconColor});
}
class BucketEntity extends BaseEntity implements BucketModel {
  @override
  String name;
  @override
  int iconColor;

  int count = 0;

  BucketEntity({@required this.name, this.iconColor = 0xFFFF9800});

  BucketEntity.convertor({
    @required int id,
    @required this.name,
    @required this.iconColor
  }): super(id: id);
}
