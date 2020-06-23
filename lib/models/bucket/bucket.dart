import 'package:flutter/material.dart';
import 'package:flutter_task/models/entity.dart';

class BucketModel {
  String name;
  int iconColor;

  BucketModel({@required this.name, this.iconColor});
}
class BucketEntity extends BaseEntity<BucketEntity> implements BucketModel {
  @override
  String name;
  @override
  int iconColor;

  int count;

  BucketEntity({@required int id, @required this.name, this.iconColor = 0xFFFF9800, this.count = 0}) : super(id: id);

  BucketEntity.convertor({
    @required int id,
    @required this.name,
    @required this.iconColor
  }): super(id: id);

  @override
  BucketEntity clone() {
    return BucketEntity(
      id: this.id,
      name: this.name,
      iconColor: this.iconColor,
      count: this.count
    );
  }
}
