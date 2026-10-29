// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $SampleEventTableTable extends SampleEventTable
    with TableInfo<$SampleEventTableTable, SampleEventTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SampleEventTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sampleIdMeta =
      const VerificationMeta('sampleId');
  @override
  late final GeneratedColumn<String> sampleId = GeneratedColumn<String>(
      'sample_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, sampleId, type, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sample_event_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<SampleEventTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('sample_id')) {
      context.handle(_sampleIdMeta,
          sampleId.isAcceptableOrUnknown(data['sample_id']!, _sampleIdMeta));
    } else if (isInserting) {
      context.missing(_sampleIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SampleEventTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SampleEventTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sampleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sample_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $SampleEventTableTable createAlias(String alias) {
    return $SampleEventTableTable(attachedDatabase, alias);
  }
}

class SampleEventTableData extends DataClass
    implements Insertable<SampleEventTableData> {
  final String id;
  final String sampleId;
  final String type;
  final DateTime createdAt;
  const SampleEventTableData(
      {required this.id,
      required this.sampleId,
      required this.type,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['sample_id'] = Variable<String>(sampleId);
    map['type'] = Variable<String>(type);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  SampleEventTableCompanion toCompanion(bool nullToAbsent) {
    return SampleEventTableCompanion(
      id: Value(id),
      sampleId: Value(sampleId),
      type: Value(type),
      createdAt: Value(createdAt),
    );
  }

  factory SampleEventTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SampleEventTableData(
      id: serializer.fromJson<String>(json['id']),
      sampleId: serializer.fromJson<String>(json['sampleId']),
      type: serializer.fromJson<String>(json['type']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sampleId': serializer.toJson<String>(sampleId),
      'type': serializer.toJson<String>(type),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  SampleEventTableData copyWith(
          {String? id, String? sampleId, String? type, DateTime? createdAt}) =>
      SampleEventTableData(
        id: id ?? this.id,
        sampleId: sampleId ?? this.sampleId,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
      );
  SampleEventTableData copyWithCompanion(SampleEventTableCompanion data) {
    return SampleEventTableData(
      id: data.id.present ? data.id.value : this.id,
      sampleId: data.sampleId.present ? data.sampleId.value : this.sampleId,
      type: data.type.present ? data.type.value : this.type,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SampleEventTableData(')
          ..write('id: $id, ')
          ..write('sampleId: $sampleId, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, sampleId, type, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SampleEventTableData &&
          other.id == this.id &&
          other.sampleId == this.sampleId &&
          other.type == this.type &&
          other.createdAt == this.createdAt);
}

class SampleEventTableCompanion extends UpdateCompanion<SampleEventTableData> {
  final Value<String> id;
  final Value<String> sampleId;
  final Value<String> type;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const SampleEventTableCompanion({
    this.id = const Value.absent(),
    this.sampleId = const Value.absent(),
    this.type = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SampleEventTableCompanion.insert({
    required String id,
    required String sampleId,
    required String type,
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sampleId = Value(sampleId),
        type = Value(type),
        createdAt = Value(createdAt);
  static Insertable<SampleEventTableData> custom({
    Expression<String>? id,
    Expression<String>? sampleId,
    Expression<String>? type,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sampleId != null) 'sample_id': sampleId,
      if (type != null) 'type': type,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SampleEventTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? sampleId,
      Value<String>? type,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return SampleEventTableCompanion(
      id: id ?? this.id,
      sampleId: sampleId ?? this.sampleId,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sampleId.present) {
      map['sample_id'] = Variable<String>(sampleId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SampleEventTableCompanion(')
          ..write('id: $id, ')
          ..write('sampleId: $sampleId, ')
          ..write('type: $type, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SampleEventTableTable sampleEventTable =
      $SampleEventTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sampleEventTable];
}

typedef $$SampleEventTableTableCreateCompanionBuilder
    = SampleEventTableCompanion Function({
  required String id,
  required String sampleId,
  required String type,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$SampleEventTableTableUpdateCompanionBuilder
    = SampleEventTableCompanion Function({
  Value<String> id,
  Value<String> sampleId,
  Value<String> type,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$SampleEventTableTableFilterComposer
    extends Composer<_$AppDatabase, $SampleEventTableTable> {
  $$SampleEventTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sampleId => $composableBuilder(
      column: $table.sampleId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$SampleEventTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SampleEventTableTable> {
  $$SampleEventTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sampleId => $composableBuilder(
      column: $table.sampleId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$SampleEventTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SampleEventTableTable> {
  $$SampleEventTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sampleId =>
      $composableBuilder(column: $table.sampleId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$SampleEventTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SampleEventTableTable,
    SampleEventTableData,
    $$SampleEventTableTableFilterComposer,
    $$SampleEventTableTableOrderingComposer,
    $$SampleEventTableTableAnnotationComposer,
    $$SampleEventTableTableCreateCompanionBuilder,
    $$SampleEventTableTableUpdateCompanionBuilder,
    (
      SampleEventTableData,
      BaseReferences<_$AppDatabase, $SampleEventTableTable,
          SampleEventTableData>
    ),
    SampleEventTableData,
    PrefetchHooks Function()> {
  $$SampleEventTableTableTableManager(
      _$AppDatabase db, $SampleEventTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SampleEventTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SampleEventTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SampleEventTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> sampleId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SampleEventTableCompanion(
            id: id,
            sampleId: sampleId,
            type: type,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String sampleId,
            required String type,
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              SampleEventTableCompanion.insert(
            id: id,
            sampleId: sampleId,
            type: type,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SampleEventTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SampleEventTableTable,
    SampleEventTableData,
    $$SampleEventTableTableFilterComposer,
    $$SampleEventTableTableOrderingComposer,
    $$SampleEventTableTableAnnotationComposer,
    $$SampleEventTableTableCreateCompanionBuilder,
    $$SampleEventTableTableUpdateCompanionBuilder,
    (
      SampleEventTableData,
      BaseReferences<_$AppDatabase, $SampleEventTableTable,
          SampleEventTableData>
    ),
    SampleEventTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SampleEventTableTableTableManager get sampleEventTable =>
      $$SampleEventTableTableTableManager(_db, _db.sampleEventTable);
}
