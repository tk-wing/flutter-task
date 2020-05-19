import 'package:flutter/material.dart';
import 'package:flutter_task/view/screens/pages/calender_page.dart';
import 'package:flutter_task/view/screens/pages/list_page.dart';
import 'package:flutter_task/view/screens/pages/setting_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  final _pages = [
    ListPage(),
    CalenderPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // TODO HomeScreen Body
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            title: const Text('リスト'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today),
            title: const Text('カレンダー'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('設定'),
          ),
        ],
        onTap: (i) {
          setState(() {
            _currentIndex = i;
          });
        },
        currentIndex: _currentIndex,
        ),
      ),
    );
  }
}