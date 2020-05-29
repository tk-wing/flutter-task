import 'dart:io';
import 'package:flutter_task/database/bucket/bucket.dao.dart';
import 'package:flutter_task/database/bucket/bucket.dart';
import 'package:moor/moor.dart';
import 'package:moor_ffi/moor_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'database.g.dart';


@UseMoor(tables: [BucketRecords], daos: [BucketDao])
class MyDataBase extends _$MyDataBase {
  @override
  int get schemaVersion => 1;

  MyDataBase() : super(_openConnection());
}


LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'task.db'));
    return VmDatabase(file);
  });
}
