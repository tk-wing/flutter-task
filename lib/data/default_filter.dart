import 'package:flutter/material.dart';

enum FilterType {
  Today,
  UpComing,
  NoExpiration,
  All,
  Done,
}

class DefaultFilter {
  final String _name;
  String get name => _name;

  final IconData _icon;
  IconData get icon => _icon;

  final FilterType _filterType;
  FilterType get filterType => _filterType;

  int count = 0;

  DefaultFilter({@required String name, @required IconData icon, @required FilterType filterType}):
  this._name = name,
  this._icon = icon,
  this._filterType = filterType;
}

List<DefaultFilter> defaultFilterBuckets = [
  DefaultFilter(name: '今日', icon: Icons.today,  filterType: FilterType.Today),
  DefaultFilter(name: '近日中', icon: Icons.date_range, filterType: FilterType.UpComing),
  DefaultFilter(name: '期限なし', icon: Icons.event_busy, filterType: FilterType.NoExpiration),
  DefaultFilter(name: 'すべて', icon: Icons.inbox, filterType: FilterType.All),
  DefaultFilter(name: '完了したタスク', icon: Icons.assignment_turned_in, filterType: FilterType.Done),
];
