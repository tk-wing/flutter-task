import 'package:flutter/material.dart';
import 'package:flutter_task/resources/models/bucket.dart';

enum InputStatus { ADD, EDIT }

class BucketInputScreen extends StatefulWidget {
  final InputStatus status;
  final Bucket bucket;

  BucketInputScreen({@required this.status, this.bucket});

  @override
  _BucketInputScreenState createState() => _BucketInputScreenState();
}

class _BucketInputScreenState extends State<BucketInputScreen> {
  String _title = '';

  @override
  void initState() {
    super.initState();
    if (widget.status == InputStatus.EDIT) {
      _title = 'リスト編集';
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
        ),
        body: Column(children: <Widget>[
          _bucketNameInputPart(),
          _bucketIconColorSelectPart(),
        ]),
      ),
    );
  }

  Widget _bucketNameInputPart() {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }

  Widget _bucketIconColorSelectPart() {
    return Container();
  }
}
