import 'package:flutter/material.dart';


class MyListModel {
  String name;
  int iconColor = Colors.orange.value;

  MyListModel({@required this.name, this.iconColor});
}

class MyListEntity implements MyListModel{
  int _id;
  int get id => _id;

  String name;
  int iconColor;

  MyListEntity(MyListModel model):
    this.name = model.name,
    this.iconColor = model.iconColor;


}


