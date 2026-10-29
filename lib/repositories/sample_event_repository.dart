import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../database/app_database.dart';
import '../models/sample_event.dart';
import '../services/sample_event_remote_service.dart';

class SampleEventRepository {
  SampleEventRepository({
    AppDatabase? database,
    SampleEventRemoteService? remoteService,
  })  : _database = database ?? AppDatabase(),
        _remoteService = remoteService ?? SampleEventRemoteService();

  final AppDatabase _database;
  final SampleEventRemoteService _remoteService;

  Future<List<SampleEvent>> getEventsForSample(String sampleId) async {
    try {
      final remoteEvents = await _remoteService.getEventsForSample(sampleId);
      await _database.saveEvents(remoteEvents);
      return remoteEvents;
    } on FirebaseException catch (error) {
      final localEvents = await _database.getEventsForSample(sampleId);
      if (localEvents.isEmpty) {
        rethrow;
      }
      debugPrint('Firestore read failed; using local cache: $error');
      return localEvents;
    }
  }

  Future<SampleStatus?> getCurrentStatusForSample(String sampleId) async {
    final events = await getEventsForSample(sampleId);
    final latest = SampleStatus.latestStatusForSample(events);
    return latest;
  }

  Future<SampleEvent?> registerNextEventForSample(String sampleId) async {
    final events = await getEventsForSample(sampleId);
    final currentStatus = SampleStatus.latestStatusForSample(events);
    final nextStatus = SampleStatus.nextStatus(currentStatus);

    if (nextStatus == null) {
      return null;
    }

    final event = SampleEvent(
      id: '$sampleId-${DateTime.now().microsecondsSinceEpoch}',
      sampleId: sampleId,
      type: nextStatus.eventType,
      createdAt: DateTime.now().toUtc(),
    );

    await _remoteService.saveEvent(event);
    await _database.saveEvent(event);
    return event;
  }

  Future<void> registerEvent(SampleEvent event) async {
    final currentStatus = SampleStatus.latestStatusForSample(
      await getEventsForSample(event.sampleId),
    );
    final nextStatus = SampleStatus.nextStatus(currentStatus);

    if (currentStatus == null &&
        event.type != SampleStatus.received.eventType) {
      throw StateError('La muestra debe iniciar en RECEIVED.');
    }

    if (currentStatus != null && nextStatus == null) {
      throw StateError('La muestra ya está archivada.');
    }

    if (currentStatus != null && event.type != nextStatus!.eventType) {
      throw StateError(
        'El siguiente estado válido es ${nextStatus.label}.',
      );
    }

    await _remoteService.saveEvent(event);
    await _database.saveEvent(event);
  }
}
