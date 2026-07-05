// lib/core/theme/vdp_theme.dart
// Hệ thống theme VDP - Accessibility-First với Dual Encoding

import 'package:flutter/material.dart';

/// Màu sắc theo nhóm Tâm
class VdpColors {
  // === CITTA GROUP COLORS ===
  static const Color akusala = Color(0xFF8B2500);         // Đỏ đậm - Bất Thiện
  static const Color akusalaLight = Color(0xFFFFE4DC);    // Nhạt
  
  static const Color ahetuka = Color(0xFF4A4A6A);         // Tím xám - Vô Nhân
  static const Color ahetukaLight = Color(0xFFEAEAF5);
  
  static const Color sobhanaKama = Color(0xFF1A6B3C);     // Xanh lá - Tịnh Hảo Dục Giới
  static const Color sobhanaKamaLight = Color(0xFFDCF5E8);
  
  static const Color rupavacara = Color(0xFF1A4A8B);      // Xanh dương - Sắc Giới
  static const Color rupavacaraLight = Color(0xFFDCEAFF);
  
  static const Color arupavacara = Color(0xFF4A1A8B);     // Tím - Vô Sắc Giới
  static const Color arupavacaraLight = Color(0xFFEADCFF);
  
  static const Color lokuttara = Color(0xFFB8860B);       // Vàng đặc biệt - Siêu Thế
  static const Color lokuttaraLight = Color(0xFFFFF8DC);

  // === CETASIKA GROUP COLORS ===
  static const Color sabbacittasadharana = Color(0xFF2D6A8F);  // 7 Biến Hành - Xanh
  static const Color pakinnaka = Color(0xFF6A8F2D);             // 6 Biệt Cảnh - Xanh lá nhạt
  static const Color cetasikaAkusala = Color(0xFF8F2D2D);       // 14 Bất Thiện - Đỏ
  static const Color cetasikaSobhana = Color(0xFF2D8F6A);       // 25 Tịnh Hảo - Xanh ngọc

  // === ASSOCIATION TYPE COLORS ===
  static const Color always = Color(0xFFFFD700);       // Vàng sáng - cố định
  static const Color sometimes = Color(0xFFFFB300);    // Vàng nhạt - bất định
  static const Color never = Color(0xFF9E9E9E);         // Xám - không có

  // === VEDANA COLORS ===
  static const Color pleasant = Color(0xFF4CAF50);     // Lạc thọ - Xanh lá
  static const Color unpleasant = Color(0xFFF44336);   // Khổ thọ - Đỏ
  static const Color neutral = Color(0xFF9E9E9E);      // Xả thọ - Xám
  static const Color joy = Color(0xFFFF9800);          // Hỷ thọ - Cam

  // === APP COLORS ===
  static const Color background = Color(0xFFF8F5F0);   // Nền kem truyền thống
  static const Color surface = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF4A2800);      // Nâu đất - màu truyền thống
  static const Color primaryLight = Color(0xFF8B5E3C);
  static const Color secondary = Color(0xFFB8860B);    // Vàng
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF1A0F00);
  static const Color error = Color(0xFFCC0000);
  static const Color warning = Color(0xFFE65100);
  
  // High Contrast Mode
  static const Color hcBackground = Color(0xFF000000);
  static const Color hcSurface = Color(0xFF121212);
  static const Color hcPrimary = Color(0xFFFFD700);
  static const Color hcText = Color(0xFFFFFFFF);
  static const Color hcAlways = Color(0xFFFFFFFF);
  static const Color hcSometimes = Color(0xFFFFFF00);
  static const Color hcNever = Color(0xFF444444);
}

/// Biểu tượng cho Dual Encoding (Màu + Hình + Text)
class VdpSymbols {
  // Association Types
  static const String always = '✦';     // Solid star - cố định
  static const String sometimes = '◎'; // Dashed circle - bất định
  static const String never = '✕';      // X - không có
  
  // Cetasika Groups
  static const String sabbacittasadharana = '●';
  static const String pakinnaka = '◆';
  static const String cetasikaAkusala = '▼';
  static const String cetasikaSobhana = '▲';
  
  // Vedana
  static const String pleasant = '🌟';
  static const String unpleasant = '⚡';
  static const String neutral = '○';
  static const String joy = '✨';
  
  // Bhumi Groups
  static const String akusala = '🔴';
  static const String ahetuka = '⬜';
  static const String sobhanaKama = '🟢';
  static const String rupavacara = '🔵';
  static const String arupavacara = '🟣';
  static const String lokuttara = '⭐';
}

class VdpTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: VdpColors.primary,
      secondary: VdpColors.secondary,
      surface: VdpColors.surface,
      error: VdpColors.error,
      onPrimary: VdpColors.onPrimary,
      onBackground: VdpColors.onBackground,
    ),
    scaffoldBackgroundColor: VdpColors.background,
    fontFamily: 'Sarabun',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, 
                              color: VdpColors.onBackground, height: 1.3),
      displayMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, 
                               color: VdpColors.onBackground),
      headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, 
                               color: VdpColors.onBackground),
      headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, 
                                color: VdpColors.onBackground),
      titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, 
                            color: VdpColors.onBackground),
      titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, 
                             color: VdpColors.onBackground),
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, 
                           color: VdpColors.onBackground, height: 1.6),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, 
                            color: VdpColors.onBackground, height: 1.6),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, 
                           color: VdpColors.primaryLight),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, 
                            letterSpacing: 0.5),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: VdpColors.primary,
      foregroundColor: VdpColors.onPrimary,
      elevation: 0,
      centerTitle: true,
    ),
    cardTheme: CardThemeData(
      color: VdpColors.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
  
  static ThemeData highContrastTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: VdpColors.hcPrimary,
      surface: VdpColors.hcSurface,
      onPrimary: Colors.black,
      onBackground: VdpColors.hcText,
    ),
    scaffoldBackgroundColor: VdpColors.hcBackground,
    fontFamily: 'Sarabun',
  );
}

/// Extension để lấy màu theo BhumiGroup
extension BhumiGroupColor on String {
  Color get bhumiColor {
    switch (this) {
      case 'akusala': return VdpColors.akusala;
      case 'ahetuka': return VdpColors.ahetuka;
      case 'sobhana_kamavacara': return VdpColors.sobhanaKama;
      case 'rupavacara': return VdpColors.rupavacara;
      case 'arupavacara': return VdpColors.arupavacara;
      case 'lokuttara': return VdpColors.lokuttara;
      default: return VdpColors.ahetuka;
    }
  }
  
  String get bhumiSymbol {
    switch (this) {
      case 'akusala': return VdpSymbols.akusala;
      case 'ahetuka': return '⬜';
      case 'sobhana_kamavacara': return VdpSymbols.sobhanaKama;
      case 'rupavacara': return VdpSymbols.rupavacara;
      case 'arupavacara': return VdpSymbols.arupavacara;
      case 'lokuttara': return VdpSymbols.lokuttara;
      default: return '○';
    }
  }
}
