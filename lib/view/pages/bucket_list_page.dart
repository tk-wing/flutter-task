import 'package:flutter/material.dart';
import 'package:flutter_task/containers/bucket_list_action.dart';
import 'package:flutter_task/containers/bucket_list_container.dart';
import 'package:flutter_task/containers/filter_bucket_list_container.dart';
import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/view/components/custom_divider.dart';
import 'package:flutter_task/view/components/filter_tile.dart';
import 'package:flutter_task/view/styles/style.dart';

class BucketListPage extends StatelessWidget {
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
          onPressed: null,
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
              BucketListContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
