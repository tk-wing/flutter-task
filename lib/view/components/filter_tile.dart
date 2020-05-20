import 'package:flutter/material.dart';
import 'package:flutter_task/data/default_filter.dart';

class FilterTile extends StatelessWidget {
  final Filter filter;
  final ValueChanged<Filter> onTapNext;

  FilterTile({@required this.filter, @required this.onTapNext});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: () => print('hogehoge'),
      leading: filter.icon,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(filter.name),
            Text(
              filter.count.toString(),
            )
          ]),
      trailing: GestureDetector(child: Icon(Icons.navigate_next), onTap: () => onTapNext(filter)),
    );
  }
}
