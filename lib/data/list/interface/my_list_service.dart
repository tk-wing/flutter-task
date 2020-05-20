import 'package:flutter_task/data/list/my_list.dart';

abstract class IMyListService {
  List<MyListModel> getLists();
  MyListModel createList();
  MyListModel updateList();
  void deleteList();
}
