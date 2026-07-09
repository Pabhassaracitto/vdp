// lib/features/vithi/utils/vithi_color_mapper.dart

import 'package:flutter/material.dart';
import '../../../data/models/vithi_model.dart';

class VithiColorMapper {
  static const Map<VithiStepRole, Color> _roleColors = {
    VithiStepRole.bhavangaSota: Color(0xFF455A64),
    VithiStepRole.bhavangaCalana: Color(0xFF546E7A),
    VithiStepRole.bhavangupaccheda: Color(0xFF607D8B),
    VithiStepRole.pancaDvaravajjana: Color(0xFF1565C0),
    VithiStepRole.dvipancaVinnana: Color(0xFF6A1B9A),
    VithiStepRole.sampatiCchana: Color(0xFF2E7D32),
    VithiStepRole.santiRana: Color(0xFFE65100),
    VithiStepRole.vottHapana: Color(0xFFC62828),
    VithiStepRole.javana: Color(0xFFF57F17),
    VithiStepRole.tadAramana: Color(0xFFAD1457),
    VithiStepRole.manoDvaravajjana: Color(0xFF283593),
    VithiStepRole.patisandhi: Color(0xFF00695C),
    VithiStepRole.cuti: Color(0xFF4E342E),
  };

  static Color colorForRole(VithiStepRole role) {
    return _roleColors[role] ?? const Color(0xFF37474F);
  }
}
