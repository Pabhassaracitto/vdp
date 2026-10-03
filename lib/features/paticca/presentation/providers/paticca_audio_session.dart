// lib/features/paticca/presentation/providers/paticca_audio_session.dart
//
// VDP | Audio V1.9.2 §3 (1c-b) — gom logic "build playlist cho tab Nhân
// Duyên" vào một chỗ, dùng chung bởi [PaticcaScreen] (tự chuẩn bị khi mở
// tab/đổi tab con), nút "Nghe toàn bộ", và (tuỳ UI) từng hàng danh sách.
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/content_catalog.dart';
import '../../../../core/localization/localized_content.dart';
import '../../../../l10n/l10n.dart';
import '../../../audio/data/entity_playlist_builder.dart';
import '../../../audio/models/audio_track.dart';
import '../../../audio/providers/audio_player_provider.dart';
import 'paticca_providers.dart';

class PaticcaAudioSession {
  const PaticcaAudioSession._();

  /// "Module id" giả — chỉ dùng làm khoá phiên nghe/lưu vị trí, không phải
  /// StudyModule thật (không trùng id dạng `M1_BASICS`).
  static String sessionId(bool isPaccaya) =>
      isPaccaya ? 'PATICCA_PACCAYA' : 'PATICCA_LIST';

  /// Khoá track của 1 chi/duyên hệ — PHẢI khớp [EntityAudioItem.id] bên dưới
  /// để `audio.currentSectionId` nhận diện đúng hàng đang đọc.
  static String trackId(bool isPaccaya, String entityId) =>
      isPaccaya ? 'paccaya:$entityId' : 'paticca:$entityId';

  static Future<List<AudioTrack>> _buildTracks(
    BuildContext context,
    WidgetRef ref, {
    required bool isPaccaya,
  }) async {
    final sid = sessionId(isPaccaya);
    if (isPaccaya) {
      final list = await ref.read(paccayaListProvider.future);
      return EntityPlaylistBuilder.build(
        moduleId: sid,
        items: [
          for (final p in list)
            EntityAudioItem(
              id: trackId(true, p.id),
              title: p.localizedName(context),
              pali: p.namePali,
              description: p.localizedDefinition(context),
            ),
        ],
      );
    }
    final list = await ref.read(paticcaListProvider.future);
    return EntityPlaylistBuilder.build(
      moduleId: sid,
      items: [
        for (final p in list)
          EntityAudioItem(
            id: trackId(false, p.id),
            title: p.localizedName(context),
            pali: p.namePali,
            description: p.localizedDescription(context),
          ),
      ],
    );
  }

  /// Nạp playlist (idempotent — `prepareModule` tự so khớp track id trước khi
  /// làm gì, xem audio_player_provider.dart). Không tự phát.
  static Future<void> prepare(
    BuildContext context,
    WidgetRef ref, {
    required bool isPaccaya,
  }) async {
    final tracks = await _buildTracks(context, ref, isPaccaya: isPaccaya);
    if (!context.mounted) return;
    await ref.read(audioPlayerProvider.notifier).prepareModule(
          moduleId: sessionId(isPaccaya),
          moduleTitle: isPaccaya
              ? context.l10n.conditionsTabPaccaya
              : context.l10n.conditionsTabLinks,
          contentLocaleTag: context.contentCatalog.locale,
          tracks: tracks,
          sourceKind: isPaccaya
              ? AudioSourceKind.paticcaPaccaya
              : AudioSourceKind.paticcaList,
        );
  }
}
