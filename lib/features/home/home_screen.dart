// lib/features/home/home_screen.dart
// Màn hình chính với Bottom Navigation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/vdp_theme.dart';
import '../../data/repositories/vdp_repository.dart';
import '../../l10n/l10n.dart';
import '../matrix/matrix_screen.dart';
import '../paticca/presentation/screens/paticca_screen.dart';
import '../settings/settings_screen.dart';
import '../study/study_screen.dart';
import '../vithi/vithi_screen.dart';

final _currentTabProvider = StateProvider<int>((ref) => 0);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _showTimeoutWarning = false;
  Timer? _timeoutTimer;

  @override
  void initState() {
    super.initState();
    _timeoutTimer = Timer(const Duration(seconds: 10), () {
      if (mounted) setState(() => _showTimeoutWarning = true);
    });
  }

  @override
  void dispose() {
    _timeoutTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      _TabItem(
        icon: Icons.grid_view,
        label: context.l10n.navMatrix,
        widget: const MatrixScreen(),
      ),
      _TabItem(
        icon: Icons.school,
        label: context.l10n.navStudy,
        widget: const StudyScreen(),
      ),
      _TabItem(
        icon: Icons.account_tree,
        label: context.l10n.navConditions,
        widget: const PaticcaScreen(),
      ),
      _TabItem(
        icon: Icons.timeline,
        label: context.l10n.navMindProcess,
        widget: const VithiScreen(),
      ),
      _TabItem(
        icon: Icons.settings,
        label: context.l10n.navSettings,
        widget: const SettingsScreen(),
      ),
    ];
    final tab = ref.watch(_currentTabProvider);
    final dataState = ref.watch(vdpRepositoryProvider);
    // M1-T4: Detect HC mode from theme brightness
    final isHC = Theme.of(context).brightness == Brightness.dark;

    if (dataState.status == DataLoadStatus.loading ||
        dataState.status == DataLoadStatus.initial) {
      return _LoadingScreen(showWarning: _showTimeoutWarning);
    }

    if (dataState.status == DataLoadStatus.error) {
      return _ErrorScreen(message: context.l10n.unknownError);
    }

    if (dataState.status == DataLoadStatus.validationFailed) {
      return _ErrorScreen(message: context.l10n.invalidDataDescription);
    }

    return Scaffold(
      body: IndexedStack(
        index: tab,
        children: tabs.map((t) => t.widget).toList(),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) =>
            ref.read(_currentTabProvider.notifier).state = i,
        // M1-T4: HC fix — nền tối trong HC mode, tránh hòa lẫn với nền trắng
        backgroundColor: isHC ? HCColors.surface : VdpColors.surface,
        indicatorColor: VdpColors.primary.withOpacity(0.12),
        destinations: tabs
            .map((t) => NavigationDestination(
                  // M1-T4: HC fix — icon chưa chọn phải rõ trên nền đen
                  icon: Icon(t.icon, color: isHC ? HCColors.textMuted : null),
                  label: t.label,
                  selectedIcon: Icon(t.icon, color: VdpColors.primary),
                ))
            .toList(),
      ),
    );
  }
}

class _TabItem {
  final IconData icon;
  final String label;
  final Widget widget;
  const _TabItem(
      {required this.icon, required this.label, required this.widget});
}

// ─── Loading Screen ───────────────────────────────────────────────────────────

class _LoadingScreen extends StatelessWidget {
  final bool showWarning;
  const _LoadingScreen({this.showWarning = false});

  @override
  Widget build(BuildContext context) {
    final isHC = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isHC ? HCColors.background : VdpColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: VdpColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Text('☸', style: TextStyle(fontSize: 52)),
            ),
            const SizedBox(height: 24),
            Text(
              context.l10n.appName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: VdpColors.primary,
              ),
            ),
            Text(
              context.l10n.appTagline,
              style: const TextStyle(
                fontSize: 14,
                color: VdpColors.primaryLight,
              ),
            ),
            const SizedBox(height: 40),
            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: VdpColors.secondary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              context.l10n.loadingDoctrineData,
              style: TextStyle(
                color: isHC ? HCColors.textSecondary : Colors.grey,
                fontSize: 13,
              ),
            ),
            if (showWarning) ...[
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  context.l10n.loadingTakingLonger,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isHC ? HCColors.textPrimary : Colors.orange.shade700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ─── Error Screen ─────────────────────────────────────────────────────────────

class _ErrorScreen extends StatelessWidget {
  final String message;
  const _ErrorScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    final isHC = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isHC ? HCColors.background : VdpColors.background,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: VdpColors.error, size: 64),
            const SizedBox(height: 20),
            Text(
              context.l10n.invalidData,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: VdpColors.error,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              context.l10n.invalidDataDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isHC ? HCColors.textSecondary : Colors.grey,
                fontSize: 14,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isHC ? HCColors.surface : Colors.red.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isHC ? HCColors.textMuted : Colors.red.shade200,
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 12,
                  color: isHC ? HCColors.textPrimary : Colors.red.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
