import 'package:flutter_task/models/bucket/bucket.dart';


// Bucket Availability
class CreatablenAction {}
class UnCreatableAction {}
class EditableAction {}
class UneditableAction {}
class DeletableAction {}
class UndeletableAction {}


// 全バケット取得
class GetAllBucketAction {}


/// バケットのセット
class SetBucketAction {
  final List<BucketEntity> bucketEntites;

  SetBucketAction(this.bucketEntites);
}

/// バケット追加
class AddBucketAction {
  final BucketEntity bucketEntity;

  AddBucketAction(this.bucketEntity);
}

/// バケット新規作成
class CreateBucketAction {
  final BucketModel bucketModel;

  CreateBucketAction(this.bucketModel);
}

/// バケット更新
class UpdateBucketAction {
  final BucketEntity bucketEntity;

  UpdateBucketAction(this.bucketEntity);
}

/// バケット削除
class DeleteBucketAction {
  final BucketEntity bucketEntity;

  DeleteBucketAction(this.bucketEntity);
}


