// lib/features/paticca/presentation/screens/paticca_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/l10n.dart';
import '../providers/paticca_providers.dart';
import '../widgets/list/paccaya_group_filter_bar.dart';
import '../widgets/list/paccaya_list_view.dart';
import '../widgets/list/paticca_filter_bar.dart';
import '../widgets/list/paticca_list_view.dart';

/// Tab Nhân Duyên — hai phần của Paccaya-saṅgaha-vibhāga:
/// A. Paṭiccasamuppāda naya: 12 chi Duyên khởi.
/// B. Paṭṭhāna naya: 24 Duyên Hệ.
class PaticcaScreen extends ConsumerWidget {
  const PaticcaScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTab =
        ref.watch(paticcaFlowchartStateProvider.select((s) => s.activeTab));
    final notifier = ref.read(paticcaFlowchartStateProvider.notifier);
    final isPaccaya = activeTab == PaticcaViewTab.paccaya;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.conditionsTitle)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            // Cuộn ngang khi nhãn dài ở một số ngôn ngữ — tránh overflow như
            // đã từng gặp ở Bảng Tương Ưng (M1-T1).
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SegmentedButton<PaticcaViewTab>(
                segments: [
                  ButtonSegment(
                    value: PaticcaViewTab.list,
                    label: Text(context.l10n.conditionsTabLinks),
                    icon: const Icon(Icons.link),
                  ),
                  ButtonSegment(
                    value: PaticcaViewTab.paccaya,
                    label: Text(context.l10n.conditionsTabPaccaya),
                    icon: const Icon(Icons.hub),
                  ),
                ],
                selected: {
                  isPaccaya ? PaticcaViewTab.paccaya : PaticcaViewTab.list
                },
                showSelectedIcon: false,
                onSelectionChanged: (selection) =>
                    notifier.switchTab(selection.first),
              ),
            ),
          ),
          if (isPaccaya) const PaccayaFilterBar() else const PaticcaFilterBar(),
          Expanded(
            child: isPaccaya ? const PaccayaListView() : const PaticcaListView(),
          ),
        ],
      ),
    );
  }
}
