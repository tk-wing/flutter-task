import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'タスク追加',
          onPressed: null,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text('フィルター', style: TextStyle(color: Colors.white70)),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.today),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text('今日'), Text('0')]),
              trailing: IconButton(
                  icon: Icon(Icons.navigate_next), onPressed: null),
            ),
            ListTile(
              leading: Icon(Icons.date_range),
              title: Text('近日中'),
              trailing:
                  IconButton(icon: Icon(Icons.navigate_next), onPressed: null),
            ),
            ListTile(
              leading: Icon(Icons.event_busy),
              title: Text('期限なし'),
              trailing:
                  IconButton(icon: Icon(Icons.navigate_next), onPressed: null),
            ),
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text('すべて'),
              trailing:
                  IconButton(icon: Icon(Icons.navigate_next), onPressed: null),
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in),
              title: Text('完了したタスク'),
              trailing:
                  IconButton(icon: Icon(Icons.navigate_next), onPressed: null),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text('タスクリスト', style: TextStyle(color: Colors.white70)),
            ),
            Divider(
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.fiber_manual_record, color: Colors.red,),
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[Text('マイタスク'), Text('0')]),
              trailing: IconButton(
                  icon: Icon(Icons.navigate_next), onPressed: null),
            ),
            ListTile(
              leading: GestureDetector(child: Icon(Icons.add), onTap: () => print('!!!'),),
              title: Text('リストの追加'),
            ),
          ],
        ),
      ),
    );
  }
}
