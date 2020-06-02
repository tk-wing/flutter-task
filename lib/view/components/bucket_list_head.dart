import 'package:flutter/material.dart';

import 'custom_divider.dart';

class BucketListHead extends StatelessWidget {
  final bool isEditable;
  final bool isCreatable;
  final VoidCallback toBucketAddScreen;

  const BucketListHead({
    @required this.isEditable,
    @required this.isCreatable,
    @required this.toBucketAddScreen,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
      height: isEditable ? 84 : 46,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 45,
            right: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: 38,
                  child: ListTile(
                    dense: true,
                    onTap: () => isCreatable
                        ? toBucketAddScreen()
                        : _showUnableAddBucketAlert(context),
                    leading: GestureDetector(
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.lightGreenAccent[700],
                      ),
                    ),
                    title: const Text('タスクリスト追加'),
                  ),
                ),
                CustomDivider(),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 35,
                padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                child:
                    Text('タスクリスト', style: TextStyle(color: Colors.grey[700])),
              ),
              CustomDivider(),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showUnableAddBucketAlert(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('リスト追加'),
        content: const Text('リストの作成は最大３つまでです。'),
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
