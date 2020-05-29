import 'package:flutter/material.dart';
import 'package:flutter_task/resources/models/bucket.dart';

class BucketTile extends StatelessWidget {
  final BucketEntity bucket;
  final bool isEditable;
  final ValueChanged<BucketEntity> onTapBucketDelete;
  final ValueChanged<BucketEntity> onTapNext;
  final ValueChanged<BucketEntity> onTapEdit;

  BucketTile({
    @required this.bucket,
    @required this.isEditable,
    @required this.onTapBucketDelete,
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
          Icons.fiber_manual_record,
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
                      onTap: () => onTapBucketDelete(bucket),
                    )
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
