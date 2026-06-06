// lib/features/onboarding/onboarding_screen.dart
// Onboarding 3 màn hình - lần đầu khởi động

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/theme/vdp_theme.dart';
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

  final _slides = const [
    _OnboardingSlide(
      icon: '🔆',
      title: 'Thấy Bằng Mắt',
      subtitle: 'Ma Trận Tâm × Tâm Sở',
      body: 'Trực quan hóa 121 Tâm và 52 Tâm Sở trong một ma trận '
          'tương tác. Ba trạng thái phối hợp được mã hóa bằng '
          'màu sắc, hình dạng và chữ để mọi người đều hiểu được.',
      color: Color(0xFF2D6A8F),
      bgSymbols: '✦◎✕✦◎',
    ),
    _OnboardingSlide(
      icon: '🔄',
      title: 'Hiểu Bằng Tim',
      subtitle: 'Dòng Chảy Nhân Duyên',
      body: 'Khám phá 12 Nhân Duyên và 16 loại Nghiệp qua '
          'flowchart tương tác. Kamma Trace — cầu nối N-M '
          'giữa Tâm và Nghiệp — giúp bạn thấy rõ nhân quả.',
      color: Color(0xFF4A2800),
      bgSymbols: '⟳→↗⟳→',
    ),
    _OnboardingSlide(
      icon: '🌟',
      title: 'Tự Mình Khám Phá',
      subtitle: 'Lộ Trình Học Phi Tuyến',
      body: '10 module học theo mạng lưới — bạn tự chọn hướng đi. '
          'Blur/Reveal Active Recall, Quiz 3 cấp, và Smart Hints '
          'giúp bạn ghi nhớ sâu mà không nhàm chán.',
      color: Color(0xFF1A6B3C),
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
    return Scaffold(
      backgroundColor: VdpColors.background,
      body: Stack(
        children: [
          // Page view
          PageView.builder(
            controller: _controller,
            onPageChanged: (i) => setState(() => _page = i),
            itemCount: _slides.length,
            itemBuilder: (_, i) => _SlideView(slide: _slides[i]),
          ),

          // Bottom controls
          Positioned(
            bottom: 0, left: 0, right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
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
                    children: List.generate(_slides.length, (i) {
                      final active = i == _page;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: active ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: active
                              ? _slides[_page].color
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
                      if (_page < _slides.length - 1) ...[
                        Expanded(
                          child: TextButton(
                            onPressed: _finish,
                            child: const Text('Bỏ qua',
                                style: TextStyle(color: Colors.grey)),
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
                              backgroundColor: _slides[_page].color,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Tiếp theo',
                                style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ] else
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _finish,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _slides[_page].color,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text('Bắt đầu khám phá!',
                                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
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
      padding: const EdgeInsets.fromLTRB(28, 80, 28, 160),
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
            width: 110, height: 110,
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
