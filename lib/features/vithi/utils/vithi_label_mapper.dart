import '../../../data/models/vithi_model.dart';

/// Compact Pāḷi labels are intentionally language-neutral. Full localized
/// names and descriptions are shown in the detail panel.
class VithiLabelMapper {
  static String shortNameForRole(VithiStepRole role) => switch (role) {
        VithiStepRole.bhavangaSota => 'Bhavaṅga',
        VithiStepRole.bhavangaCalana => 'Bhv.\nCalana',
        VithiStepRole.bhavangupaccheda => 'Bhv.\nCheda',
        VithiStepRole.pancaDvaravajjana => 'Pañca-dv.\nĀvajjana',
        VithiStepRole.dvipancaVinnana => 'Dvi-pañca\nViññāṇa',
        VithiStepRole.sampatiCchana => 'Sampaṭi-\ncchana',
        VithiStepRole.santiRana => 'Santīraṇa',
        VithiStepRole.vottHapana => 'Voṭṭhapana',
        VithiStepRole.javana => 'Javana',
        VithiStepRole.tadAramana => 'Tadā-\nrammaṇa',
        VithiStepRole.manoDvaravajjana => 'Mano-dv.\nĀvajjana',
        VithiStepRole.patisandhi => 'Paṭisandhi',
        VithiStepRole.cuti => 'Cuti',
      };

  static String symbolForRole(VithiStepRole role) => switch (role) {
        VithiStepRole.bhavangaSota => '〜',
        VithiStepRole.bhavangaCalana => '〰',
        VithiStepRole.bhavangupaccheda => '✂',
        VithiStepRole.pancaDvaravajjana => '👁',
        VithiStepRole.dvipancaVinnana => '📡',
        VithiStepRole.sampatiCchana => '📥',
        VithiStepRole.santiRana => '🔍',
        VithiStepRole.vottHapana => '⚖',
        VithiStepRole.javana => '⚡',
        VithiStepRole.tadAramana => '🌊',
        VithiStepRole.manoDvaravajjana => '🧠',
        VithiStepRole.patisandhi => '🌱',
        VithiStepRole.cuti => '🕊',
      };
}
