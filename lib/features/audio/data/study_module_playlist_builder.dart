// lib/features/audio/data/study_module_playlist_builder.dart
// Shared builder for ModuleDetailScreen + FullPlayerSheet/GlobalAudioBubble
// Phương án nhẹ: tái dùng cùng logic _buildStudyTracks để “Bài kế/trước”
// có thể dựng playlist cho module kế mà không duplicate code.

import 'package:flutter/material.dart';

import '../../../core/localization/localized_content.dart';
import '../../../data/models/cetasika_model.dart';
import '../../../data/models/citta_model.dart';
import '../../../data/models/kamma_model.dart';
import '../../../data/models/lesson_content.dart';
import '../../../data/models/paticca_model.dart';
import '../../../data/models/rupa_model.dart';
import '../../../data/models/study_module.dart';
import '../../../data/models/vithi_model.dart';
import '../../../data/repositories/vdp_repository.dart';
import '../../audio/data/entity_playlist_builder.dart';
import '../../audio/data/playlist_builder.dart';
import '../../audio/models/audio_track.dart';

/// Ghép playlist đầy đủ cho một StudyModule — cùng logic với
/// `_buildStudyTracks` trong `module_detail_screen.dart` (V1.9.2 §3 — 1c).
List<AudioTrack> buildStudyModuleTracks(
  BuildContext context, {
  required StudyModule module,
  required VdpRepositoryState dataState,
}) {
  final lesson = module.lessonContent(context);
  final moduleCittas = _filterCittas(
    allCittas: dataState.cittas,
    ids: module.cittaIds,
  );
  final moduleCetasikas = _filterCetasikas(
    allCetasikas: dataState.cetasikas,
    ids: module.cetasikaIds,
  );
  final moduleKammas = _filterKammas(
    allKammas: dataState.kammas,
    moduleId: module.id,
  );
  final modulePaticcas = _filterPaticcas(
    allPaticcas: dataState.paticcas,
    moduleId: module.id,
  );
  final moduleRupas = _filterRupas(
    allRupas: dataState.rupas,
    moduleId: module.id,
  );
  final moduleVithis = _filterVithis(
    allVithis: dataState.vithis,
    moduleId: module.id,
  );

  return _buildStudyTracks(
    context,
    moduleId: module.id,
    sections: lesson.sections,
    cittas: moduleCittas,
    cetasikas: moduleCetasikas,
    kammas: moduleKammas,
    paticcas: modulePaticcas,
    rupas: moduleRupas,
    vithis: moduleVithis,
  );
}

/// Build từ các mảnh đã lọc — giữ nguyên logic `module_detail_screen.dart`.
List<AudioTrack> _buildStudyTracks(
  BuildContext context, {
  required String moduleId,
  required List<LessonSection> sections,
  required List<CittaModel> cittas,
  required List<CetasikaModel> cetasikas,
  required List<KammaModel> kammas,
  required List<PaticcaModel> paticcas,
  required List<RupaModel> rupas,
  required List<VithiModel> vithis,
}) {
  final tracks = <AudioTrack>[...PlaylistBuilder.build(moduleId: moduleId, sections: sections)];
  final entityItems = <EntityAudioItem>[
    for (final c in cittas)
      EntityAudioItem(
        id: 'citta:${c.id}',
        title: c.localizedName(context),
        pali: c.namePali,
        description: c.localizedDoctrine(context) ?? '',
      ),
    for (final cs in cetasikas)
      EntityAudioItem(
        id: 'cetasika:${cs.id}',
        title: cs.localizedName(context),
        pali: cs.namePali,
        description: cs.localizedDescription(context),
      ),
    for (final k in kammas)
      EntityAudioItem(
        id: 'kamma:${k.id}',
        title: k.localizedName(context),
        pali: k.namePali,
        description: k.localizedDescription(context),
      ),
    for (final p in paticcas)
      EntityAudioItem(
        id: 'paticca:${p.id}',
        title: p.localizedName(context),
        pali: p.namePali,
        description: p.localizedDescription(context),
      ),
    for (final r in rupas)
      EntityAudioItem(
        id: 'rupa:${r.id}',
        title: r.localizedName(context),
        pali: r.namePali,
        description: r.localizedDescription(context),
      ),
    for (final v in vithis)
      EntityAudioItem(
        id: 'vithi:${v.id}',
        title: v.localizedName(context),
        pali: v.namePali,
        description: v.localizedDescription(context),
      ),
  ];
  tracks.addAll(EntityPlaylistBuilder.build(moduleId: moduleId, items: entityItems));
  return List.unmodifiable(tracks);
}

List<CittaModel> _filterCittas({
  required List<CittaModel> allCittas,
  required List<String> ids,
}) {
  if (ids.isEmpty) return const [];
  final lookup = {for (final c in allCittas) c.id: c};
  return ids.map((id) => lookup[id]).whereType<CittaModel>().toList();
}

List<CetasikaModel> _filterCetasikas({
  required List<CetasikaModel> allCetasikas,
  required List<String> ids,
}) {
  if (ids.isEmpty) return const [];
  final lookup = {for (final c in allCetasikas) c.id: c};
  return ids.map((id) => lookup[id]).whereType<CetasikaModel>().toList();
}

List<KammaModel> _filterKammas({
  required List<KammaModel> allKammas,
  required String moduleId,
}) {
  if (moduleId != 'M6_NGHIEP') return const [];
  final items = List<KammaModel>.from(allKammas);
  items.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
  return items;
}

List<PaticcaModel> _filterPaticcas({
  required List<PaticcaModel> allPaticcas,
  required String moduleId,
}) {
  if (moduleId != 'M8_NHAN_DUYEN') return const [];
  final items = List<PaticcaModel>.from(allPaticcas);
  items.sort((a, b) => a.order.compareTo(b.order));
  return items;
}

List<RupaModel> _filterRupas({
  required List<RupaModel> allRupas,
  required String moduleId,
}) {
  if (moduleId != 'M9_SAC_PHAP') return const [];
  final items = List<RupaModel>.from(allRupas);
  items.sort((a, b) => a.traditionalOrder.compareTo(b.traditionalOrder));
  return items;
}

List<VithiModel> _filterVithis({
  required List<VithiModel> allVithis,
  required String moduleId,
}) {
  if (moduleId != 'M10_LO_TRINH') return const [];
  final items = List<VithiModel>.from(allVithis);
  items.sort((a, b) => a.orderIndex.compareTo(b.orderIndex));
  return items;
}
