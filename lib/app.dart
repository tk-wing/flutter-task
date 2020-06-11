import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/view/screens/home_screen.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  const App({@required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'タスク管理アプリ',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[100],
          brightness: Brightness.light,
          primaryColor: Colors.orange,
          accentColor: Colors.orangeAccent,
          fontFamily: 'Regular',
          primaryIconTheme: const IconThemeData.fallback().copyWith(
            color: Colors.white,
          ),
          accentIconTheme: const IconThemeData.fallback().copyWith(
            color: Colors.white,
          ),
          primaryTextTheme: const TextTheme(
            headline6: TextStyle(
              color: Colors.white,
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            foregroundColor: Colors.white,
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
