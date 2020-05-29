import 'package:flutter/material.dart';
import 'package:flutter_task/resources/models/bucket.dart';
import 'package:flutter_task/viewModel/list_viewmodel.dart';
import 'package:toast/toast.dart';

class BucketList extends StatefulWidget {
  ListViewModel viewModel;

  BucketList({this.viewModel});

  @override
  _BucketListState createState() => _BucketListState();
}

class _BucketListState extends State<BucketList> {
  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey();

  List<BucketEntity> _buckets;
  bool _isEditable;
  bool _isDeletable;

  @override
  void initState() {
    _buckets = widget.viewModel.buckets;
    _isEditable = widget.viewModel.isEditable;
    _isDeletable = widget.viewModel.isDeleteable;

    _isEditable = true;
    _isDeletable = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnimatedList(
          key: _animatedListKey,
          initialItemCount: _buckets.length,
          itemBuilder: (context, index, animation) {
            return _buildItem(_buckets[index], animation);
          },
        ),
      ),
    );
  }

  Widget _buildItem(BucketEntity bucketEntity, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Container(
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
          // TODO 編集画面orリスト一覧画面へ遷移
          onTap: null,
          leading: Icon(
            Icons.fiber_manual_record,
            color: Color(bucketEntity.iconColor),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(bucketEntity.name),
              _isEditable
                  ? GestureDetector(
                      child: Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      //TODO バケット削除
                      onTap: () async => _isDeletable
                          ? await _onTapBacketDelete(bucketEntity)
                          : _showUnableAddBucketAlert(context),
                    )
                  : Text(
                      bucketEntity.count.toString(),
                    ),
            ],
          ),
          trailing: _isEditable
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

  _onTapBacketDelete(BucketEntity bucketEntity) async {
    try {
      await widget.viewModel.deleteBucket(bucketEntity);

      final removeIndex = _buckets.indexOf(bucketEntity);
      final removedItem = _buckets.removeAt(removeIndex);

      _animatedListKey.currentState.removeItem(
        removeIndex,
        (context, animation) => _buildItem(removedItem, animation),
      );
    } on Exception catch (error) {
      Toast.show('リストの削除に失敗しました', context, duration: Toast.LENGTH_LONG);
    }
  }

  Future<void> _showUnableAddBucketAlert(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('リスト追加'),
        content: Text('リストの作成は最大３つまでです。'),
        actions: <Widget>[
          FlatButton(
            child: Text('とじる'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

class SamplePage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SamplePage2State();
}

class SamplePage2State extends State<SamplePage2> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final _data = ['data1', 'data2', 'data3', 'data4', 'data5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sample Page 2')),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _data.length,
        itemBuilder: (BuildContext context, int index, Animation animation) {
          return _buildItem(_data[index], animation);
        },
      ),
    );
  }

  Widget _buildItem(String item, Animation animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(item),
        onTap: () {
          // 内部データを消す
          var removeIndex = _data.indexOf(item);
          String removedItem = _data.removeAt(removeIndex);

          // 削除アニメーションで利用されるウィジェットのビルダ関数
          // 削除前のものと同じ描画内容にするといい感じに消える
          AnimatedListRemovedItemBuilder builder = (context, animation) {
            return _buildItem(removedItem, animation);
          };

          // ウィジェット上から削除を実行する
          _listKey.currentState.removeItem(removeIndex, builder);
        },
      ),
    );
  }
}
