import 'package:flutter/material.dart';
import 'package:flutter_task/containers/bucket_create.dart';
import 'package:flutter_task/containers/bucket_edit.dart';
import 'package:flutter_task/containers/bucket_list_action.dart';
import 'package:flutter_task/containers/bucket_list_container.dart';
import 'package:flutter_task/containers/filter_bucket_list_container.dart';
import 'package:flutter_task/containers/task_create.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/view/components/custom_divider.dart';
import 'package:flutter_task/view/screens/task_list_screen.dart';

class BucketListPage extends StatelessWidget {
  final GlobalKey<AnimatedListState> _animatedListKey =
      GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('リスト'),
          centerTitle: true,
          actions: <Widget>[
            BucketListAction(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'タスク追加',
          onPressed: () => _toTaskCreateScreen(context),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 日付フィルタータイトル
              Container(
                height: 35,
                padding: const EdgeInsets.only(top: 20.0, left: 15.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Text('フィルター', style: TextStyle(color: Colors.grey[700])),
              ),
              CustomDivider(),
              // 日付フィルターリスト
              FilterBucketListContainer(),
              // バケットリスト
              BucketListContainer(
                  animatedListKey: _animatedListKey,
                  toBucketCreateScreen: _toBucketCreateScreen,
                  toBucketEditScreen: _toBucketEditScreen,
                  toTaskListScreen: _toTaskListScreen),
            ],
          ),
        ),
      ),
    );
  }

  void _toBucketCreateScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<bool>(
        builder: (context) => BucketCreate(),
      ),
    ).then((isCreated) {
      if (isCreated == null) {
        return;
      }
      _animatedListKey.currentState.insertItem(0);
    });
  }

  void _toBucketEditScreen(BuildContext context, BucketEntity bucketEntity) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => BucketEdit(bucketEntity: bucketEntity),
      ),
    );
  }

  void _toTaskListScreen(BuildContext context, BucketEntity bucketEntity) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => TaskListScreen(bucketEntity: bucketEntity),
      ),
    );
  }

  void _toTaskCreateScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => const TaskCreate()),
    );
  }
}
