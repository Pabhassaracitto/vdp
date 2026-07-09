// lib/features/vithi/utils/vithi_label_mapper.dart

import '../../../data/models/vithi_model.dart';

class VithiLabelMapper {
  static String shortNameForRole(VithiStepRole role) {
    return switch (role) {
      VithiStepRole.bhavangaSota => 'Hộ\nKiếp',
      VithiStepRole.bhavangaCalana => 'Hộ K\nRúng',
      VithiStepRole.bhavangupaccheda => 'Hộ K\nDứt',
      VithiStepRole.pancaDvaravajjana => 'Khán\nNM',
      VithiStepRole.dvipancaVinnana => 'Song\nThức',
      VithiStepRole.sampatiCchana => 'Tiếp\nThâu',
      VithiStepRole.santiRana => 'Quan\nSát',
      VithiStepRole.vottHapana => 'Xác\nĐịnh',
      VithiStepRole.javana => 'Đổng\nTốc',
      VithiStepRole.tadAramana => 'Thập\nDi',
      VithiStepRole.manoDvaravajjana => 'Khán\nÝM',
      VithiStepRole.patisandhi => 'Tục\nSinh',
      VithiStepRole.cuti => 'Tử',
    };
  }

  static String iconForRole(VithiStepRole role) {
    return switch (role) {
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
}
