// test/global_audio_bubble_web_test.dart
//
// VDP | Issue Web — hồi quy cho bug desktop-web của thanh nghe nổi toàn app
// (GlobalAudioBubble):
//   1. Tooltip ở 2 đầu thanh nằm NGOÀI Navigator (không có Overlay ancestor)
//      → hover chuột trên web ném exception / treo input app. Fix: dỡ sạch
//      Tooltip khỏi bubble (giữ Semantics). Test này hover bằng chuột qua
//      từng nút ở 2 đầu thanh và kỳ vọng không exception — cùng một cơ chế
//      với bug thật (trước fix, bơm chuột lên nút play/pause sẽ ném lỗi sau
//      waitDuration của Tooltip).
//   2. Bubble (ngoài Navigator nên không được Scaffold bảo vệ) đè vùng bấm
//      của NavigationBar 5 tab → không đổi được tab. Fix (Cách A): khi route
//      đáy (HomeScreen) đang ở trên cùng, bubble nâng đáy lên trên cả chiều
//      cao NavigationBar. Test hit-test tap vào tâm từng NavigationDestination
//      khi bubble đang hiển thị → phải đổi tab thành công.
//
// Fakes (FakeTrackPlayer/InMemoryStore) theo mẫu test/audio_player_test.dart.

import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/core/localization/content_catalog.dart';
import 'package:vdp_app/core/navigation/app_navigator.dart';
import 'package:vdp_app/data/models/lesson_content.dart';
import 'package:vdp_app/features/audio/data/playlist_builder.dart';
import 'package:vdp_app/features/audio/models/audio_track.dart';
import 'package:vdp_app/features/audio/players/track_player.dart';
import 'package:vdp_app/features/audio/providers/audio_player_provider.dart';
import 'package:vdp_app/features/audio/services/listening_position_store.dart';
import 'package:vdp_app/features/audio/widgets/global_audio_bubble.dart';
import 'package:vdp_app/features/home/home_tab_index.dart';
import 'package:vdp_app/l10n/l10n.dart';

// ─── Fakes (mẫu: test/audio_player_test.dart) ────────────────────────────────

class FakeTrackPlayer implements TrackPlayer {
  final StreamController<TrackPlayerEvent> _controller =
      StreamController<TrackPlayerEvent>.broadcast();

  @override
  Stream<TrackPlayerEvent> get events => _controller.stream;

  @override
  Future<void> load({
    required List<AudioCue> cues,
    required String contentLocaleTag,
  }) async {}

  @override
  Future<void> play() async {}

  @override
  Future<void> pause() async {}

  @override
  Future<void> stop() async {}

  @override
  Future<void> setSpeed(double speed) async {}

  @override
  Future<void> seekCue(int cueIndex) async {}

  @override
  Future<void> dispose() async {}
}

class InMemoryStore implements ListeningPositionStore {
  @override
  Future<double?> loadSpeed() async => null;

  @override
  Future<void> saveSpeed(double speed) async {}

  @override
  Future<String?> loadRepeatMode() async => null;

  @override
  Future<void> saveRepeatMode(String mode) async {}

  @override
  Future<ListeningPosition?> loadPosition(String moduleId) async => null;

  @override
  Future<void> savePosition(
    String moduleId,
    ListeningPosition position,
  ) async {}
}

LessonSection _section(String id) => LessonSection(
      id: id,
      title: 'Tiêu đề $id',
      summary: 'Tóm tắt $id',
      body: const ['Đoạn một.', 'Đoạn hai.'],
      keyTerms: const [],
      sourceRefs: const [],
    );

List<AudioTrack> _tracks(int count, {String moduleId = 'M1_BASICS'}) =>
    PlaylistBuilder.build(
      moduleId: moduleId,
      sections:
          List.generate(count, (i) => _section('M1_S0${i + 1}')).toList(),
    );

// ─── Harness: đúng cấu trúc MaterialApp.builder của main.dart ────────────────

/// Shell già mô phỏng HomeScreen: Scaffold + IndexedStack + NavigationBar 5
/// điểm đến điều khiển bởi [homeTabIndexProvider], và đồng bộ "route đáy đang
/// ở trên cùng" bằng đúng mixin [HomeTabsVisibilitySync] mà HomeScreen dùng —
/// nhờ đó test đi qua chính cơ chế RouteObserver của fix.
class _TestHomeShell extends ConsumerStatefulWidget {
  const _TestHomeShell();

  @override
  ConsumerState<_TestHomeShell> createState() => _TestHomeShellState();
}

class _TestHomeShellState extends ConsumerState<_TestHomeShell>
    with RouteAware, HomeTabsVisibilitySync {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    syncHomeTabsVisibility();
  }

  @override
  void dispose() {
    unsyncHomeTabsVisibility();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tab = ref.watch(homeTabIndexProvider);
    final l10n = context.l10n;
    final labels = [
      l10n.navMatrix,
      l10n.navStudy,
      l10n.navConditions,
      l10n.navMindProcess,
      l10n.navSettings,
    ];
    return Scaffold(
      body: IndexedStack(
        index: tab,
        children: [
          for (var i = 0; i < labels.length; i++) Center(child: Text('tab$i')),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (i) =>
            ref.read(homeTabIndexProvider.notifier).state = i,
        destinations: [
          for (final label in labels)
            NavigationDestination(icon: const Icon(Icons.circle), label: label),
        ],
      ),
    );
  }
}

