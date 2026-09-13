import '../../../data/models/vithi_model.dart';

/// A renderable mental moment in a [VithiModel].
///
/// The source data groups repeated stages such as the seven Javana moments in
/// one [VithiStep]. The learning timeline needs those moments individually so
/// learners can see, select, and play through their actual order.
class VithiMoment {
  const VithiMoment({
    required this.step,
    required this.sourceStepIndex,
    required this.position,
    required this.occurrence,
    required this.occurrenceTotal,
  });

  /// The source step this visual moment was expanded from.
  final VithiStep step;

  /// Zero-based index of [step] in [VithiModel.steps].
  final int sourceStepIndex;

  /// One-based position in the displayed sequence.
  final int position;

  /// One-based occurrence within a repeated source step.
  final int occurrence;

  /// Number of occurrences represented by the source step. A value of one
  /// means that this is not a repeated stage.
  final int occurrenceTotal;

  bool get isRepeated => occurrenceTotal > 1;

  /// A Bhavaṅga stage whose data uses -1 to mean a continuing stream.
  bool get isContinuingStream => step.repeatCount < 0;

  /// A compact, language-neutral label for the repeated part of a step.
  String get occurrenceLabel =>
      isRepeated ? '$occurrence/$occurrenceTotal' : isContinuingStream ? '∞' : '';

  /// A stable key for animated detail panels and widget tests.
  String get key => '${sourceStepIndex}_$occurrence';
}

/// Expands the compact Vithi dataset into the sequence used by the player.
class VithiMomentSequence {
  const VithiMomentSequence._();

  /// Expands positive repeat counts into individual moments.
  ///
  /// A final `Bhavaṅga-sota` with `repeatCount == -1` describes the continuing
  /// life-continuum *after* the cognitive process. It is deliberately rendered
  /// as a labelled continuation, not counted as one of the process moments.
  /// A continuing stream in any other position (notably Vīthimutta) remains a
  /// selectable representative moment.
  static List<VithiMoment> fromVithi(VithiModel vithi) {
    final moments = <VithiMoment>[];

    for (var sourceIndex = 0; sourceIndex < vithi.steps.length; sourceIndex++) {
      final step = vithi.steps[sourceIndex];
      final isTerminalContinuation =
          sourceIndex == vithi.steps.length - 1 &&
              step.repeatCount < 0 &&
              vithi.steps.length > 1;
      if (isTerminalContinuation) continue;

      final repeatTotal = step.repeatCount > 0 ? step.repeatCount : 1;
      for (var occurrence = 1; occurrence <= repeatTotal; occurrence++) {
        moments.add(
          VithiMoment(
            step: step,
            sourceStepIndex: sourceIndex,
            position: moments.length + 1,
            occurrence: occurrence,
            occurrenceTotal: repeatTotal,
          ),
        );
      }
    }

    return List<VithiMoment>.unmodifiable(moments);
  }

  /// Returns the continuing Bhavaṅga shown after the interactive sequence, if
  /// the model declares one.
  static VithiStep? postVithiContinuation(VithiModel vithi) {
    if (vithi.steps.length <= 1) return null;
    final last = vithi.steps.last;
    return last.repeatCount < 0 ? last : null;
  }
}
