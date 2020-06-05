import 'package:flutter/material.dart';
import 'package:flutter_task/data/default_filter.dart';
import 'package:flutter_task/view/components/custom_divider.dart';
import 'package:flutter_task/view/styles/style.dart';

class FilterBucketList extends StatefulWidget {
  final List<DefaultFilter> filteredBuckets;
  final VoidCallback onInit;

  const FilterBucketList({
    @required this.filteredBuckets,
    @required this.onInit,
  });

  @override
  _FilterBucketListState createState() => _FilterBucketListState();
}

class _FilterBucketListState extends State<FilterBucketList> {
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
          itemBuilder: (context, index) => _buildItem(filteredBuckets[index]),
        ),
      ),
    );
  }

  Widget _buildItem(DefaultFilter filteredBucket) {
    return Container(
      color: Colors.white,
      height: 38,
      child: ListTile(
        dense: true,
        onTap: () => null,
        leading: Icon(filteredBucket.icon),
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(filteredBucket.name),
              Text(
                filteredBucket.count.toString(),
              )
            ]),
        trailing: Icon(Icons.navigate_next),
      ),
    );
  }
}

// class FilterBucketList extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//                   decoration: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(color: Color(defaultBorderColor), width: 1),
//                     ),
//                   ),
//                   child: ListView.separated(
//                     physics: const NeverScrollableScrollPhysics(),
//                     separatorBuilder: (context, index) => CustomDivider(),
//                     itemCount: defaultFilterBuckets.length,
//                     itemBuilder: (context, index) =>
//                         FilterTile(filter: defaultFilterBuckets[index]),
//                   ),
//                 );
//   }
// }
