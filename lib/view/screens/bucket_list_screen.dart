import 'package:flutter/material.dart';
import 'package:flutter_task/resources/models/bucket.dart';


class BucketListScreen extends StatelessWidget {
  final BucketEntity bucket;

  BucketListScreen({this.bucket});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(bucket.name),
          centerTitle: true,
        ),
      ),
    );
  }
}
