import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/data/models/study_module.dart';

/// Study-module coverage guard (Accuracy-First).
///
/// `kStudyModules` lists `cittaIds` / `cetasikaIds` by hand, so an entity ID
/// can silently go missing: the Learn tab then hides that citta/cetasika with
/// no error anywhere — v0.4.3 shipped with 22/52 cetasikas and 45/121 cittas
/// unassigned (all 6 pakinnaka, 10 specific akusala, 6 specific sobhana,
/// plus every ahetuka / rūpāvacara / arūpāvacara citta).
///
/// These tests block that class of regression:
///
///   1. every cetasika / citta in `assets/data` belongs to at least one module;
///   2. every ID a module references exists in the dataset (no typos);
///   3. the hand-written lists and the `moduleId` field in `cittas.json` agree;
///   4. module prerequisites and recommended orders are internally consistent.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final cetasikasById = _loadEntities('cetasikas');
  final cittasById = _loadEntities('cittas');

  final moduleIds = kStudyModules.map((m) => m['id'] as String).toSet();

  // Union of the hand-written module lists.
  final listedCetasikaIds = <String>{};
  final listedCittaIds = <String>{};
  for (final module in kStudyModules) {
    listedCetasikaIds.addAll(_stringList(module['cetasikaIds']));
    listedCittaIds.addAll(_stringList(module['cittaIds']));
  }

  test('dataset ships exactly 121 unique cittas and 52 unique cetasikas', () {
    expect(cittasById.keys, hasLength(121), reason: 'cittas.json must ship 121 cittas');
    expect(cetasikasById.keys, hasLength(52), reason: 'cetasikas.json must ship 52 cetasikas');
  });

  test('every cetasika belongs to at least one study module', () {
    final missing = cetasikasById.keys.where((id) => !listedCetasikaIds.contains(id)).toList()
      ..sort();
    expect(
      missing,
      isEmpty,
      reason: 'Cetasikas not assigned to any module (tab "Bài học" would hide them): '
          '${missing.map((id) => '$id (${cetasikasById[id]!['nameVietnamese']})').join(', ')}',
    );
  });

  test('every citta belongs to at least one study module', () {
    final missing = cittasById.keys.where((id) => !listedCittaIds.contains(id)).toList()..sort();
    expect(
      missing,
      isEmpty,
      reason: 'Cittas not assigned to any module (tab "Bài học" would hide them): '
          '${missing.map((id) => '$id (${cittasById[id]!['nameVietnamese']})').join(', ')}',
    );
  });

  test('module id lists only reference entities that exist (no typos)', () {
    final unknownCetasikas = listedCetasikaIds.difference(cetasikasById.keys.toSet()).toList()..sort();
    final unknownCittas = listedCittaIds.difference(cittasById.keys.toSet()).toList()..sort();
    expect(unknownCetasikas, isEmpty, reason: 'kStudyModules references unknown cetasika ids');
    expect(unknownCittas, isEmpty, reason: 'kStudyModules references unknown citta ids');
  });

  test('every cetasika group is fully covered by modules', () {
    // 7 + 6 + 14 + 25 = 52.
    const expected = <String, int>{
      'sabbacittasadharana': 7,
      'pakinnaka': 6,
      'akusala': 14,
      'sobhana': 25,
    };
    final coveredByGroup = <String, int>{};
    for (final id in listedCetasikaIds) {
      final group = cetasikasById[id]!['group'] as String;
      coveredByGroup[group] = (coveredByGroup[group] ?? 0) + 1;
    }
    expect(coveredByGroup, expected);
  });

  test('every citta bhumi group is fully covered by modules', () {
    // 12 + 18 + 24 + 15 + 12 + 40 = 121.
    const expected = <String, int>{
      'akusala': 12,
      'ahetuka': 18,
      'sobhana_kamavacara': 24,
      'rupavacara': 15,
      'arupavacara': 12,
      'lokuttara': 40,
    };
    final coveredByBhumi = <String, int>{};
    for (final id in listedCittaIds) {
      final bhumi = cittasById[id]!['bhumiGroup'] as String;
      coveredByBhumi[bhumi] = (coveredByBhumi[bhumi] ?? 0) + 1;
    }
    expect(coveredByBhumi, expected);
  });

  test('module prerequisites reference known modules', () {
    for (final module in kStudyModules) {
      final id = module['id'] as String;
      for (final prereq in _stringList(module['prerequisiteIds'])) {
        expect(
          moduleIds,
          contains(prereq),
          reason: '$id depends on unknown prerequisite $prereq',
        );
      }
    }
  });

  test('cittas.json moduleId agrees with the module that lists the citta', () {
    final cittaIdsByModule = <String, Set<String>>{};
    for (final module in kStudyModules) {
      cittaIdsByModule[module['id'] as String] = _stringList(module['cittaIds']).toSet();
    }
    for (final entry in cittasById.entries) {
      final moduleId = entry.value['moduleId'] as String?;
      expect(
        moduleIds,
        contains(moduleId),
        reason: '${entry.key} has unknown moduleId "$moduleId"',
      );
      expect(
        cittaIdsByModule[moduleId]?.contains(entry.key),
        isTrue,
        reason: '${entry.key} declares moduleId "$moduleId" but is not listed '
            'in that module\'s cittaIds — the two sources have drifted apart',
      );
    }
  });

  test('recommendedOrder is unique so the study graph order stays stable', () {
    final orders = kStudyModules.map((m) => m['recommendedOrder'] as int).toList();
    expect(orders.toSet(), hasLength(orders.length),
        reason: 'duplicate recommendedOrder values would make module sorting '
            'unstable');
  });
}

/// Loads `assets/data/<entity>.json` into a map keyed by entity id.
Map<String, Map<String, dynamic>> _loadEntities(String entity) {
  final file = File('assets/data/$entity.json');
  final raw = json.decode(file.readAsStringSync()) as Map<String, dynamic>;
  final list = (raw[entity] as List<dynamic>).cast<Map<String, dynamic>>();
  return {
    for (final item in list) item['id'] as String: item,
  };
}

List<String> _stringList(Object? raw) {
  if (raw is! List) return const <String>[];
  return raw.cast<String>().toList(growable: false);
}
