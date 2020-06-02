import 'package:flutter/material.dart';
import 'package:flutter_task/data/default_filter.dart';

class FilterTile extends StatelessWidget {
  final DefualtFilter filter;

  const FilterTile({@required this.filter});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 38,
      child: ListTile(
        dense: true,
        onTap: () => null,
        leading: Icon(filter.icon),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(filter.name),
              Text(
                filter.count.toString(),
              )
            ]),
        trailing: Icon(Icons.navigate_next),
      ),
    );
  }
}
