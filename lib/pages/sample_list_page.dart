import 'package:flutter/material.dart';

import '../data/sample_seed.dart';
import '../models/sample.dart';
import '../repositories/sample_event_repository.dart';
import '../widgets/sample_card.dart';
import 'sample_detail_page.dart';

class SampleListPage extends StatefulWidget {
  const SampleListPage({super.key});

  @override
  State<SampleListPage> createState() => _SampleListPageState();
}

class _SampleListPageState extends State<SampleListPage> {
  final SampleEventRepository _repository = SampleEventRepository();

  Future<Map<String, String>> _loadStatuses() async {
    final statusMap = <String, String>{};
    for (final sample in sampleSeed) {
      final status = await _repository.getCurrentStatusForSample(sample.id);
      statusMap[sample.id] = status?.displayLabel ?? 'Sin eventos';
    }
    return statusMap;
  }

  void _openDetail(BuildContext context, Sample sample) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => SampleDetailPage(sample: sample),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.biotech_outlined),
            SizedBox(width: 10),
            Text('SampleTrack'),
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<Map<String, String>>(
          future: _loadStatuses(),
          builder: (context, snapshot) {
            final data = snapshot.data ?? const <String, String>{};
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: sampleSeed.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final sample = sampleSeed[index];
                return SampleCard(
                  sample: sample,
                  status: data[sample.id] ?? 'Sin eventos',
                  onTap: () => _openDetail(context, sample),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
