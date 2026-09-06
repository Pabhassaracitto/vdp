import 'package:flutter/material.dart';

import '../../data/models/cetasika_model.dart';
import '../../data/models/citta_model.dart';
import '../../data/models/kamma_model.dart';
import '../../data/models/lesson_content.dart';
import '../../data/models/paticca_model.dart';
import '../../data/models/rupa_model.dart';
import '../../data/models/study_module.dart';
import '../../data/models/vithi_model.dart';
import 'content_catalog.dart';

extension LocalizedCittaContent on CittaModel {
  String localizedName(BuildContext context) => context.contentCatalog.text(
        'cittas',
        id,
        'name',
        nameVietnamese,
      );

  String? localizedDoctrine(BuildContext context) {
    final value = context.contentCatalog.text(
      'cittas',
      id,
      'doctrinalNote',
      doctrinalNote ?? '',
    );
    return value.isEmpty ? null : value;
  }

  List<String> localizedExamples(BuildContext context) =>
      context.contentCatalog.textList('cittas', id, 'examples', examples ?? []);
}

extension LocalizedCetasikaContent on CetasikaModel {
  String localizedName(BuildContext context) => context.contentCatalog.text(
        'cetasikas',
        id,
        'name',
        nameVietnamese,
      );

  String localizedShortName(BuildContext context) =>
      context.contentCatalog.text('cetasikas', id, 'shortName', nameShort);

  String localizedDescription(BuildContext context) =>
      context.contentCatalog.text(
        'cetasikas',
        id,
        'description',
        descriptionVi,
      );

  String? localizedCharacteristic(BuildContext context) =>
      _optionalContent(context, 'characteristic', trangThai);
  String? localizedFunction(BuildContext context) =>
      _optionalContent(context, 'function', phanSu);
  String? localizedManifestation(BuildContext context) =>
      _optionalContent(context, 'manifestation', thanhTuu);
  String? localizedProximateCause(BuildContext context) =>
      _optionalContent(context, 'proximateCause', nhanGan);

  String? _optionalContent(
    BuildContext context,
    String field,
    String? fallback,
  ) {
    if (fallback == null && !context.usesEnglishContent) return null;
    final translated = context.contentCatalog.text(
      'cetasikas',
      id,
      field,
      fallback ?? '',
    );
    return translated.isEmpty ? null : translated;
  }
}

extension LocalizedRupaContent on RupaModel {
  String localizedName(BuildContext context) =>
      context.contentCatalog.text('rupas', id, 'name', nameVietnamese);
  String localizedDescription(BuildContext context) =>
      context.contentCatalog.text('rupas', id, 'description', descriptionVi);
}

extension LocalizedKammaContent on KammaModel {
  String localizedName(BuildContext context) =>
      context.contentCatalog.text('kammas', id, 'name', nameVietnamese);
  String localizedDescription(BuildContext context) =>
      context.contentCatalog.text('kammas', id, 'description', descriptionVi);
}

extension LocalizedPaticcaContent on PaticcaModel {
  String localizedName(BuildContext context) =>
      context.contentCatalog.text('paticcas', id, 'name', nameVietnamese);
  String localizedDescription(BuildContext context) => context.contentCatalog
      .text('paticcas', id, 'description', descriptionVi);
}

extension LocalizedVithiContent on VithiModel {
  String localizedName(BuildContext context) =>
      context.contentCatalog.text('vithis', id, 'name', nameVietnamese);
  String localizedDescription(BuildContext context) =>
      context.contentCatalog.text('vithis', id, 'description', descriptionVi);
  String localizedStepName(BuildContext context, VithiStep step) =>
      context.contentCatalog.nestedText(
        'vithis',
        id,
        'steps',
        step.stepNumber.toString(),
        'name',
        step.nameVietnamese,
      );
  String localizedStepDescription(BuildContext context, VithiStep step) =>
      context.contentCatalog.nestedText(
        'vithis',
        id,
        'steps',
        step.stepNumber.toString(),
        'description',
        step.description,
      );
}

extension LocalizedStudyModuleContent on StudyModule {
  String localizedTitle(BuildContext context) =>
      context.contentCatalog.moduleText(id, 'title', title);
  String localizedDescription(BuildContext context) =>
      context.contentCatalog.moduleText(id, 'description', description);

  /// Authored lesson content (sections / review cards / quiz seeds) for this
  /// module in the active content language, or
  /// [ModuleLessonContent.empty] when nothing has been authored yet.
  ModuleLessonContent lessonContent(BuildContext context) =>
      context.contentCatalog.moduleLesson(id);
}
