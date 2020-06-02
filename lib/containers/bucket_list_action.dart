import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/redux/actions/bucket_list_actions.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/components/bucket_edit_icon.dart';
import 'package:redux/redux.dart';

class BucketListAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, viewModel) {
        return BucketEditActionIcon(
          onPressed: () => viewModel.onTapBucketListEdit(),
          );
      }
    );
  }
}

class _ViewModel {
  final VoidCallback onTapBucketListEdit;

  _ViewModel({
    @required this.onTapBucketListEdit,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        onTapBucketListEdit: () {
          store.dispatch(BucketEditAction(isEditable: !store.state.bucketListState.isEditable));
          store.dispatch(BucketCreatableAction(
              store.state.bucketListState.buckets.length < 3));
          store.dispatch(BucketDeletableAction(
              store.state.bucketListState.buckets.length > 1));
        });
  }
}
