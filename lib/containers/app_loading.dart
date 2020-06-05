import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:redux/redux.dart';


class AppLoading extends StatelessWidget {
  final Widget Function(BuildContext context, bool isLoading) builder;

  const AppLoading({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, bool>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.isLoading,
      builder: builder,
    );
  }
}
