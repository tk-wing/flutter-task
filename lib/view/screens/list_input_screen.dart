import 'package:flutter/material.dart';
import 'package:flutter_task/data/bucket_color.dart';
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

  Color _selectedColor = Colors.orange;
  TextEditingController _bucketNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.status == InputStatus.EDIT) {
      _title = 'リスト編集';
      _bucketNameController.text = widget.bucket.name;
      _selectedColor = Color(widget.bucket.iconColor);
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

  Widget _bucketIconColorSelectPart() {
    return InkWell(
      onTap: () => {
        setState(() {
          _isColorPick = _isColorPick != true;
        })
      },
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 500),
        height: _isColorPick ? 85.0 : 40.0,
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey[400], width: 0.5),
            bottom: BorderSide(color: Colors.grey[400], width: 0.5),
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
                    _isColorPick
                        ? Text(
                            '色の選択',
                            style: TextStyle(color: Colors.black),
                          )
                        : Text(
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

  void _onSelectedColor(Color color) {
    setState(() {
      _selectedColor = color;
      _isColorPick = false;
    });
  }
}
