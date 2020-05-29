// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class BucketRecord extends DataClass implements Insertable<BucketRecord> {
  final int id;
  final String name;
  final String iconColor;
  final DateTime createdAt;
  final DateTime updatedAt;
  BucketRecord(
      {@required this.id,
      @required this.name,
      @required this.iconColor,
      this.createdAt,
      this.updatedAt});
  factory BucketRecord.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return BucketRecord(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      iconColor: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}icon_color']),
      createdAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at']),
      updatedAt: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || iconColor != null) {
      map['icon_color'] = Variable<String>(iconColor);
    }
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  BucketRecordsCompanion toCompanion(bool nullToAbsent) {
    return BucketRecordsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      iconColor: iconColor == null && nullToAbsent
          ? const Value.absent()
          : Value(iconColor),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory BucketRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BucketRecord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      iconColor: serializer.fromJson<String>(json['iconColor']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'iconColor': serializer.toJson<String>(iconColor),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  BucketRecord copyWith(
          {int id,
          String name,
          String iconColor,
          DateTime createdAt,
          DateTime updatedAt}) =>
      BucketRecord(
        id: id ?? this.id,
        name: name ?? this.name,
        iconColor: iconColor ?? this.iconColor,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('BucketRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('iconColor: $iconColor, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(iconColor.hashCode,
              $mrjc(createdAt.hashCode, updatedAt.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is BucketRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.iconColor == this.iconColor &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BucketRecordsCompanion extends UpdateCompanion<BucketRecord> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> iconColor;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BucketRecordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.iconColor = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BucketRecordsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required String iconColor,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        iconColor = Value(iconColor);
  static Insertable<BucketRecord> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> iconColor,
    Expression<DateTime> createdAt,
    Expression<DateTime> updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (iconColor != null) 'icon_color': iconColor,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BucketRecordsCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> iconColor,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt}) {
    return BucketRecordsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      iconColor: iconColor ?? this.iconColor,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (iconColor.present) {
      map['icon_color'] = Variable<String>(iconColor.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }
}

class $BucketRecordsTable extends BucketRecords
    with TableInfo<$BucketRecordsTable, BucketRecord> {
  final GeneratedDatabase _db;
  final String _alias;
  $BucketRecordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _iconColorMeta = const VerificationMeta('iconColor');
  GeneratedTextColumn _iconColor;
  @override
  GeneratedTextColumn get iconColor => _iconColor ??= _constructIconColor();
  GeneratedTextColumn _constructIconColor() {
    return GeneratedTextColumn(
      'icon_color',
      $tableName,
      false,
    );
  }

  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  GeneratedDateTimeColumn _createdAt;
  @override
  GeneratedDateTimeColumn get createdAt => _createdAt ??= _constructCreatedAt();
  GeneratedDateTimeColumn _constructCreatedAt() {
    return GeneratedDateTimeColumn(
      'created_at',
      $tableName,
      true,
    );
  }

  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  GeneratedDateTimeColumn _updatedAt;
  @override
  GeneratedDateTimeColumn get updatedAt => _updatedAt ??= _constructUpdatedAt();
  GeneratedDateTimeColumn _constructUpdatedAt() {
    return GeneratedDateTimeColumn(
      'updated_at',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, iconColor, createdAt, updatedAt];
  @override
  $BucketRecordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'bucket_records';
  @override
  final String actualTableName = 'bucket_records';
  @override
  VerificationContext validateIntegrity(Insertable<BucketRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon_color')) {
      context.handle(_iconColorMeta,
          iconColor.isAcceptableOrUnknown(data['icon_color'], _iconColorMeta));
    } else if (isInserting) {
      context.missing(_iconColorMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at'], _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at'], _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BucketRecord map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return BucketRecord.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $BucketRecordsTable createAlias(String alias) {
    return $BucketRecordsTable(_db, alias);
  }
}

abstract class _$MyDataBase extends GeneratedDatabase {
  _$MyDataBase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $BucketRecordsTable _bucketRecords;
  $BucketRecordsTable get bucketRecords =>
      _bucketRecords ??= $BucketRecordsTable(this);
  BucketDao _bucketDao;
  BucketDao get bucketDao => _bucketDao ??= BucketDao(this as MyDataBase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [bucketRecords];
}
