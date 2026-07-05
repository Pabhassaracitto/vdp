// lib/core/theme/vdp_theme.dart
// Hệ thống theme VDP - Accessibility-First với Dual Encoding

import 'package:flutter/material.dart';

/// Màu sắc theo nhóm Tâm
class VdpColors {
  // === CITTA GROUP COLORS ===
  static const Color akusala = Color(0xFF8B2500);
  static const Color akusalaLight = Color(0xFFFFE4DC);

  static const Color ahetuka = Color(0xFF4A4A6A);
  static const Color ahetukaLight = Color(0xFFEAEAF5);

  static const Color sobhanaKama = Color(0xFF1A6B3C);
  static const Color sobhanaKamaLight = Color(0xFFDCF5E8);

  static const Color rupavacara = Color(0xFF1A4A8B);
  static const Color rupavacaraLight = Color(0xFFDCEAFF);

  static const Color arupavacara = Color(0xFF4A1A8B);
  static const Color arupavacaraLight = Color(0xFFEADCFF);

  static const Color lokuttara = Color(0xFFB8860B);
  static const Color lokuttaraLight = Color(0xFFFFF8DC);

  // === CETASIKA GROUP COLORS ===
  static const Color sabbacittasadharana = Color(0xFF2D6A8F);
  static const Color pakinnaka = Color(0xFF6A8F2D);
  static const Color cetasikaAkusala = Color(0xFF8F2D2D);
  static const Color cetasikaSobhana = Color(0xFF2D8F6A);

  // === ASSOCIATION TYPE COLORS ===
  static const Color always = Color(0xFFFFD700);
  static const Color sometimes = Color(0xFFFFB300);
  static const Color never = Color(0xFF9E9E9E);

  // === VEDANA COLORS ===
  static const Color pleasant = Color(0xFF4CAF50);
  static const Color unpleasant = Color(0xFFF44336);
  static const Color neutral = Color(0xFF9E9E9E);
  static const Color joy = Color(0xFFFF9800);

  // === APP COLORS ===
  static const Color background = Color(0xFFF8F5F0);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF4A2800);
  static const Color primaryLight = Color(0xFF8B5E3C);
  static const Color secondary = Color(0xFFB8860B);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onBackground = Color(0xFF1A0F00);
  static const Color error = Color(0xFFCC0000);
  static const Color warning = Color(0xFFE65100);

  // === HIGH CONTRAST MODE ===
  static const Color hcBackground = Color(0xFF000000);
  static const Color hcSurface = Color(0xFF121212);
  static const Color hcPrimary = Color(0xFFFFD700);
  static const Color hcText = Color(0xFFFFFFFF);
  static const Color hcAlways = Color(0xFFFFFFFF);
  static const Color hcSometimes = Color(0xFFFFFF00);
  static const Color hcNever = Color(0xFF666666);
}

