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
          title: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
