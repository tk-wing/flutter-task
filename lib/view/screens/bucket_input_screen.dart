import 'package:flutter/material.dart';
import 'package:flutter_task/data/bucket_color.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/view/styles/style.dart';

enum InputStatus { CREATE, EDIT }

class BucketInputScreen extends StatefulWidget {
  final InputStatus status;
  final BucketEntity bucketEntity;
  final ValueChanged<BucketEntity> onPressedSave;

  const BucketInputScreen({
    @required this.status,
    @required this.onPressedSave,
    this.bucketEntity,
    });

  @override
  _BucketInputScreenState createState() => _BucketInputScreenState();
}

class _BucketInputScreenState extends State<BucketInputScreen> {
  String _title = '';
  bool _isColorPick = false;

  BucketEntity get bucketEntity => widget.bucketEntity;

  Color _selectedColor = Colors.orange;
  final TextEditingController _bucketNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.status == InputStatus.EDIT) {
      _title = 'リスト編集';
      _bucketNameController.text = bucketEntity.name;
      _selectedColor = Color(bucketEntity.iconColor);
    } else {
      _title = 'リスト作成';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(this._title),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.done),
              tooltip: '完了',
              onPressed: () => _onPressedSave(context),
            )
          ],
        ),
        body: Column(children: <Widget>[
          const SizedBox(height: 50.0),
          // バケット名入力パート
          _bucketNameInputPart(),
          const SizedBox(height: 50.0),
          // バケットアイコンカラー選択パート
          _bucketIconColorSelectPart(),
        ]),
      ),
    );
  }


  /// バケット名入力ウィジェット
  Widget _bucketNameInputPart() {
    return Container(
      height: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
          bottom: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
        ),
      ),
      child: TextField(
        controller: _bucketNameController,
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 15.0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 5.0),
          hintText: 'リスト名',
          hintStyle: const TextStyle(fontSize: 15.0),
          border: InputBorder.none,
        ),
      ),
    );
  }

  /// カラー選択ウィジェット
  Widget _bucketIconColorSelectPart() {
    return InkWell(
      onTap: () => {
        setState(() {
          _isColorPick = _isColorPick != true;
        })
      },
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 500),
        height: _isColorPick ? 85.0 : 40.0,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
            bottom: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
          ),
        ),
        child: Stack(
          fit: StackFit.loose,
          children: <Widget>[
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: _selectColor(),
            ),
            Positioned(
              child: Container(
                color: Colors.white,
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (_isColorPick)
                      Text(
                        '色の選択',
                        style: TextStyle(color: Colors.black),
                      )
                    else
                      Text(
                        'リストの色',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    Icon(Icons.fiber_manual_record, color: _selectedColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// カラーウィジェット
  Widget _selectColor() {
    return Container(
      color: Colors.white,
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List<Widget>.generate(
          bucketColors.length,
          (int i) {
            return IconButton(
              icon: Icon(Icons.fiber_manual_record),
              color: bucketColors[i],
              onPressed: () => _onSelectedColor(bucketColors[i]),
            );
          },
        ),
      ),
    );
  }

  /// カラー選択したときの処理
  void _onSelectedColor(Color color) {
    setState(() {
      _selectedColor = color;
      _isColorPick = false;
    });
  }

  /// バケット新規作成・更新処理
  void _onPressedSave(BuildContext context) {
    BucketEntity bucketEntityEntry;
    if (widget.status == InputStatus.CREATE) {
      bucketEntityEntry = BucketEntity(id: 3, name: _bucketNameController.text, iconColor: _selectedColor.value);
    } else {
      bucketEntityEntry = bucketEntity;
      bucketEntityEntry.name = _bucketNameController.text;
      bucketEntityEntry.iconColor = _selectedColor.value;
    }

    widget.onPressedSave(bucketEntityEntry);
    Navigator.of(context).pop(bucketEntityEntry);
  }
}
