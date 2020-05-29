import 'package:flutter_task/database/bucket/bucket.dao.dart';
import 'package:flutter_task/database/database.dart';
import 'package:flutter_task/resources/repository/bucket_repository.dart';
import 'package:flutter_task/viewModel/list_viewmodel.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viweModels,
];

List<SingleChildWidget> independentModels = [
  Provider<MyDataBase>(
    create: (_) => MyDataBase(),
    dispose: (_, db) => db.close(),
  )
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider<MyDataBase, BucketDao>(
    update: (_, db, dao) => BucketDao(db),
  ),
  ChangeNotifierProvider<BucketRepository>(
    create: (context) =>
        BucketRepository(dao: Provider.of<BucketDao>(context, listen: false)),
  ),
];

List<SingleChildWidget> viweModels = [
  ChangeNotifierProxyProvider<BucketRepository, ListViewModel>(
    create: (context) => ListViewModel(
      bucketRepository: Provider.of<BucketRepository>(context, listen: false),
    ),
    update: (context, repository, viewModel) =>
        viewModel..onRepositoryUpdate(repository),
  )
];