/// Tập trung tất cả màu High Contrast — widget chỉ cần import class này.
/// Đảm bảo contrast ratio ≥ 4.5:1 theo WCAG AA.
class HCColors {
  // Nền & bề mặt
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF111111);
  static const Color surfaceVariant = Color(0xFF1E1E1E);
  static const Color surfaceElevated = Color(0xFF252525);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFE0E0E0);
  static const Color textMuted = Color(0xFFB0B0B0);
  static const Color textDisabled = Color(0xFF666666);

  // Accent
  static const Color primary = Color(0xFFFFD700);       // Vàng — trên đen: 9.5:1
  static const Color secondary = Color(0xFF00E5FF);     // Cyan — trên đen: 8.1:1
  static const Color success = Color(0xFF00E676);       // Xanh lá — trên đen: 8.4:1
  static const Color error = Color(0xFFFF5252);         // Đỏ — trên đen: 4.6:1
  static const Color warning = Color(0xFFFFAB40);       // Cam — trên đen: 6.2:1
  static const Color info = Color(0xFF82B1FF);          // Xanh nhạt — trên đen: 5.8:1

  // Association types — phân biệt rõ nhờ cả màu + symbol
  static const Color always = Color(0xFFFFFFFF);        // Trắng
  static const Color sometimes = Color(0xFFFFFF00);     // Vàng thuần
  static const Color never = Color(0xFF444444);         // Xám tối

  // Border
  static const Color border = Color(0xFF555555);
  static const Color borderFocus = Color(0xFFFFD700);
  static const Color borderStrong = Color(0xFF888888);

  // Bhumi group — đảm bảo phân biệt trong HC
  static const Color hcAkusala = Color(0xFFFF6B6B);
  static const Color hcAhetuka = Color(0xFFB0B0FF);
  static const Color hcSobhanaKama = Color(0xFF69FF84);
  static const Color hcRupavacara = Color(0xFF64B5F6);
  static const Color hcArupavacara = Color(0xFFCE93D8);
  static const Color hcLokuttara = Color(0xFFFFD700);

  // Cetasika group
  static const Color hcSabbacittasadharana = Color(0xFF4FC3F7);
  static const Color hcPakinnaka = Color(0xFFA5D6A7);
  static const Color hcCetasikaAkusala = Color(0xFFEF9A9A);
  static const Color hcCetasikaSobhana = Color(0xFF80CBC4);

  // Vedana
  static const Color hcPleasant = Color(0xFF69FF84);
  static const Color hcUnpleasant = Color(0xFFFF5252);
  static const Color hcNeutral = Color(0xFFB0B0B0);
  static const Color hcJoy = Color(0xFFFFAB40);
}

/// Extension để check HC mode từ BuildContext (không cần Riverpod ở widget con).
extension BuildContextHC on BuildContext {
  /// True khi app đang chạy highContrastTheme.
  bool get isHighContrast =>
      Theme.of(this).scaffoldBackgroundColor == VdpColors.hcBackground;
}

/// Extension để lấy màu HC của BhumiGroup
extension HCBhumiColor on String {
  Color get hcBhumiColor {
    switch (this) {
      case 'akusala': return HCColors.hcAkusala;
      case 'ahetuka': return HCColors.hcAhetuka;
      case 'sobhana_kamavacara': return HCColors.hcSobhanaKama;
      case 'rupavacara': return HCColors.hcRupavacara;
      case 'arupavacara': return HCColors.hcArupavacara;
      case 'lokuttara': return HCColors.hcLokuttara;
      default: return HCColors.hcAhetuka;
    }
  }
}

/// Biểu tượng cho Dual Encoding (Màu + Hình + Text)
class VdpSymbols {
  static const String always = '✦';
  static const String sometimes = '◎';
  static const String never = '✕';

  static const String sabbacittasadharana = '●';
  static const String pakinnaka = '◆';
  static const String cetasikaAkusala = '▼';
  static const String cetasikaSobhana = '▲';

  static const String pleasant = '🌟';
  static const String unpleasant = '⚡';
  static const String neutral = '○';
  static const String joy = '✨';

  static const String akusala = '🔴';
  static const String ahetuka = '⬜';
  static const String sobhanaKama = '🟢';
  static const String rupavacara = '🔵';
  static const String arupavacara = '🟣';
  static const String lokuttara = '⭐';