/// Sao chép kết cấu `builder` của main.dart: GlobalAudioBubble nổi TRÊN
/// Navigator, trong một Stack Positioned.fill > Align(bottomCenter).
Widget _buildApp() {
  return MaterialApp(
    navigatorKey: rootNavigatorKey,
    debugShowCheckedModeBanner: false,
    locale: const Locale('vi'),
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    navigatorObservers: [rootRouteObserver],
    builder: (context, child) {
      return ContentCatalogScope(
        catalog: ContentCatalog.vietnamese,
        child: Stack(
          children: [
            child!,
            const Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GlobalAudioBubble(),
              ),
            ),
          ],
        ),
      );
    },
    home: const _TestHomeShell(),
  );
}

void main() {
  late FakeTrackPlayer player;
  late AudioPlayerNotifier notifier;
  late ProviderContainer container;

  setUp(() async {
    player = FakeTrackPlayer();
    notifier = AudioPlayerNotifier(player: player, store: InMemoryStore());
    // Phiên nghe giả — nguồn Bảng Tương Ưng (đúng tab bug report đề cập).
    await notifier.prepareModule(
      moduleId: 'M1_BASICS',
      moduleTitle: 'Biến hành',
      contentLocaleTag: 'vi',
      tracks: _tracks(3),
      sourceKind: AudioSourceKind.matrixCitta,
    );
    container = ProviderContainer(overrides: [
      audioPlayerProvider.overrideWith((ref) => notifier),
    ]);
  });

  tearDown(() {
    container.dispose();
  });

  Future<void> pumpApp(WidgetTester tester) async {
    await tester.pumpWidget(
      UncontrolledProviderScope(container: container, child: _buildApp()),
    );
    // 2 nhịp: frame đầu dựng route; nhịp sau để HomeShell kịp ghi
    // homeTabsVisibleProvider và bubble rebuild theo.
    await tester.pump(const Duration(milliseconds: 100));
    await tester.pump(const Duration(milliseconds: 100));
  }

  Offset barBottom(WidgetTester tester) =>
      tester.getBottomLeft(find.byKey(kGlobalAudioBubbleBarKey));

  Offset navBarTop(WidgetTester tester) =>
      tester.getTopLeft(find.byType(NavigationBar));

  testWidgets(
    'hover chuột qua 2 đầu thanh nghe không ném exception '
    '(tooltip overlay ngoài Navigator đã bị dỡ)',
    (tester) async {
      await pumpApp(tester);
      expect(find.byKey(kGlobalAudioBubbleBarKey), findsOneWidget);

      // Không còn Tooltip nào khả dĩ bên dưới bubble — khử hẳn con đường
      // overlay ngoài Navigator thay vì vá từng nút.
      expect(
        find.descendant(
          of: find.byKey(kGlobalAudioBubbleBarKey),
          matching: find.byType(Tooltip),
        ),
        findsNothing,
      );

      final gesture =
          await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer();

      // Đầu trái: nút play/pause (trước đây có tooltip trong IconButton.filled).
      await gesture.moveTo(tester.getCenter(
        find.byIcon(Icons.play_arrow_rounded),
      ));
      await tester.pump(const Duration(milliseconds: 400));

      // Đầu phải: nút Ẩn rồi nút Đóng (trước đây bọc Tooltip).
      await gesture.moveTo(tester.getCenter(
        find.byIcon(Icons.keyboard_arrow_down_rounded),
      ));
      await tester.pump(const Duration(milliseconds: 400));
      await gesture.moveTo(tester.getCenter(find.byIcon(Icons.close_rounded)));
      await tester.pump(const Duration(milliseconds: 400));

      // Giữa thanh — control của bug report: vùng vốn đã ổn.
      await gesture.moveTo(tester.getCenter(
        find.byKey(kGlobalAudioBubbleBarKey),
      ));
      await tester.pump(const Duration(milliseconds: 400));

      expect(tester.takeException(), isNull);
      await gesture.removePointer();
    },
  );

  testWidgets(
    'bubble nâng khỏi NavigationBar khi HomeScreen hiển thị; '
    'tap tâm từng tab đều đổi tab thành công (không bị bubble chặn)',
    (tester) async {
      // Cửa sổ thấp kiểu laptop theo yêu cầu issue (1366x625).
      tester.view.physicalSize = const Size(1366, 625);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await pumpApp(tester);
      expect(find.byKey(kGlobalAudioBubbleBarKey), findsOneWidget);

      // Ràng buộc hình học bắt buộc của fix: đáy bubble không bao giờ nằm
      // trong vùng bấm của NavigationBar.
      expect(
        barBottom(tester).dy,
        lessThanOrEqualTo(navBarTop(tester).dy),
        reason: 'đáy bubble phải nằm TRÊN đỉnh NavigationBar',
      );

      // Hit-test thật: tap vào tâm từng NavigationDestination khi bubble đang
      // hiển thị → phải đổi tab được (trước fix, bubble chặn vùng này).
      final destinations = find.byType(NavigationDestination);
      expect(destinations, findsNWidgets(5));
      for (var i = 0; i < 5; i++) {
        await tester.tapAt(tester.getCenter(destinations.at(i)));
        await tester.pump(const Duration(milliseconds: 200));
        expect(
          container.read(homeTabIndexProvider),
          i,
          reason: 'tap vào tab thứ $i phải đổi tab thành công',
        );
        // Bubble vẫn nằm ngoài vùng bấm của các tab mọi lúc.
        expect(barBottom(tester).dy, lessThanOrEqualTo(navBarTop(tester).dy));
      }
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'route đẩy lên: bubble neo đáy như cũ; tap vào thanh (phiên Matrix) '
    'pop về gốc và chọn tab Matrix',
    (tester) async {
      await pumpApp(tester);

      // Đang ở tab khác 0 để chứng minh _goToSource đưa về đúng tab Matrix.
      container.read(homeTabIndexProvider.notifier).state = 3;
      await tester.pump(const Duration(milliseconds: 100));

      unawaited(
        rootNavigatorKey.currentState!.push(
          MaterialPageRoute<void>(
            builder: (_) => const Scaffold(body: Text('detail')),
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 300));
      await tester.pump(const Duration(milliseconds: 300));

      // Route đáy bị che → tab "không hiển thị" → bubble neo đáy 10px như cũ
      // (màn đẩy lên không có NavigationBar, giữ hành vi mobile).
      expect(container.read(homeTabsVisibleProvider), isFalse);
      final screenHeight = tester.view.physicalSize.height;
      expect(
        barBottom(tester).dy,
        closeTo(screenHeight - kAudioBubbleBottomMargin, 0.5),
        reason: 'trên route đẩy lên, đáy bubble = đáy màn hình - margin',
      );

      // Tap-to-source vẫn chủ đích & đúng cho phiên Matrix: về tab 0, pop
      // mọi màn hình chồng lên (home_tab_index.dart + popUntil như thiết kế).
      await tester.tap(find.byKey(kGlobalAudioBubbleBarKey));
      await tester.pump(const Duration(milliseconds: 300));
      await tester.pump(const Duration(milliseconds: 300));

      expect(container.read(homeTabIndexProvider), kHomeTabMatrix);
      expect(rootNavigatorKey.currentState!.canPop(), isFalse);
      // Về lại route đáy → NavigationBar hiển thị → bubble nâng lên trở lại.
      expect(container.read(homeTabsVisibleProvider), isTrue);
      expect(barBottom(tester).dy, lessThanOrEqualTo(navBarTop(tester).dy));
      expect(tester.takeException(), isNull);
    },
  );

  testWidgets(
    'dạng Ẩn: restore handle cũng nằm trên NavigationBar, không Tooltip, '
    'hover không exception và bấm hiện lại thanh được',
    (tester) async {
      await pumpApp(tester);

      // Ẩn thanh → dạng nút tròn ở góc.
      await tester.tap(find.byIcon(Icons.keyboard_arrow_down_rounded));
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.byKey(kGlobalAudioBubbleRestoreKey), findsOneWidget);
      expect(find.byKey(kGlobalAudioBubbleBarKey), findsNothing);
      expect(
        find.descendant(
          of: find.byKey(kGlobalAudioBubbleRestoreKey),
          matching: find.byType(Tooltip),
        ),
        findsNothing,
      );

      // Handle (neo góc dưới-phải) cũng không được đè vùng bấm của các tab.
      expect(
        tester.getBottomLeft(find.byKey(kGlobalAudioBubbleRestoreKey)).dy,
        lessThanOrEqualTo(navBarTop(tester).dy),
      );

      // Hover handle bằng chuột — trước fix handle cũng có Tooltip ngoài
      // Navigator (và neo đúng góc mà bug report gặp lỗi).
      final gesture =
          await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer();
      await gesture.moveTo(tester.getCenter(
        find.byKey(kGlobalAudioBubbleRestoreKey),
      ));
      await tester.pump(const Duration(milliseconds: 400));
      expect(tester.takeException(), isNull);

      // Bấm handle → hiện lại thanh đầy đủ.
      await tester.tap(find.byKey(kGlobalAudioBubbleRestoreKey));
      await tester.pump(const Duration(milliseconds: 200));
      expect(find.byKey(kGlobalAudioBubbleBarKey), findsOneWidget);
      expect(barBottom(tester).dy, lessThanOrEqualTo(navBarTop(tester).dy));

      expect(tester.takeException(), isNull);
      await gesture.removePointer();
    },
  );
}
