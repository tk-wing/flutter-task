import 'package:flutter/material.dart';

class DescriptionInputScreen extends StatelessWidget {
  final TextEditingController _descriptionController = TextEditingController();

  DescriptionInputScreen({String description}) {
    _descriptionController.text = description;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ノート'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.done),
              tooltip: '完了',
              onPressed: () => _backToTaskInputScreen(context),
            )
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _descriptionController,
            keyboardType: TextInputType.text,
            maxLines: null,
            maxLength: 500,
            autofocus: true,
            style: const TextStyle(fontSize: 20.0),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  void _backToTaskInputScreen(BuildContext context) {
    Navigator.of(context).pop(_descriptionController.text);
  }
}
