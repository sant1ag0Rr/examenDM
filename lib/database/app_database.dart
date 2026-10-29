import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../models/sample_event.dart';

part 'app_database.g.dart';

class SampleEventTable extends Table {
  TextColumn get id => text()();
  TextColumn get sampleId => text()();
  TextColumn get type => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

@DriftDatabase(tables: [SampleEventTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File('${dbFolder.path}/sample_track.sqlite');
      return NativeDatabase.createInBackground(file);
    });
  }

  @override
  int get schemaVersion => 1;

  Future<List<SampleEvent>> getEventsForSample(String sampleId) async {
    final rows = await (select(sampleEventTable)
          ..where((row) => row.sampleId.equals(sampleId))
          ..orderBy([(row) => OrderingTerm.desc(row.createdAt)]))
        .get();
    return rows.map(_mapRow).toList();
  }

  Future<SampleEvent?> latestEventForSample(String sampleId) async {
    final row = await (select(sampleEventTable)
          ..where((event) => event.sampleId.equals(sampleId))
          ..orderBy([(event) => OrderingTerm.desc(event.createdAt)])
          ..limit(1))
        .getSingleOrNull();
    return row == null ? null : _mapRow(row);
  }

  Future<void> saveEvent(SampleEvent event) async {
    await into(sampleEventTable).insertOnConflictUpdate(
      SampleEventTableCompanion.insert(
        id: event.id,
        sampleId: event.sampleId,
        type: event.type,
        createdAt: event.createdAt,
      ),
    );
  }

  Future<void> saveEvents(List<SampleEvent> events) async {
    for (final event in events) {
      await saveEvent(event);
    }
  }

  SampleEvent _mapRow(SampleEventTableData row) {
    return SampleEvent(
      id: row.id,
      sampleId: row.sampleId,
      type: row.type,
      createdAt: row.createdAt,
    );
  }
}
