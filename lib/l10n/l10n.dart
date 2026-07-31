import 'package:flutter/material.dart';

import '../data/models/cetasika_model.dart';
import '../data/models/citta_model.dart';
import 'app_localizations.dart';

export 'app_localizations.dart';

extension AppLocalizationsContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension LocalizedCetasikaGroup on CetasikaGroup {
  String localizedName(AppLocalizations l10n, {bool includeCount = false}) {
    return switch (this) {
      CetasikaGroup.sabbacittasadharana => includeCount
          ? l10n.universalCetasikas
          : l10n.universalCetasikas.replaceFirst(RegExp(r'^7\s*'), ''),
      CetasikaGroup.pakinnaka => includeCount
          ? l10n.occasionalCetasikas
          : l10n.occasionalCetasikas.replaceFirst(RegExp(r'^6\s*'), ''),
      CetasikaGroup.akusala => includeCount
          ? l10n.unwholesomeCetasikas
          : l10n.unwholesomeCetasikas.replaceFirst(RegExp(r'^14\s*'), ''),
      CetasikaGroup.sobhana => includeCount
          ? l10n.beautifulCetasikas
          : l10n.beautifulCetasikas.replaceFirst(RegExp(r'^25\s*'), ''),
    };
  }
}

extension LocalizedVedana on Vedana {
  String localizedName(AppLocalizations l10n) {
    return switch (this) {
      Vedana.pleasant => l10n.pleasantFeeling,
      Vedana.unpleasant => l10n.unpleasantFeeling,
      Vedana.neutral => l10n.neutralFeeling,
      Vedana.joy => l10n.joyfulFeeling,
    };
  }
}

extension LocalizedBhumiGroup on BhumiGroup {
  String localizedName(AppLocalizations l10n) {
    return switch (this) {
      BhumiGroup.akusala => l10n.unwholesome,
      BhumiGroup.ahetuka => l10n.rootless,
      BhumiGroup.sobhanaKamavacara => l10n.senseSphereBeautiful,
      BhumiGroup.rupavacara => l10n.formSphere,
      BhumiGroup.arupavacara => l10n.formlessSphere,
      BhumiGroup.lokuttara => l10n.supramundane,
    };
  }
}

extension LocalizedCittaFunction on CittaFunction {
  String localizedName(AppLocalizations l10n) {
    return switch (this) {
      CittaFunction.kusala => l10n.wholesome,
      CittaFunction.akusala => l10n.unwholesome,
      CittaFunction.vipaka => l10n.result,
      CittaFunction.kiriya => l10n.functional,
    };
  }
}

extension LocalizedAssociationType on AssociationType {
  String localizedName(AppLocalizations l10n) {
    return switch (this) {
      AssociationType.always => l10n.associationAlways,
      AssociationType.sometimes => l10n.associationSometimes,
      AssociationType.never => l10n.associationNever,
    };
  }
}
