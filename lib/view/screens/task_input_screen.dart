import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/models/date_format.dart';
import 'package:flutter_task/models/task/task.dart';
import 'package:flutter_task/view/screens/description_input_screen.dart';
import 'package:flutter_task/view/styles/style.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';
import 'package:toast/toast.dart';

class TaskInputScreen extends StatefulWidget {
  final List<BucketEntity> bucketEntites;
  final ValueChanged<TaskModel> onPressedSave;

  const TaskInputScreen(
      {@required this.bucketEntites, @required this.onPressedSave});

  @override
  _TaskInputScreenState createState() => _TaskInputScreenState();
}

class _TaskInputScreenState extends State<TaskInputScreen> {
  List<BucketEntity> get bucketEntites => widget.bucketEntites;

  final TextEditingController _titleController = TextEditingController();
  int _bucketId = 0;
  String _description = '';
  DateTime _expiredAt = null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('タスク作成'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.done),
              tooltip: '完了',
              // TODO タスク保存ボタン
              onPressed: () => _onPressedSave(context),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50.0),
              // タスク名入力パート
              _titleInputPart(),
              const SizedBox(height: 30.0),
              // 期日選択パート
              _expireDateSelectPart(),
              const SizedBox(height: 30.0),
              // description入力パート
              _descriptionInputPart(),
              const SizedBox(height: 30.0),
              // リスト選択パート
              _listSelectPart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleInputPart() {
    return Container(
      height: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
          bottom: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
        ),
      ),
      child: TextField(
        controller: _titleController,
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 15.0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 5.0),
          hintText: 'タスク名',
          hintStyle: const TextStyle(fontSize: 15.0),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _expireDateSelectPart() {
    return Container(
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
          bottom: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text('期日パート'),
          Text(DateFormat(dateTime).format(DateTime.now())),
        ],
      ),
    );
  }

  Widget _descriptionInputPart() {
    return InkWell(
      onTap: () => _toDescriptionInputScreen(context),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'ノート',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(top: 5.0),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
              bottom:
                  BorderSide(color: Color(inputFormBorderColor), width: 0.5),
            ),
          ),
          child: Text(
            _description,
            style: const TextStyle(letterSpacing: 0.8),
          ),
        )
      ]),
    );
  }

  Widget _listSelectPart() {
    return Container(
      // height: 40.0,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
          bottom: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
        ),
      ),
      child: Center(
        child: SmartSelect<int>.single(
          value: _bucketId,
          title: 'リスト',
          options: SmartSelectOption.listFrom<int, BucketEntity>(
            source: bucketEntites,
            value: (index, bucketEntity) => bucketEntity.id,
            title: (index, bucketEntity) => bucketEntity.name,
          ),
          onChange: (value) => {
            setState(() {
              _bucketId = value;
            })
          },
          modalType: SmartSelectModalType.bottomSheet,
        ),
      ),
    );
  }

  void _toDescriptionInputScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<String>(
        builder: (context) => DescriptionInputScreen(description: _description),
      ),
    ).then((description) {
      if (description == null) {
        return;
      }
      setState(() {
        _description = description;
      });
    });
  }

  void _onPressedSave(BuildContext context) {
    if (_titleController.text == '') {
      Toast.show('バケット名を入力してください。', context, duration: Toast.LENGTH_LONG);
      return;
    }

    if (_bucketId == 0) {
      Toast.show('リストを選択してください。', context, duration: Toast.LENGTH_LONG);
      return;
    }

    final taskModel = TaskModel(
      bucketId: _bucketId,
      title: _titleController.text,
      description: _description == '' ? null : _description,
      expiredAt: _expiredAt,
    );

    widget.onPressedSave(taskModel);

    Navigator.of(context).pop();
  }
}
