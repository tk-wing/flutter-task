import 'package:flutter/material.dart';
import 'package:flutter_task/view/pages/bucket_list_page.dart';
import 'package:flutter_task/view/pages/calender_page.dart';
import 'package:flutter_task/view/pages/setting_page.dart';
import 'package:redux/redux.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    BucketListPage(),
    CalenderPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('リスト'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('カレンダー'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('設定'),
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