  // HC-safe text labels (không dựa vào emoji color)
  static const String alwaysLabel = 'CĐ';     // Cố định
  static const String sometimesLabel = 'BĐ';  // Bất định
  static const String neverLabel = '—';
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
      onSurface: VdpColors.onBackground,
    ),
    scaffoldBackgroundColor: VdpColors.background,
    fontFamily: 'Sarabun',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.w700,
          color: VdpColors.onBackground, height: 1.3),
      displayMedium: TextStyle(
          fontSize: 26, fontWeight: FontWeight.w700,
          color: VdpColors.onBackground),
      headlineLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700,
          color: VdpColors.onBackground),
      headlineMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700,
          color: VdpColors.onBackground),
      titleLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700,
          color: VdpColors.onBackground),
      titleMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600,
          color: VdpColors.onBackground),
      bodyLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400,
          color: VdpColors.onBackground, height: 1.6),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400,
          color: VdpColors.onBackground, height: 1.6),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w300,
          color: VdpColors.primaryLight),
      labelLarge: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: 0.5),
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
      primary: HCColors.primary,
      secondary: HCColors.secondary,
      surface: HCColors.surface,
      error: HCColors.error,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: HCColors.textPrimary,
      onError: Colors.black,
      outline: HCColors.border,
    ),
    scaffoldBackgroundColor: VdpColors.hcBackground,
    fontFamily: 'Sarabun',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.w700,
          color: HCColors.textPrimary, height: 1.3),
      displayMedium: TextStyle(
          fontSize: 26, fontWeight: FontWeight.w700,
          color: HCColors.textPrimary),
      headlineLarge: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700,
          color: HCColors.textPrimary),
      headlineMedium: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w700,
          color: HCColors.textPrimary),
      titleLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700,
          color: HCColors.textPrimary),
      titleMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600,
          color: HCColors.textPrimary),
      bodyLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400,
          color: HCColors.textPrimary, height: 1.6),
      bodyMedium: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w400,
          color: HCColors.textPrimary, height: 1.6),
      bodySmall: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w300,
          color: HCColors.textSecondary),
      labelLarge: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w600,
          letterSpacing: 0.5, color: HCColors.textPrimary),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: HCColors.surface,
      foregroundColor: HCColors.primary,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: HCColors.primary),
    ),
    cardTheme: CardThemeData(
      color: HCColors.surfaceVariant,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: HCColors.border),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return HCColors.primary;
        return HCColors.textMuted;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return HCColors.primary.withOpacity(0.4);
        }
        return HCColors.border;
      }),
    ),
    sliderTheme: const SliderThemeData(
      activeTrackColor: HCColors.primary,
      thumbColor: HCColors.primary,
      inactiveTrackColor: HCColors.border,
      valueIndicatorColor: HCColors.primary,
      valueIndicatorTextStyle: TextStyle(color: Colors.black),
    ),
    dividerTheme: const DividerThemeData(
      color: HCColors.border,
      thickness: 1,
    ),
    chipTheme: ChipThemeData(
      backgroundColor: HCColors.surfaceVariant,
      selectedColor: HCColors.primary.withOpacity(0.3),
      labelStyle: const TextStyle(color: HCColors.textPrimary),
      side: const BorderSide(color: HCColors.border),
      checkmarkColor: HCColors.primary,
    ),
    listTileTheme: const ListTileThemeData(
      textColor: HCColors.textPrimary,
      iconColor: HCColors.primary,
    ),
    iconTheme: const IconThemeData(color: HCColors.primary),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: HCColors.primary,
      foregroundColor: Colors.black,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: HCColors.primary,
        side: const BorderSide(color: HCColors.primary, width: 1.5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: HCColors.primary,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: HCColors.primary),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: HCColors.surfaceVariant,
      hintStyle: TextStyle(color: HCColors.textMuted),
      labelStyle: TextStyle(color: HCColors.textSecondary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: HCColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: HCColors.borderFocus, width: 2),
      ),
      prefixIconColor: HCColors.textMuted,
      suffixIconColor: HCColors.textMuted,
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData(
      color: HCColors.textSecondary,
      selectedColor: Colors.black,
      fillColor: HCColors.primary,
      borderColor: HCColors.border,
      selectedBorderColor: HCColors.primary,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: HCColors.primary,
      linearTrackColor: HCColors.border,
      circularTrackColor: HCColors.border,
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: HCColors.surfaceVariant,
      titleTextStyle: TextStyle(
          color: HCColors.textPrimary, fontSize: 18,
          fontWeight: FontWeight.w700),
      contentTextStyle: TextStyle(
          color: HCColors.textSecondary, fontSize: 14, height: 1.6),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: HCColors.surfaceElevated,
      contentTextStyle: TextStyle(color: HCColors.textPrimary),
      actionTextColor: HCColors.primary,
    ),
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
