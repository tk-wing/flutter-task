import 'package:flutter/material.dart';

abstract class BaseTaskList {
  String name = '';
  int count = 0;
  BaseTaskList({this.name, this.count});
}
