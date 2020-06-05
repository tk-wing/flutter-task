import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/containers/bucket_create.dart';
import 'package:flutter_task/containers/bucket_edit.dart';
import 'package:flutter_task/containers/task_list_container.dart';
import 'package:flutter_task/models/bucket/bucket.dart';
import 'package:flutter_task/redux/actions/bucket_actions.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/components/bucket_list.dart';
import 'package:flutter_task/view/components/bucket_list_head.dart';
import 'package:redux/redux.dart';

class BucketListContainer extends StatelessWidget {
  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey();

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
              toBucketAddScreen: () => _toBucketAddScreen(context, viewModel),
            ),
            BucketList(
              animatedListKey: _animatedListKey,
              bucketEntities: viewModel.bucketEntities,
              isEditable: viewModel.isEditable,
              isDeletable: viewModel.isDeletable,
              onInit: viewModel.onInit,
              toBucketEditScreen: (bucketEntity) =>
                  _toBucketEditScreen(context, bucketEntity),
              toTaskListScreen: (bucketEntity) =>
                  _toTaskListScreen(context, bucketEntity),
              onTapBucketDelete: viewModel.onTapBucketDelete,
            ),
          ],
        );
      },
    );
  }

  void _toBucketAddScreen(BuildContext context, _ViewModel viewModel) {
    Navigator.push(
      context,
      MaterialPageRoute<BucketEntity>(
        builder: (context) => BucketCreate(),
      ),
    ).then((bucketEntity) {
      if (bucketEntity == null) {
        return;
      }
      viewModel.bucketEntities.insert(0, bucketEntity);
      _animatedListKey.currentState.insertItem(0);
    });
  }

  void _toBucketEditScreen(BuildContext context, BucketEntity bucketEntity) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => BucketEdit(bucketEntity: bucketEntity),
      ),
    );
  }

  void _toTaskListScreen(BuildContext context, BucketEntity bucketEntity) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => TasktListContainer(bucketEntity: bucketEntity),
      ),
    );
  }
}

class _ViewModel {
  // final bool isLoading;
  final bool isEditable;
  final bool isCreatable;
  final bool isDeletable;
  final List<BucketEntity> bucketEntities;
  final VoidCallback onInit;
  final ValueChanged<BucketEntity> onTapBucketDelete;

  _ViewModel({
    // @required this.isLoading,
    @required this.isEditable,
    @required this.isCreatable,
    @required this.isDeletable,
    @required this.bucketEntities,
    @required this.onInit,
    @required this.onTapBucketDelete,
  });

  static _ViewModel fromStore(Store<AppState> store) {
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

    return _ViewModel(
      // isLoading: store.state.isLoading,
      isEditable: store.state.bucketState.isEditable,
      isCreatable: store.state.bucketState.isCreatable,
      isDeletable: store.state.bucketState.isDeletable,
      bucketEntities: store.state.bucketState.buckets,
      onInit: () => store.dispatch(GetAllBucketAction()),
      onTapBucketDelete: (bucketEntity) {
        store.dispatch(DeleteBucketAction(bucketEntity));
        checkCreateAvailability(store);
        checkDeleteAvailability(store);
      },
    );
  }
}
