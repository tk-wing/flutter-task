import 'package:flutter/material.dart';
import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/models/bucket/bucket.dart';

@immutable
class BucketState {
  final bool isEditable;
  final bool isCreatable;
  final bool isDeletable;
  final List<DefaultFilter> filteredBuckets;
  final List<BucketEntity> bucketEntities;

  const BucketState({
    this.isEditable,
    this.isCreatable,
    this.isDeletable,
    this.filteredBuckets,
    this.bucketEntities,
    });

  BucketState.initState():
    this.isEditable = false,
    this.isCreatable = false,
    this.isDeletable = false,
    this.filteredBuckets = defaultFilterBuckets,
    this.bucketEntities = [];
}




