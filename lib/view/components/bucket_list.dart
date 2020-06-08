import 'package:flutter/material.dart';
import 'package:flutter_task/containers/app_loading.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/view/styles/style.dart';

class BucketList extends StatefulWidget {
  final GlobalKey<AnimatedListState> animatedListKey;
  final List<BucketEntity> bucketEntities;
  final bool isEditable;
  final bool isDeletable;
  final VoidCallback onInit;
  final Function(BuildContext, BucketEntity) toBucketEditScreen;
  final Function(BuildContext, BucketEntity) toTaskListScreen;
  final ValueChanged<BucketEntity> onTapBucketDelete;

  const BucketList({
    @required this.animatedListKey,
    @required this.bucketEntities,
    @required this.isEditable,
    @required this.isDeletable,
    @required this.onInit,
    @required this.toBucketEditScreen,
    @required this.toTaskListScreen,
    @required this.onTapBucketDelete,
  });

  @override
  _BucketListState createState() => _BucketListState();
}

class _BucketListState extends State<BucketList> {
  GlobalKey<AnimatedListState> get animatedListKey => widget.animatedListKey;
  List<BucketEntity> get bucketEntities => widget.bucketEntities;
  bool get isEditable => widget.isEditable;
  bool get isDeletable => widget.isDeletable;

  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return AppLoading(builder: (context, isLoading) {
      return isLoading
          ? Container()
          : AnimatedList(
              key: widget.animatedListKey,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              initialItemCount: bucketEntities.length,
              itemBuilder: (context, index, animation) {
                return _buildItem(
                    context, index, bucketEntities[index], animation);
              },
            );
    });
  }

  Widget _buildItem(BuildContext context, int currentIndex,
      BucketEntity bucketEntity, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(color: Color(defaultBorderColor), width: 0.5),
          ),
        ),
        child: ListTile(
          dense: true,
          // TODO 編集画面orリスト一覧画面へ遷移
          onTap: () => isEditable
              ? widget.toBucketEditScreen(context, bucketEntity)
              : widget.toTaskListScreen(context, bucketEntity),
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
                        widget.onTapBucketDelete(bucketEntity);
                        animatedListKey.currentState.removeItem(
                          currentIndex,
                          (context, animation) => _buildItem(
                              context, currentIndex, bucketEntity, animation),
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

// class BucketList extends StatelessWidget {
//   final GlobalKey<AnimatedListState> animatedListKey;
//   final List<BucketEntity> bucketEntitles;
//   final bool isEditable;
//   final bool isDeletable;
//   final ValueChanged<BucketEntity> toBucketEditScreen;
//   final ValueChanged<BucketEntity> toTaskListScreen;
//   final ValueChanged<BucketEntity> onTapBucketDelete;

//   const BucketList({
//     @required this.animatedListKey,
//     @required this.bucketEntitles,
//     @required this.isEditable,
//     @required this.isDeletable,
//     @required this.toBucketEditScreen,
//     @required this.toTaskListScreen,
//     @required this.onTapBucketDelete,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedList(
//       key: animatedListKey,
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       initialItemCount: bucketEntitles.length,
//       itemBuilder: (context, index, animation) {
//         return _buildItem(context, bucketEntitles[index], animation);
//       },
//     );
//   }

//   Widget _buildItem(BuildContext context, BucketEntity bucketEntity,
//       Animation<double> animation) {
//     return SizeTransition(
//       sizeFactor: animation,
//       child: Container(
//         height: 38,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border(
//             bottom: BorderSide(color: Color(defaultBorderColor), width: 0.5),
//           ),
//         ),
//         child: ListTile(
//           dense: true,
//           // TODO 編集画面orリスト一覧画面へ遷移
//           onTap: () => isEditable ? toBucketEditScreen(bucketEntity) : toTaskListScreen(bucketEntity),
//           leading: Icon(
//             Icons.fiber_manual_record,
//             color: Color(bucketEntity.iconColor),
//           ),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(bucketEntity.name),
//               if (isEditable)
//                 GestureDetector(
//                     child: Icon(
//                       Icons.remove_circle,
//                       color: Colors.red,
//                     ),
//                     onTap: () {
//                       if (isDeletable) {
//                         onTapBucketDelete(bucketEntity);
//                         final int removeIndex =
//                             bucketEntitles.indexOf(bucketEntity);
//                         animatedListKey.currentState.removeItem(
//                           removeIndex,
//                           (context, animation) =>
//                               _buildItem(context, bucketEntity, animation),
//                         );
//                       } else {
//                         _showUnableDeleteBucketAlert(context);
//                       }
//                     })
//               else
//                 Text(
//                   bucketEntity.count.toString(),
//                 ),
//             ],
//           ),
//           trailing: isEditable
//               ? GestureDetector(
//                   child: Icon(Icons.menu),
//                   //TODO 並び替え
//                   onTap: () => print('humbger'),
//                 )
//               : Icon(Icons.navigate_next),
//         ),
//       ),
//     );
//   }

//   Future<void> _showUnableDeleteBucketAlert(BuildContext context) async {
//     await showDialog<void>(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text('リスト削除'),
//         content: const Text('リストは最低１つ必要です。'),
//         actions: <Widget>[
//           FlatButton(
//             child: const Text('とじる'),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
