import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/redux/actions/bucket_actions.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/components/bucket_edit_icon.dart';
import 'package:redux/redux.dart';

class BucketListAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        distinct: true,
        converter: _ViewModel.fromStore,
        builder: (context, viewModel) {
          return BucketEditActionIcon(
            onPressed: () => viewModel.onTapBucketListEdit(),
          );
        });
  }
}

class _ViewModel {
  final VoidCallback onTapBucketListEdit;

  _ViewModel({
    @required this.onTapBucketListEdit,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    void changeEditAvailability(Store<AppState> store) {
      if (store.state.bucketState.isEditable) {
        store.dispatch(UneditableAction());
      } else {
        store.dispatch(EditableAction());
      }
    }

    void checkCreateAvailability(Store<AppState> store) {
      if (store.state.bucketState.buckets.length < 3) {
        store.dispatch(CreatablenAction());
      } else {
        store.dispatch(UnCreatableAction());
      }
    }

    void checkDeleteAvailability(Store<AppState> store) {
      if (store.state.bucketState.buckets.length > 1) {
        store.dispatch(DeletableAction());
      } else {
        store.dispatch(UndeletableAction());
      }
    }

    return _ViewModel(onTapBucketListEdit: () {
      changeEditAvailability(store);
      checkCreateAvailability(store);
      checkDeleteAvailability(store);
    });
  }
}
