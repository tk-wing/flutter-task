import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/redux/actions/bucket_actions.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/components/filter_bucket_list.dart';
import 'package:redux/redux.dart';

class FilterBucketListContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, viewModel) => FilterBucketList(
        isEditable: viewModel.isEditable,
        filteredBuckets: viewModel.filteredBuckets,
        onInit: viewModel.onInit,
      ),
    );
  }
}

class _ViewModel {
  final bool isEditable;
  final List<DefaultFilter> filteredBuckets;
  final VoidCallback onInit;

  _ViewModel({
    @required this.isEditable,
    @required this.filteredBuckets,
    @required this.onInit,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      isEditable: store.state.bucketState.isEditable,
      filteredBuckets: store.state.bucketState.filteredBuckets,
      onInit: () => store.dispatch(GetFilteredBucketAction()),
    );
  }
}
