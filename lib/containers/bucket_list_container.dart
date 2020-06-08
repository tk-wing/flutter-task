import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/redux/actions/bucket_actions.dart';
import 'package:flutter_task/redux/actions/task.action.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/components/bucket_list.dart';
import 'package:flutter_task/view/components/bucket_list_head.dart';
import 'package:redux/redux.dart';

class BucketListContainer extends StatelessWidget {
  final GlobalKey<AnimatedListState> animatedListKey;
  final void Function(BuildContext) toBucketCreateScreen;
  final void Function(BuildContext, BucketEntity) toBucketEditScreen;
  final void Function(BuildContext, BucketEntity) toTaskListScreen;

  const BucketListContainer({
    @required this.animatedListKey,
    @required this.toBucketCreateScreen,
    @required this.toBucketEditScreen,
    @required this.toTaskListScreen,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, viewModel) {
        return Column(
          children: <Widget>[
            BucketListHead(
              isEditable: viewModel.isEditable,
              isCreatable: viewModel.isCreatable,
              toBucketCreateScreen: toBucketCreateScreen,
            ),
            BucketList(
              animatedListKey: animatedListKey,
              bucketEntities: viewModel.bucketEntities,
              isEditable: viewModel.isEditable,
              isDeletable: viewModel.isDeletable,
              onInit: viewModel.onInit,
              toBucketEditScreen: toBucketEditScreen,
              toTaskListScreen: toTaskListScreen,
              onTapBucketDelete: viewModel.onTapBucketDelete,
            ),
          ],
        );
      },
    );
  }
}

class _ViewModel {
  final bool isEditable;
  final bool isCreatable;
  final bool isDeletable;
  final List<BucketEntity> bucketEntities;
  final VoidCallback onInit;
  final ValueChanged<BucketEntity> onTapBucketDelete;

  _ViewModel({
    @required this.isEditable,
    @required this.isCreatable,
    @required this.isDeletable,
    @required this.bucketEntities,
    @required this.onInit,
    @required this.onTapBucketDelete,
  });

  static _ViewModel fromStore(Store<AppState> store) {

    return _ViewModel(
      isEditable: store.state.bucketState.isEditable,
      isCreatable: store.state.bucketState.isCreatable,
      isDeletable: store.state.bucketState.isDeletable,
      bucketEntities: store.state.bucketState.bucketEntities,
      onInit: () => store.dispatch(GetAllBucketAction()),
      onTapBucketDelete: (bucketEntity) {
        store.dispatch(DeleteBucketAction(bucketEntity));
        store.dispatch(CreateAvailabilityAction(store.state.bucketState.bucketEntities.length));
        store.dispatch(DeleteAvailabilityAction(store.state.bucketState.bucketEntities.length));
        store.dispatch(DeleteTasksActionByBucketId(bucketEntity.id));
      },
    );
  }
}
