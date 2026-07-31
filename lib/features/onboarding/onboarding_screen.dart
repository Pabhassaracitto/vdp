// lib/features/onboarding/onboarding_screen.dart
// Onboarding 3 màn hình - lần đầu khởi động

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/vdp_theme.dart';
import '../../l10n/l10n.dart';
import '../home/home_screen.dart';

const _kOnboardingDone = 'vdp_onboarding_done';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  List<_OnboardingSlide> _localizedSlides(BuildContext context) => [
        _OnboardingSlide(
          icon: '🔆',
          title: context.l10n.onboardingVisualTitle,
          subtitle: context.l10n.onboardingVisualSubtitle,
          body: context.l10n.onboardingVisualBody,
          color: const Color(0xFF2D6A8F),
          bgSymbols: '✦◎✕✦◎',
        ),
        _OnboardingSlide(
          icon: '🔄',
          title: context.l10n.onboardingCausalityTitle,
          subtitle: context.l10n.onboardingCausalitySubtitle,
          body: context.l10n.onboardingCausalityBody,
          color: const Color(0xFF4A2800),
          bgSymbols: '⟳→↗⟳→',
        ),
        _OnboardingSlide(
          icon: '🌟',
          title: context.l10n.onboardingExploreTitle,
          subtitle: context.l10n.onboardingExploreSubtitle,
          body: context.l10n.onboardingExploreBody,
          color: const Color(0xFF1A6B3C),
          bgSymbols: '🌱🌿🌳',
        ),
      ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final slides = _localizedSlides(context);
    return Scaffold(
      backgroundColor: VdpColors.background,
      body: Stack(
        children: [
          // Page view
          PageView.builder(
            controller: _controller,
            onPageChanged: (i) => setState(() => _page = i),
            itemCount: slides.length,
            itemBuilder: (_, i) => _SlideView(slide: slides[i]),
          ),

          // Bottom controls
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 40),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(slides.length, (i) {
                      final active = i == _page;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: active ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: active
                              ? slides[_page].color
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),

                  // Action buttons
                  Row(
                    children: [
                      if (_page < slides.length - 1) ...[
                        Expanded(
                          child: TextButton(
                            onPressed: _finish,
                            child: Text(context.l10n.skip,
                                style: const TextStyle(color: Colors.grey)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () => _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: slides[_page].color,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(context.l10n.next,
                                style: const TextStyle(fontSize: 16)),
                          ),
                        ),
                      ] else
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _finish,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: slides[_page].color,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(context.l10n.beginExploring,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _finish() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kOnboardingDone, true);
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }
}

class _OnboardingSlide {
  final String icon;
  final String title;
  final String subtitle;
  final String body;
  final Color color;
  final String bgSymbols;

  const _OnboardingSlide({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.color,
    required this.bgSymbols,
  });
}

class _SlideView extends StatelessWidget {
  final _OnboardingSlide slide;
  const _SlideView({required this.slide});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(28, 80, 28, 160),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Background symbol decoration
          Text(
            slide.bgSymbols,
            style: TextStyle(
              fontSize: 40,
              color: slide.color.withOpacity(0.08),
              letterSpacing: 12,
            ),
          ),
          const SizedBox(height: 24),

          // Main icon
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: slide.color.withOpacity(0.12),
              shape: BoxShape.circle,
              border: Border.all(color: slide.color.withOpacity(0.3), width: 2),
            ),
            alignment: Alignment.center,
            child: Text(slide.icon, style: const TextStyle(fontSize: 52)),
          ),
          const SizedBox(height: 32),

          // Title
          Text(
            slide.title,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: slide.color,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 8),

          // Subtitle
          Text(
            slide.subtitle,
            style: TextStyle(
              fontSize: 15,
              color: slide.color.withOpacity(0.7),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),

          // Body
          Text(
            slide.body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              height: 1.7,
              color: Color(0xFF3A3A3A),
            ),
          ),
        ],
      ),
    );
  }
}

/// Kiểm tra xem có cần hiển thị onboarding không
Future<bool> needsOnboarding() async {
  final prefs = await SharedPreferences.getInstance();
  return !(prefs.getBool(_kOnboardingDone) ?? false);
}
