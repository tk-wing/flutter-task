import 'package:flutter/material.dart';
import 'package:flutter_task/resources/models/bucket.dart';

class ListViewModel extends ChangeNotifier {
  List<Bucket> _buckets = [
    Bucket(iconColor: 0xFFF44335, name: 'マイタスク'),
    Bucket(iconColor: 0xFF2196F3, name: '仕事'),
    Bucket(iconColor: 0xFF4CAF50, name: '家'),
  ];
  List<Bucket> get buckets => _buckets;

  bool _isEditable = false;
  bool get isEditable => _isEditable;

  void onTapListEdit() {
    _isEditable = _isEditable != true;
    notifyListeners();
  }
}
