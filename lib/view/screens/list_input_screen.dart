import 'package:flutter/material.dart';
import 'package:flutter_task/resources/models/bucket.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

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
  bool _isColorPick = false;

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
          SizedBox(height: 50.0),
          _bucketNameInputPart(),
          SizedBox(height: 50.0),
          _bucketIconColorSelectPart(),
        ]),
      ),
    );
  }

  Widget _bucketNameInputPart() {
    return Container(
      height: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[400], width: 0.5),
          bottom: BorderSide(color: Colors.grey[400], width: 0.5),
        ),
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        style: const TextStyle(fontSize: 20.0),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 10.0),
          hintText: 'リスト名',
          hintStyle: const TextStyle(fontSize: 15.0),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _bucketIconColorSelectPart() {
    return InkWell(
      onTap: () => {
        setState(() {
          print('hogehoge');
          _isColorPick = _isColorPick != true;
        })
      },
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 500),
        height: _isColorPick ? 85.0 : 40.0,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey[400], width: 0.5),
            bottom: BorderSide(color: Colors.grey[400], width: 0.5),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 40,
              child: _selectColor(),
            ),
            Positioned(
              child: Container(
                color: Colors.white,
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'リストの色',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    Icon(Icons.fiber_manual_record),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectColor() {
    return Container(
      color: Colors.white,
      height: 40.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.fiber_manual_record,
                color: Colors.redAccent,
              ),
              onPressed: null),
          IconButton(
              icon: Icon(Icons.fiber_manual_record, color: Colors.green),
              onPressed: null),
          IconButton(
              icon: Icon(Icons.fiber_manual_record, color: Colors.lightBlue),
              onPressed: null),
          IconButton(
              icon: Icon(Icons.fiber_manual_record, color: Colors.orange),
              onPressed: null),
          IconButton(
              icon: Icon(Icons.fiber_manual_record,
                  color: Colors.yellowAccent[700]),
              onPressed: null),
          IconButton(
              icon: Icon(Icons.fiber_manual_record, color: Colors.grey),
              onPressed: null),
        ],
      ),
    );
  }
}
