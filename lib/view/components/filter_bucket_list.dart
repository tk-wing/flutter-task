import 'package:flutter/material.dart';
import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/view/components/custom_divider.dart';
import 'package:flutter_task/view/screens/filter_task_list_screen.dart';
import 'package:flutter_task/view/styles/style.dart';

class FilterBucketList extends StatefulWidget {
  final bool isEditable;
  final List<DefaultFilter> filteredBuckets;
  final VoidCallback onInit;

  const FilterBucketList({
    @required this.isEditable,
    @required this.filteredBuckets,
    @required this.onInit,
  });

  @override
  _FilterBucketListState createState() => _FilterBucketListState();
}

class _FilterBucketListState extends State<FilterBucketList> {
  bool get isEditable => widget.isEditable;
  List<DefaultFilter> get filteredBuckets => widget.filteredBuckets;

  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(defaultBorderColor), width: 1),
          ),
        ),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => CustomDivider(),
          itemCount: filteredBuckets.length,
          itemBuilder: (context, index) => _buildItem(context, filteredBuckets[index]),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, DefaultFilter defaultFilter) {
    return Container(
      color: Colors.white,
      height: 38,
      child: ListTile(
        enabled: !isEditable,
        dense: true,
        onTap: () => _toFilterTaskListScreen(context, defaultFilter),
        leading: Icon(defaultFilter.icon),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(defaultFilter.name),
            AnimatedOpacity(
              opacity: isEditable ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 300),
              child: Text(defaultFilter.count.toString()),
              )
          ],
        ),
        trailing: Icon(Icons.navigate_next),
      ),
    );
  }

  void _toFilterTaskListScreen(BuildContext context, DefaultFilter defaultFilter) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => FilterTaskListScreen(defaultFilter: defaultFilter),
      ),
    );
  }
}
