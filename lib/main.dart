import 'package:flutter/material.dart';
import 'package:flutter_task/provider/provider.dart';
import 'package:flutter_task/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: globalProviders,
    child: TaskApp(),
  ));
}

class TaskApp extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'タスク管理アプリ',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.orange,
        accentColor: Colors.orangeAccent,
        primaryIconTheme: IconThemeData.fallback().copyWith(
          color: Colors.white,
        ),
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
