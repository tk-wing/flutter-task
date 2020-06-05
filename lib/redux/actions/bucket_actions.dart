import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/models/bucket/bucket.dart';


// Bucket Availability
class EditableAction {}
class UneditableAction {}
class CreateAvailabilityAction {
  final int numberOfBucketEntites;

  CreateAvailabilityAction(this.numberOfBucketEntites);
}
class DeleteAvailabilityAction {
  final int numberOfBucketEntites;

  DeleteAvailabilityAction(this.numberOfBucketEntites);
}


// 全バケット取得
class GetAllBucketAction {}

// フィルターバケット取得
class GetFilteredBucketAction {}

class SetBucketAction {
  final List<BucketEntity> bucketEntites;

  SetBucketAction(this.bucketEntites);
}


/// フィルターバケットのセット
class SetFilteredBucketAction {
  final List<DefaultFilter> defaultFilteredBuckets;

  SetFilteredBucketAction(this.defaultFilteredBuckets);
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


