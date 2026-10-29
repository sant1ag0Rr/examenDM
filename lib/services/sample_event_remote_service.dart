import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../models/sample_event.dart';

class SampleEventRemoteService {
  SampleEventRemoteService({FirebaseFirestore? firestore})
      : _firestore = firestore;

  final FirebaseFirestore? _firestore;
  final Map<String, List<SampleEvent>> _fallbackStore = {};

  FirebaseFirestore? get _firestoreOrNull {
    if (_firestore != null) {
      return _firestore;
    }

    try {
      if (Firebase.apps.isEmpty) {
        return null;
      }
      return FirebaseFirestore.instance;
    } on FirebaseException {
      return null;
    }
  }

  Future<List<SampleEvent>> getEventsForSample(String sampleId) async {
    final firestore = _firestoreOrNull;
    if (firestore == null) {
      return [...?_fallbackStore[sampleId]];
    }

    final snapshot = await firestore
        .collection('sample_events')
        .where('sampleId', isEqualTo: sampleId)
        .get();

    final events = snapshot.docs.map(_fromDocument).toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return events;
  }

  Future<void> saveEvent(SampleEvent event) async {
    final firestore = _firestoreOrNull;
    if (firestore == null) {
      final sampleEvents = [...?_fallbackStore[event.sampleId]];
      final updated = [...sampleEvents, event]
        ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
      _fallbackStore[event.sampleId] = updated;
      return;
    }

    await firestore.collection('sample_events').doc(event.id).set({
      'id': event.id,
      'sampleId': event.sampleId,
      'type': event.type,
      'createdAt': event.createdAt.toUtc(),
    });
  }

  SampleEvent _fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? <String, dynamic>{};
    return SampleEvent(
      id: data['id'] as String,
      sampleId: data['sampleId'] as String,
      type: data['type'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}
