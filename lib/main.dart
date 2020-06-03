import 'package:flutter/material.dart';
import 'package:flutter_task/app.dart';
import 'package:flutter_task/redux/middlewares/app_middleware.dart';
import 'package:flutter_task/redux/reducers/app_reducer.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(
    App(
      store: Store<AppState>(
        appReducer,
        initialState: AppState.initState(),
        middleware: createAppStoreMiddleware()
      ),
    ),
  );
}
