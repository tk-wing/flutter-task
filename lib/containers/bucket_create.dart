import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/redux/actions/bucket_actions.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/screens/bucket_input_screen.dart';
import 'package:redux/redux.dart';

class BucketCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, viewModel) {
        return BucketInputScreen(
          status: InputStatus.CREATE,
          onPressedSave: viewModel.onPressedSave,
          );
      }
    );
  }
}

class _ViewModel {
  final ValueChanged<BucketModel> onPressedSave;

  _ViewModel({@required this.onPressedSave});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      onPressedSave: (BucketModel bucketModel) {
          store.dispatch(CreateBucketAction(bucketModel));
      }
    );
  }
}
