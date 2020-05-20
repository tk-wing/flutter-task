import 'package:flutter/material.dart';

class ListViewModel extends ChangeNotifier {
  bool _isEditable = false;
  bool get isEditable => _isEditable;

  void onTapListEdit() {
    _isEditable = _isEditable != true;
    notifyListeners();
  }
}
