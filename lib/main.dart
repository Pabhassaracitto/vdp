// lib/main.dart
// Entry point - VDP App

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/localization/content_catalog.dart';
import 'core/localization/locale_controller.dart';
import 'core/theme/vdp_theme.dart';
import 'data/repositories/vdp_repository.dart';
import 'l10n/l10n.dart';
import 'features/home/home_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
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
    final localeSettings = ref.watch(localeSettingsProvider);
    final contentCatalogAsync =
        ref.watch(contentCatalogProvider(localeSettings.contentLocale));
    final contentCatalog = contentCatalogAsync.maybeWhen(
      data: (catalog) => catalog,
      orElse: () => localeSettings.contentLocale == 'vi'
          ? ContentCatalog.vietnamese
          : const ContentCatalog(locale: 'en', data: {}),
    );

    final effectiveLocale = localeSettings.uiLocale ??
        resolveSupportedLocale(
          WidgetsBinding.instance.platformDispatcher.locales,
          AppLocalizations.supportedLocales,
        );
    final baseTheme = settings.highContrastMode
        ? VdpTheme.highContrastTheme
        : VdpTheme.lightTheme;

    return MaterialApp(
      onGenerateTitle: (context) => context.l10n.appName,
      debugShowCheckedModeBanner: false,
      locale: localeSettings.uiLocale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeListResolutionCallback: (preferred, supported) =>
          resolveSupportedLocale(preferred, supported),
      theme: VdpTheme.localizedTheme(baseTheme, effectiveLocale),
      builder: (context, child) {
        return ContentCatalogScope(
          catalog: contentCatalog,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.linear(settings.textScaleFactor),
            ),
            child: child!,
          ),
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
  }

  Future<void> _initialize() async {
    try {
      // Timeout 15 giây — tránh treo mãi mãi
      await ref.read(vdpRepositoryProvider.notifier).initialize().timeout(
        const Duration(seconds: 15),
        onTimeout: () {
          // Timeout nhưng vẫn tiếp tục (data rỗng, hiện HomeScreen)
        },
      );
    } catch (e, st) {
      // Bắt MỌI lỗi — không để _showOnboarding = null mãi mãi
      // Vẫn tiếp tục flow bình thường dù lỗi
    }

    // Luôn chạy đến đây dù lỗi hay timeout
    bool needsOb = false;
    try {
      needsOb = await needsOnboarding();
    } catch (e) {
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
            Text(
              context.l10n.appName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: VdpColors.primary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              context.l10n.appTagline,
              style: const TextStyle(
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
            Text(
              context.l10n.initializing,
              style: const TextStyle(
                fontSize: 12,
                color: VdpColors.primaryLight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
