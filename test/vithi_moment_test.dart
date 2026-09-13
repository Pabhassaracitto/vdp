import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:vdp_app/data/models/vithi_model.dart';
import 'package:vdp_app/features/vithi/utils/vithi_moment.dart';

void main() {
  VithiStep step({
    required int number,
    required VithiStepRole role,
    int repeatCount = 1,
  }) {
    return VithiStep(
      stepNumber: number,
      role: role,
      namePali: role.name,
      nameVietnamese: role.name,
      description: 'Test step',
      repeatCount: repeatCount,
    );
  }

  VithiModel process(List<VithiStep> steps) {
    return VithiModel(
      id: 'test',
      namePali: 'Test process',
      nameVietnamese: 'Lộ thử nghiệm',
      nameShort: 'Thử nghiệm',
      dvara: VithiDvara.panca,
      vithiType: VithiType.atimahanta,
      descriptionVi: 'Test',
      totalSteps: 17,
      steps: steps,
    );
  }

  test('expands seven Javana occurrences and omits terminal Bhavanga flow', () {
    final vithi = process([
      step(number: 1, role: VithiStepRole.bhavangaSota, repeatCount: -1),
      step(number: 2, role: VithiStepRole.javana, repeatCount: 7),
      step(number: 3, role: VithiStepRole.tadAramana, repeatCount: 2),
      step(number: 4, role: VithiStepRole.bhavangaSota, repeatCount: -1),
    ]);

    final moments = VithiMomentSequence.fromVithi(vithi);

    expect(moments, hasLength(10));
    expect(moments.map((moment) => moment.position), orderedEquals([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]));
    final javanas = moments.where((moment) => moment.step.role == VithiStepRole.javana).toList();
    expect(javanas.map((moment) => moment.occurrence), orderedEquals([1, 2, 3, 4, 5, 6, 7]));
    expect(javanas.every((moment) => moment.occurrenceTotal == 7), isTrue);
    expect(VithiMomentSequence.postVithiContinuation(vithi)?.role, VithiStepRole.bhavangaSota);
  });

  test('bundled very-great five-door process has a 17-moment learning sequence',
      () async {
    final raw = await File('assets/data/vithis.json').readAsString();
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    final source = (decoded['vithis'] as List)
        .cast<Map<String, dynamic>>()
        .firstWhere((item) => item['id'] == 'VT_NGU_MON_RATLON');
    final vithi = VithiModel.fromJson(source);

    final moments = VithiMomentSequence.fromVithi(vithi);
    final javanas = moments
        .where((moment) => moment.step.role == VithiStepRole.javana)
        .toList();
    final tadas = moments
        .where((moment) => moment.step.role == VithiStepRole.tadAramana)
        .toList();

    expect(moments, hasLength(17));
    expect(javanas, hasLength(7));
    expect(tadas, hasLength(2));
    expect(VithiMomentSequence.postVithiContinuation(vithi), isNotNull);
  });

  test('keeps a continuing stream that belongs inside Vithimutta', () {
    final vithi = process([
      step(number: 1, role: VithiStepRole.patisandhi),
      step(number: 2, role: VithiStepRole.bhavangaSota, repeatCount: -1),
      step(number: 3, role: VithiStepRole.cuti),
    ]);

    final moments = VithiMomentSequence.fromVithi(vithi);

    expect(moments, hasLength(3));
    expect(moments[1].isContinuingStream, isTrue);
    expect(moments[1].occurrenceLabel, '∞');
    expect(VithiMomentSequence.postVithiContinuation(vithi), isNull);
  });
}
