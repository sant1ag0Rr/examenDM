enum SampleStatus {
  received,
  prepared,
  inAnalysis,
  validated,
  archived;

  String get eventType => name.toUpperCase();

  String get label => switch (this) {
        SampleStatus.received => 'RECEIVED',
        SampleStatus.prepared => 'PREPARED',
        SampleStatus.inAnalysis => 'IN_ANALYSIS',
        SampleStatus.validated => 'VALIDATED',
        SampleStatus.archived => 'ARCHIVED',
      };

  String get displayLabel => switch (this) {
        SampleStatus.received => 'Recibida',
        SampleStatus.prepared => 'Preparada',
        SampleStatus.inAnalysis => 'En análisis',
        SampleStatus.validated => 'Validada',
        SampleStatus.archived => 'Archivada',
      };

  static SampleStatus? fromEventType(String value) {
    final normalized = value.trim().toUpperCase();
    for (final status in SampleStatus.values) {
      if (status.eventType == normalized) {
        return status;
      }
    }
    return null;
  }

  static SampleStatus? nextStatus(SampleStatus? current) {
    if (current == null) {
      return SampleStatus.received;
    }
    final nextIndex = SampleStatus.values.indexOf(current) + 1;
    if (nextIndex >= SampleStatus.values.length) {
      return null;
    }
    return SampleStatus.values[nextIndex];
  }

  static SampleStatus? latestStatusForSample(List<SampleEvent> events) {
    if (events.isEmpty) {
      return null;
    }

    final ordered = [...events]
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return fromEventType(ordered.first.type);
  }
}

class SampleEvent {
  const SampleEvent({
    required this.id,
    required this.sampleId,
    required this.type,
    required this.createdAt,
  });

  final String id;
  final String sampleId;
  final String type;
  final DateTime createdAt;

  Map<String, dynamic> toMap() => {
        'id': id,
        'sampleId': sampleId,
        'type': type,
        'createdAt': createdAt.toIso8601String(),
      };

  factory SampleEvent.fromMap(Map<String, dynamic> map) {
    return SampleEvent(
      id: map['id'] as String,
      sampleId: map['sampleId'] as String,
      type: map['type'] as String,
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}
