import 'package:flutter/material.dart';
import 'package:flutter_task/core/bucket/bucket.dart';

class Bucket implements BucketModel {
  IconData icon;
  String name;
  int iconColor;
  int count = 0;

  Bucket({@required this.name, this.icon = Icons.fiber_manual_record, this.iconColor = 0xFFFF9800});
}
