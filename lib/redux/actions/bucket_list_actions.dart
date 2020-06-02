import 'package:flutter_task/models/bucket/bucket.dart';

// バケット操作に関するアクション

// バケット編集可否
class BucketEditAction {
  final bool isEditable;

  BucketEditAction({this.isEditable});
}

// バケット作成判定
class BucketCreatableAction {
  final bool isCreatable;

  BucketCreatableAction(this.isCreatable);
}

// バケット削除判定
class BucketDeletableAction {
  final bool isDeletable;

  BucketDeletableAction(this.isDeletable);
}

// バケット新規作成
class BucketCreateAction {
  final BucketEntity bucket;

  BucketCreateAction({this.bucket});
}

// バケット更新
class BucketUpdateAction {
  final BucketEntity bucket;

  BucketUpdateAction({this.bucket});
}

// バケット削除
class BucketDeleteAction {
  final BucketEntity bucket;

  BucketDeleteAction({this.bucket});
}


