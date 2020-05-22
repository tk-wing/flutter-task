import 'package:flutter/material.dart';
import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/resources/models/bucket.dart';
import 'package:flutter_task/view/components/bucket_tile.dart';
import 'package:flutter_task/view/components/filter_tile.dart';
import 'package:flutter_task/view/screens/list_input_screen.dart';
import 'package:flutter_task/view/screens/bucket_list_screen.dart';
import 'package:flutter_task/viewModel/list_viewmodel.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ListViewModel>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('リスト'),
          centerTitle: true,
          backgroundColor: Colors.orange,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => viewModel.onTapListEdit(),
              color: Colors.black54,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          tooltip: 'タスク追加',
          onPressed: null,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[400], width: 1.0),
                  ),
                ),
                height: 35,
                padding: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 15.0),
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                child: Text('フィルター', style: TextStyle(color: Colors.grey[700])),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, int i) => FilterTile(
                    filter: defaultFilter[i],
                    onTapNext: (filter) => _toTaskListScreen(filter, context),
                  ),
                  itemCount: defaultFilter.length,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[400], width: 1.0),
                  ),
                ),
                height: 35,
                padding: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 15.0),
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                child:
                    Text('タスクリスト', style: TextStyle(color: Colors.grey[700])),
              ),
              Consumer<ListViewModel>(
                builder: (context, model, child) {
                  return AnimatedContainer(
                    curve: Curves.fastOutSlowIn,
                    height: model.isEditable ? 40 : 0,
                    duration: Duration(milliseconds: 300),
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          child: child,
                          opacity: animation,
                        );
                      },
                      child: model.isEditable
                          ? Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey[400], width: 0.5),
                                ),
                              ),
                              height: 40,
                              child: ListTile(
                                dense: true,
                                leading: GestureDetector(
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.lightGreenAccent[700],
                                  ),
                                  onTap: () => _toListAddScreen(context),
                                ),
                                title: Text('タスクリスト追加'),
                              ),
                            )
                          : Container(),
                    ),
                  );
                },
              ),
              Consumer<ListViewModel>(
                builder: (context, model, child) {
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, int i) => BucketTile(
                      bucket: model.buckets[i],
                      isEditable: model.isEditable,
                      onTapEdit: (taskList) =>
                          _toListEditScreen(context, taskList),
                      onTapNext: (taskList) =>
                          _toTaskListScreen(taskList, context),
                    ),
                    itemCount: model.buckets.length,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toTaskListScreen(Bucket bucket, BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BucketListScreen(bucket: bucket)));
  }

  void _toListEditScreen(BuildContext context, Bucket bucket) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BucketInputScreen(
          status: InputStatus.EDIT,
          bucket: bucket,
        ),
      ),
    );
  }

  void _toListAddScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BucketInputScreen(status: InputStatus.ADD),
      ),
    );
  }
}
