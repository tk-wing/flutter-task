import 'package:flutter/material.dart';
import 'package:flutter_task/data/test_data.dart';
import 'package:flutter_task/models/bucket/bucket.dart';

@immutable
class BucketListState {
  final bool isEditable;
  final bool isCreatable;
  final bool isDeletable;
  final List<BucketEntity> buckets;

  const BucketListState({
    this.isEditable,
    this.isCreatable,
    this.isDeletable,
    this.buckets,
    });

  BucketListState.initState():
    this.isEditable = false,
    this.isCreatable = false,
    this.isDeletable = false,
    this.buckets = testBucketEntity;
}




