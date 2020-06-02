import 'package:flutter/material.dart';
import 'package:flutter_task/models/bucket/bucket.dart';

class BucketList extends StatelessWidget {
  final GlobalKey<AnimatedListState> animatedListKey;
  final List<BucketEntity> bucketEntitles;
  final bool isEditable;
  final bool isDeletable;
  final ValueChanged<BucketEntity> toBucketEditScreen;
  final ValueChanged<BucketEntity> onTapBucketDelete;

  const BucketList({
    @required this.animatedListKey,
    @required this.bucketEntitles,
    @required this.isEditable,
    @required this.isDeletable,
    @required this.toBucketEditScreen,
    @required this.onTapBucketDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: animatedListKey,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      initialItemCount: bucketEntitles.length,
      itemBuilder: (context, index, animation) {
        return _buildItem(context, bucketEntitles[index], animation);
      },
    );
  }

  Widget _buildItem(BuildContext context, BucketEntity bucketEntity,
      Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Colors.grey[400], width: 0.5),
          ),
        ),
        child: ListTile(
          enabled: true,
          dense: true,
          // TODO 編集画面orリスト一覧画面へ遷移
          onTap: () => isEditable ? toBucketEditScreen(bucketEntity) : null,
          leading: Icon(
            Icons.fiber_manual_record,
            color: Color(bucketEntity.iconColor),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(bucketEntity.name),
              if (isEditable)
                GestureDetector(
                    child: Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                    ),
                    onTap: () {
                      if (isDeletable) {
                        onTapBucketDelete(bucketEntity);
                        final int removeIndex =
                            bucketEntitles.indexOf(bucketEntity);
                        animatedListKey.currentState.removeItem(
                          removeIndex,
                          (context, animation) =>
                              _buildItem(context, bucketEntity, animation),
                        );
                      } else {
                        _showUnableDeleteBucketAlert(context);
                      }
                    })
              else
                Text(
                  bucketEntity.count.toString(),
                ),
            ],
          ),
          trailing: isEditable
              ? GestureDetector(
                  child: Icon(Icons.menu),
                  //TODO 並び替え
                  onTap: () => print('humbger'),
                )
              : Icon(Icons.navigate_next),
        ),
      ),
    );
  }

  Future<void> _showUnableDeleteBucketAlert(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('リスト削除'),
        content: const Text('リストは最低１つ必要です。'),
        actions: <Widget>[
          FlatButton(
            child: const Text('とじる'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
