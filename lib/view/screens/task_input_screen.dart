import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/view/styles/style.dart';

class TaskInputScreen extends StatefulWidget {
  @override
  _TaskInputScreenState createState() => _TaskInputScreenState();
}

class _TaskInputScreenState extends State<TaskInputScreen> {
  final TextEditingController _titleController = TextEditingController();

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
              onPressed: () => print('タスク保存ボタン'),
            )
          ],
        ),
        body: Column(
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
            // リスト選択パート
            _listSelectPart(),
          ],
        ),
      ),
    );
  }

  Widget _titleInputPart() {
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
            bottom: BorderSide(color: Color(inputFormBorderColor), width: 0.5),
          ),
        ),
        child: const Text('期日パート'));
  }

  Widget _descriptionInputPart() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'ノート',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          Container(
            // height: 40.0,
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
            child: const Text(
                'ライセンスはテンプレート方針と制限あり百科んます以上、代表するれ意が著作権法的の引用主体性をいいれてはあるた、方針の書籍は、運用有し人を説明さことにおいて除外明瞭あっんばいるんあっ。一方、方針の括弧国は、方針の著作あり補足公式あっ文章で利用し、その文がして出典が引用さことで表現されます。',
                style: TextStyle(letterSpacing: 0.8),
                ),
          )
        ]);
  }

  Widget _listSelectPart() {
    return Container();
  }
}
