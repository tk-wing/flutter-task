import 'package:flutter/material.dart';
import 'package:flutter_task/data/default_filter.dart';

class FilterTile extends StatelessWidget {
  final DefualtFilter filter;
  final ValueChanged<DefualtFilter> onTapNext;

  FilterTile({@required this.filter, @required this.onTapNext});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[400], width: 0.5),
        ),
      ),
      child: ListTile(
        dense: true,
        onTap: () => onTapNext(filter),
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
