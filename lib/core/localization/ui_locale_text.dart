import 'package:flutter/widgets.dart';

/// Resolves short pieces of UI copy that are intentionally kept outside ARB
/// generation (for small feature-local helpers and safety badges).
///
/// Prefer ARB for normal app strings. This helper is only for widgets that need
/// a compact, synchronous lookup without adding generated localization keys.
String localizedUiText(
  BuildContext context,
  Map<String, String> values,
) {
  final locale = Localizations.localeOf(context);
  final country = locale.countryCode;
  final fullTag = country == null || country.isEmpty
      ? locale.languageCode
      : '${locale.languageCode}_$country';
  return values[fullTag] ?? values[locale.languageCode] ?? values['en']!;
}
