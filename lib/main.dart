import 'package:flutter/material.dart';
import 'package:flutter_task/view/screens/home_screen.dart';

void main() {
  runApp(
    TaskApp()
  );
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
        brightness: Brightness.dark
      ),
      home: HomeScreen(),
    );
  }
}
