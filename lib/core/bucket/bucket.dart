import 'package:flutter/material.dart';
import 'package:flutter_task/core/base/base_entity.dart';

class BucketModel {
  String name;
  int iconColor;

  BucketModel({@required this.name, this.iconColor});
}

class MyListEntity extends BaseEntity implements BucketModel {
  String name;
  int iconColor;

  MyListEntity(BucketModel model):
    this.name = model.name,
    this.iconColor = model.iconColor;
}


