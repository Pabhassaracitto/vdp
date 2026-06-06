// lib/main.dart
// Entry point - VDP App

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/vdp_theme.dart';
import 'data/repositories/vdp_repository.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/home/home_screen.dart';
import 'features/settings/settings_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: VdpApp(),
    ),
  );
}

class VdpApp extends ConsumerWidget {
  const VdpApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);

    return MaterialApp(
      title: 'Vi Diệu Pháp',
      debugShowCheckedModeBanner: false,
      theme: settings.highContrastMode
          ? VdpTheme.highContrastTheme
          : VdpTheme.lightTheme,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.linear(settings.textScaleFactor),
          ),
          child: child!,
        );
      },
      home: const _AppRoot(),
    );
  }
}

class _AppRoot extends ConsumerStatefulWidget {
  const _AppRoot();

  @override
  ConsumerState<_AppRoot> createState() => _AppRootState();
}

class _AppRootState extends ConsumerState<_AppRoot> {
  bool? _showOnboarding;
  String? _initError;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    try {
      // Timeout 15 giây — tránh treo mãi mãi
      await ref.read(vdpRepositoryProvider.notifier).initialize().timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          // Timeout nhưng vẫn tiếp tục (data rỗng, hiện HomeScreen)
          debugPrint('VDP: initialize() timeout sau 15s');
        },
      );
    } catch (e, st) {
      // Bắt MỌI lỗi — không để _showOnboarding = null mãi mãi
      debugPrint('VDP: initialize() lỗi: $e\n$st');
      if (mounted) {
        setState(() => _initError = e.toString());
      }
      // Vẫn tiếp tục flow bình thường dù lỗi
    }

    // Luôn chạy đến đây dù lỗi hay timeout
    bool needsOb = false;
    try {
      needsOb = await needsOnboarding();
    } catch (e) {
      debugPrint('VDP: needsOnboarding() lỗi: $e');
      needsOb = false; // Default: không hiện onboarding
    }

    if (mounted) {
      setState(() => _showOnboarding = needsOb);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Vẫn đang khởi tạo
    if (_showOnboarding == null) {
      return const _SplashScreen();
    }

    // Lỗi nghiêm trọng (hiếm) — vẫn vào HomeScreen, HomeScreen tự hiện error
    if (_showOnboarding!) {
      return const OnboardingScreen();
    }

    return const HomeScreen();
  }
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VdpColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 800),
              curve: Curves.elasticOut,
              builder: (_, v, __) => Transform.scale(
                scale: v,
                child: const Text('☸', style: TextStyle(fontSize: 80)),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Vi Diệu Pháp',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: VdpColors.primary,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Abhidhamma Piṭaka',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: VdpColors.primaryLight,
              ),
            ),
            const SizedBox(height: 48),
            const SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: VdpColors.secondary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Đang khởi tạo…',
              style: TextStyle(fontSize: 12, color: VdpColors.primaryLight),
            ),
          ],
        ),
      ),
    );
  }
}
