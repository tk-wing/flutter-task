import 'package:moor/moor.dart';

class BucketRecords extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get iconColor => text()();
  DateTimeColumn get createdAt => dateTime().named('created_at').nullable()();
  DateTimeColumn get updatedAt => dateTime().named('updated_at').nullable()();
}
