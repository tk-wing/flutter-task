import 'package:flutter_task/viewModel/list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viweModels,
];

List<SingleChildWidget> independentModels = [];

List<SingleChildWidget> dependentModels = [];

List<SingleChildWidget> viweModels = [
  ChangeNotifierProvider<ListViewModel>(
    create: (context) => ListViewModel(),
  ),
];
