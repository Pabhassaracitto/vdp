// lib/features/matrix/matrix_audio_session.dart
//
// VDP 0.10.2 — gom logic "build playlist cho tab Bảng Tương Ứng" vào một
// chỗ, theo đúng khuôn mẫu của `PaticcaAudioSession` (tab Nhân Duyên):
// tái dụng NGUYÊN engine/provider/queue/repeat/karaoke/thanh nghe nổi của
// tab Học (`audioPlayerProvider` + `EntityPlaylistBuilder`), chỉ khác nguồn
// dữ liệu — 121 Tâm (hàng) và 52 Tâm Sở (cột) của Bảng Tương Ứng.
//
// Hai phiên nghe độc lập:
//   • MATRIX_CITTA    — 121 Tâm, đúng thứ tự `orderIndex` như cột trái.
//   • MATRIX_CETASIKA — 52 Tâm Sở, đúng thứ tự `traditionalOrder` như hàng
//                       đầu của bảng (để highlight hàng/cột đang đọc khớp
//                       thứ tự hiển thị).

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/localization/content_catalog.dart';
import '../../core/localization/localized_content.dart';
import '../../l10n/l10n.dart';
import '../../data/models/cetasika_model.dart';
import '../../data/models/citta_model.dart';
import '../../data/repositories/vdp_repository.dart';
import '../audio/data/entity_playlist_builder.dart';
import '../audio/models/audio_track.dart';
import '../audio/providers/audio_player_provider.dart';

/// Trục của phiên nghe Bảng Tương Ứng.
enum MatrixAudioAxis { citta, cetasika }

class MatrixAudioSession {
  const MatrixAudioSession._();

  /// "Module id" giả — chỉ dùng làm khoá phiên nghe/lưu vị trí, không trùng
  /// id StudyModule thật hay session của tab Nhân Duyên.
  static String sessionId(MatrixAudioAxis axis) =>
      axis == MatrixAudioAxis.citta ? 'MATRIX_CITTA' : 'MATRIX_CETASIKA';

  /// Khoá track của 1 Tâm / 1 Tâm Sở — PHẢI khớp [EntityAudioItem.id] bên
  /// dưới để `audio.currentSectionId` nhận diện đúng hàng/cột đang đọc.
  /// Tiền tố `matrixCitta:`/`matrixCetasika:` tách khỏi `citta:`/`cetasika:`
  /// của playlist tab Học để không bao giờ nhầm session.
  static String trackId(MatrixAudioAxis axis, String entityId) =>
      axis == MatrixAudioAxis.citta
          ? 'matrixCitta:$entityId'
          : 'matrixCetasika:$entityId';

  /// Danh sách item đã "dịch sẵn" cho một trục — hàm thuần, test được
  /// (test/matrix_audio_session_test.dart), không cần BuildContext.
  static List<EntityAudioItem> buildCittaItems(
    Iterable<CittaModel> cittas, {
    required String Function(CittaModel citta) nameOf,
    required String Function(CittaModel citta) doctrineOf,
  }) {
    final sorted = List<CittaModel>.from(cittas)
      ..sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
    return [
      for (final c in sorted)
        EntityAudioItem(
          id: trackId(MatrixAudioAxis.citta, c.id),
          title: nameOf(c),
          pali: c.namePali,
          // CittaModel không có mô tả dài — dùng ghi chú giáo lý (có thể
          // rỗng); tên + Pāli vẫn luôn được đọc.
          description: doctrineOf(c),
        ),
    ];
  }

  static List<EntityAudioItem> buildCetasikaItems(
    Iterable<CetasikaModel> cetasikas, {
    required String Function(CetasikaModel cetasika) nameOf,
    required String Function(CetasikaModel cetasika) descriptionOf,
  }) {
    final sorted = List<CetasikaModel>.from(cetasikas)
      ..sort((a, b) => a.traditionalOrder.compareTo(b.traditionalOrder));
    return [
      for (final cs in sorted)
        EntityAudioItem(
          id: trackId(MatrixAudioAxis.cetasika, cs.id),
          title: nameOf(cs),
          pali: cs.namePali,
          description: descriptionOf(cs),
        ),
    ];
  }

  static Future<List<AudioTrack>> _buildTracks(
    BuildContext context,
    WidgetRef ref, {
    required MatrixAudioAxis axis,
  }) {
    if (axis == MatrixAudioAxis.citta) {
      final items = buildCittaItems(
        ref.read(cittasProvider),
        nameOf: (c) => c.localizedName(context),
        doctrineOf: (c) => c.localizedDoctrine(context) ?? '',
      );
      return Future.value(
        EntityPlaylistBuilder.build(
          moduleId: sessionId(axis),
          items: items,
        ),
      );
    }
    final items = buildCetasikaItems(
      ref.read(cetasikasProvider),
      nameOf: (cs) => cs.localizedName(context),
      descriptionOf: (cs) => cs.localizedDescription(context),
    );
    return Future.value(
      EntityPlaylistBuilder.build(
        moduleId: sessionId(axis),
        items: items,
      ),
    );
  }

  /// Nạp playlist (idempotent — `prepareModule` tự so khớp track id trước
  /// khi làm gì, xem audio_player_provider.dart). Không tự phát.
  static Future<void> prepare(
    BuildContext context,
    WidgetRef ref, {
    required MatrixAudioAxis axis,
  }) async {
    final tracks = await _buildTracks(context, ref, axis: axis);
    if (!context.mounted) return;
    await ref.read(audioPlayerProvider.notifier).prepareModule(
          moduleId: sessionId(axis),
          moduleTitle:
              '${context.l10n.navMatrix} · ${axis == MatrixAudioAxis.citta ? context.l10n.citta : context.l10n.cetasika}',
          // contentCatalog được scope ở gốc cây widget (main.dart) — locale
          // của nó chính là ngôn ngữ nội dung của phiên nghe.
          contentLocaleTag: context.contentCatalog.locale,
          tracks: tracks,
          sourceKind: axis == MatrixAudioAxis.citta
              ? AudioSourceKind.matrixCitta
              : AudioSourceKind.matrixCetasika,
        );
  }
}
