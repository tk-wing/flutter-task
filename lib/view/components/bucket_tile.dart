import 'package:flutter/material.dart';
import 'package:flutter_task/resources/models/bucket.dart';

class BucketTile extends StatelessWidget {
  final Bucket bucket;
  final bool isEditable;
  final ValueChanged<Bucket> onTapNext;
  final ValueChanged<Bucket> onTapEdit;

  BucketTile({
    @required this.bucket,
    @required this.isEditable,
    @required this.onTapEdit,
    @required this.onTapNext,
  });

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
        enabled: true,
        dense: true,
        onTap: isEditable ? () => onTapEdit(bucket) : () => onTapNext(bucket),
        leading: Icon(
          bucket.icon,
          color: Color(bucket.iconColor),
        ),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(bucket.name),
              isEditable
                  ? GestureDetector(
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onTap: () => print('delete'))
                  : Text(bucket.count.toString()),
            ]),
        trailing: isEditable
            ? GestureDetector(
                child: Icon(Icons.menu), onTap: () => print('humbger'))
            : Icon(Icons.navigate_next),
      ),
    );
  }
}
