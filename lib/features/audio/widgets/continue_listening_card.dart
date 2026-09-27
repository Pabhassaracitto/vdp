import 'package:flutter/material.dart';

import '../../../data/models/study_module.dart';
import '../../../l10n/l10n.dart';
import '../services/listening_position_store.dart';

/// App-level entry point. It intentionally reads only the small P2 pointer;
/// the detail screen remains responsible for loading content and resuming the
/// exact track/cue from AudioPlayerNotifier.
class ContinueListeningCard extends StatelessWidget {
  const ContinueListeningCard({super.key, required this.modules, required this.onOpen});
  final List<StudyModule> modules;
  final ValueChanged<StudyModule> onOpen;

  @override
  Widget build(BuildContext context) => FutureBuilder<String?>(
    future: SharedPrefsListeningPositionStore.loadLastModuleId(),
    builder: (context, snapshot) {
      final id = snapshot.data;
      if (id == null) return const SizedBox.shrink();
      final matches = modules.where((m) => m.id == id).toList();
      if (matches.isEmpty) return const SizedBox.shrink();
      final module = matches.first;
      return Card(
        margin: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
        child: ListTile(
          leading: const Icon(Icons.headphones_rounded),
          title: Text(context.l10n.continueListening),
          subtitle: Text(module.title),
          trailing: const Icon(Icons.play_arrow_rounded),
          onTap: () => onOpen(module),
        ),
      );
    },
  );
}
