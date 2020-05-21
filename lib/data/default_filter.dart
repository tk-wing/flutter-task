import 'package:flutter/material.dart';
import 'package:flutter_task/resources/models/bucket.dart';

List<Bucket> defaultFilter = [
  Bucket(icon: Icons.today, name: '今日'),
  Bucket(icon: Icons.date_range, name: '近日中'),
  Bucket(icon: Icons.event_busy, name: '期限なし'),
  Bucket(icon: Icons.inbox, name: 'すべて'),
  Bucket(icon: Icons.assignment_turned_in, name: '完了したタスク'),
];
