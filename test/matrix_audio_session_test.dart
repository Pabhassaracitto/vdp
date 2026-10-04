// test/matrix_audio_session_test.dart
//
// VDP 0.10.2 — phiên nghe Bảng Tương Ứng (121 Tâm & 52 Tâm Sở):
//   • đúng số lượng track, đúng thứ tự hiển thị của bảng
//   • track id ổn định theo format `matrixCitta:`/`matrixCetasika:` (tách
//     khỏi `citta:`/`cetasika:` của playlist tab Học để không nhầm session)
//   • mỗi track đọc được tên + tên Pāli (đủ điều kiện phát)
// Dùng dữ liệu thật trong assets/data để bắt luôn lỗi dữ liệu (thiếu
// namePali, id trùng…) trước khi kịp lọt ra release.

import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/data/models/cetasika_model.dart';
import 'package:vdp_app/data/models/citta_model.dart';
import 'package:vdp_app/features/audio/data/entity_playlist_builder.dart';
import 'package:vdp_app/features/matrix/matrix_audio_session.dart';

void main() {
  final cittasRaw =
      jsonDecode(File('assets/data/cittas.json').readAsStringSync())
          as Map<String, dynamic>;
  final cetasikasRaw =
      jsonDecode(File('assets/data/cetasikas.json').readAsStringSync())
          as Map<String, dynamic>;
  final cittas = (cittasRaw['cittas'] as List)
      .map((e) => CittaModel.fromJson(Map<String, dynamic>.from(e)))
      .toList();
  final cetasikas = (cetasikasRaw['cetasikas'] as List)
      .map((e) => CetasikaModel.fromJson(Map<String, dynamic>.from(e)))
      .toList();

  test('dữ liệu gốc: 121 Tâm, 52 Tâm Sở', () {
    expect(cittas.length, 121);
    expect(cetasikas.length, 52);
  });

  group('MatrixAudioSession.buildCittaItems', () {
    test('121 item, id duy nhất, đúng format tiền tố', () {
      final items = MatrixAudioSession.buildCittaItems(
        cittas,
        nameOf: (c) => c.nameVietnamese,
        doctrineOf: (c) => c.doctrinalNote ?? '',
      );
      expect(items.length, 121);
      final ids = items.map((i) => i.id).toSet();
      expect(ids.length, 121, reason: 'track id Tâm phải duy nhất');
      for (final item in items) {
        expect(item.id.startsWith('matrixCitta:'), isTrue,
            reason: 'Sai format id: ${item.id}');
        expect(item.pali, isNotEmpty, reason: 'Thiếu namePali: ${item.id}');
      }
    });

    test('thứ tự track khớp thứ tự orderIndex như cột trái của bảng', () {
      final items = MatrixAudioSession.buildCittaItems(
        cittas.reversed.toList(),
        nameOf: (c) => c.nameVietnamese,
        doctrineOf: (c) => c.doctrinalNote ?? '',
      );
      final orders = [
        for (final id in items)
          cittas
              .firstWhere((c) => MatrixAudioSession.trackId(
                    MatrixAudioAxis.citta,
                    c.id,
                  ) == id)
              .orderIndex
      ];
      expect(orders, orderedEquals([...orders]..sort()));
    });
  });

  group('MatrixAudioSession.buildCetasikaItems', () {
    test('52 item, id duy nhất, đúng format tiền tố', () {
      final items = MatrixAudioSession.buildCetasikaItems(
        cetasikas,
        nameOf: (cs) => cs.nameVietnamese,
        descriptionOf: (cs) => cs.descriptionVi,
      );
      expect(items.length, 52);
      final ids = items.map((i) => i.id).toSet();
      expect(ids.length, 52, reason: 'track id Tâm Sở phải duy nhất');
      for (final item in items) {
        expect(item.id.startsWith('matrixCetasika:'), isTrue,
            reason: 'Sai format id: ${item.id}');
        expect(item.pali, isNotEmpty, reason: 'Thiếu namePali: ${item.id}');
      }
    });
  });

  test('trackId khớp id item — currentSectionId nhận diện đúng hàng/cột', () {
    final cittaItems = MatrixAudioSession.buildCittaItems(
      cittas,
      nameOf: (c) => c.nameVietnamese,
      doctrineOf: (c) => c.doctrinalNote ?? '',
    );
    final cetasikaItems = MatrixAudioSession.buildCetasikaItems(
      cetasikas,
      nameOf: (cs) => cs.nameVietnamese,
      descriptionOf: (cs) => cs.descriptionVi,
    );
    expect(
      cittaItems.map((i) => i.id),
      contains(MatrixAudioSession.trackId(MatrixAudioAxis.citta, cittas.first.id)),
    );
    expect(
      cetasikaItems.map((i) => i.id),
      contains(
          MatrixAudioSession.trackId(MatrixAudioAxis.cetasika, cetasikas.first.id)),
    );
  });

  test('EntityPlaylistBuilder sinh đủ track có cue đọc được', () {
    final items = MatrixAudioSession.buildCetasikaItems(
      cetasikas,
      nameOf: (cs) => cs.nameVietnamese,
      descriptionOf: (cs) => cs.descriptionVi,
    );
    final tracks = EntityPlaylistBuilder.build(
      moduleId: MatrixAudioSession.sessionId(MatrixAudioAxis.cetasika),
      items: items,
    );
    expect(tracks.length, 52);
    for (final t in tracks) {
      expect(t.cues, isNotEmpty, reason: 'Track không có cue: ${t.id}');
      expect(t.cues.first.spans.first.text, isNotEmpty);
    }
  });
}
