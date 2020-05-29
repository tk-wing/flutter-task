import 'package:flutter/material.dart';
import 'package:flutter_task/resources/models/bucket.dart';

class DefualtFilter implements BucketEntity {
  IconData icon;

  @override
  int id;

  @override
  String name;

  @override
  int iconColor;

  @override
  int count = 0;

  DefualtFilter({@required this.name, @required this.icon, this.iconColor});
}

List<DefualtFilter> defaultFilter = [
  DefualtFilter(icon: Icons.today, name: '今日'),
  DefualtFilter(icon: Icons.date_range, name: '近日中'),
  DefualtFilter(icon: Icons.event_busy, name: '期限なし'),
  DefualtFilter(icon: Icons.inbox, name: 'すべて'),
  DefualtFilter(icon: Icons.assignment_turned_in, name: '完了したタスク'),
];
