// lib/features/home/home_screen.dart
// Màn hình chính với Bottom Navigation

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/vdp_theme.dart';
import '../../data/repositories/vdp_repository.dart';
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

  static const _tabs = [
    _TabItem(icon: Icons.grid_view, label: 'Bảng Tương Ưng', widget: MatrixScreen()),
    _TabItem(icon: Icons.school, label: 'Học Tập', widget: StudyScreen()),
    _TabItem(icon: Icons.account_tree, label: 'Nhân Duyên', widget: PaticcaScreen()),
    _TabItem(icon: Icons.timeline, label: 'Lộ trình Tâm', widget: VithiScreen()),
    _TabItem(icon: Icons.settings, label: 'Cài đặt', widget: SettingsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    final tab = ref.watch(_currentTabProvider);
    final dataState = ref.watch(vdpRepositoryProvider);

    if (dataState.status == DataLoadStatus.loading ||
        dataState.status == DataLoadStatus.initial) {
      return _LoadingScreen(showWarning: _showTimeoutWarning);
    }

    if (dataState.status == DataLoadStatus.error) {
      return _ErrorScreen(message: dataState.errorMessage ?? 'Lỗi không xác định');
    }

    if (dataState.status == DataLoadStatus.validationFailed) {
      return _ErrorScreen(message: dataState.errorMessage ?? 'Lỗi dữ liệu');
    }

    return Scaffold(
      body: IndexedStack(
        index: tab,
        children: _tabs.map((t) => t.widget).toList(),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) =>
            ref.read(_currentTabProvider.notifier).state = i,
        backgroundColor: VdpColors.surface,
        indicatorColor: VdpColors.primary.withOpacity(0.12),
        destinations: _tabs
            .map((t) => NavigationDestination(
                  icon: Icon(t.icon),
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
    return Scaffold(
      backgroundColor: VdpColors.background,
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
            const Text(
              'Vi Diệu Pháp',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: VdpColors.primary,
              ),
            ),
            const Text(
              'Abhidhamma',
              style: TextStyle(fontSize: 14, color: VdpColors.primaryLight),
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
            const Text(
              'Đang tải và kiểm tra dữ liệu giáo lý…',
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            if (showWarning) ...[
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Quá trình khởi động đang mất nhiều thời gian hơn dự kiến. '
                  'Có thể do dữ liệu giáo lý đang được tối ưu hóa cho thiết bị của bạn.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.orange.shade700, fontSize: 12),
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
    return Scaffold(
      backgroundColor: VdpColors.background,
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: VdpColors.error, size: 64),
            const SizedBox(height: 20),
            const Text(
              'Dữ liệu không hợp lệ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: VdpColors.error,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Hệ thống phát hiện vi phạm quy tắc giáo lý.\n'
              'Vui lòng liên hệ đội biên soạn để kiểm tra lại dữ liệu.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.6),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Text(
                message,
                style: TextStyle(fontSize: 12, color: Colors.red.shade800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
