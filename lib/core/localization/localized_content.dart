import 'package:flutter/material.dart';

import '../../data/models/cetasika_model.dart';
import '../../data/models/citta_model.dart';
import '../../data/models/kamma_model.dart';
import '../../data/models/lesson_content.dart';
import '../../data/models/paccaya_model.dart';
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
    // A missing Vietnamese source value does not mean the field is missing
    // everywhere: a translation may still supply it. Only skip the catalog
    // lookup for Vietnamese itself, where the dataset is the source of truth.
    if (fallback == null && context.showsVietnameseSourceText) return null;
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

extension LocalizedPaccayaContent on PaccayaModel {
  /// The 24 Duyên Hệ are served through the same locale chain as every other
  /// entity: `content_en.json` carries the English overlay (see
  /// tool/content/build_english_entities.py), Vietnamese stays canonical in
  /// assets/data/paccayas.json, and further languages translate on top.
  String localizedName(BuildContext context) => context.contentCatalog.text(
        'paccayas',
        id,
        'name',
        nameVietnamese,
      );

  String localizedShortName(BuildContext context) =>
      context.contentCatalog.text('paccayas', id, 'shortName', nameShort);

  String localizedDefinition(BuildContext context) => context.contentCatalog
      .text('paccayas', id, 'definition', definitionVi);

  /// Pháp làm năng duyên (paccaya-dhamma).
  String localizedPaccayaDhamma(BuildContext context) =>
      context.contentCatalog.text(
        'paccayas',
        id,
        'paccayaDhamma',
        paccayaDhamma,
      );

  /// Pháp được duyên (paccayuppanna).
  String localizedPaccayuppanna(BuildContext context) =>
      context.contentCatalog.text(
        'paccayas',
        id,
        'paccayuppanna',
        paccayuppanna,
      );

  String? localizedDoctrinalNote(BuildContext context) =>
      context.contentCatalog.optionalText(
        'paccayas',
        id,
        'doctrinalNote',
        doctrinalNote,
      );

  List<String>? localizedExamples(BuildContext context) =>
      context.contentCatalog.optionalTextList(
        'paccayas',
        id,
        'examples',
        examples,
      );

  /// Tiêu đề + ghi chú của một chi phần nhỏ (subdivision), tra qua catalog với
  /// khoá là tên Pāḷi (bất biến giữa các ngôn ngữ).
  String localizedSubdivisionName(
    BuildContext context,
    PaccayaSubdivision subdivision,
  ) =>
      context.contentCatalog.nestedText(
        'paccayas',
        id,
        'subdivisions',
        subdivision.namePali,
        'name',
        subdivision.nameVi,
      );

  String? localizedSubdivisionNote(
    BuildContext context,
    PaccayaSubdivision subdivision,
  ) =>
      context.contentCatalog.optionalNestedText(
        'paccayas',
        id,
        'subdivisions',
        subdivision.namePali,
        'note',
        subdivision.note.isEmpty ? null : subdivision.note,
      );
}

extension LocalizedPaticcaContent on PaticcaModel {
  String localizedName(BuildContext context) =>
      context.contentCatalog.text('paticcas', id, 'name', nameVietnamese);
  String localizedDescription(BuildContext context) => context.contentCatalog
      .text('paticcas', id, 'description', descriptionVi);

  /// Tứ Nghĩa — đặc tướng / phận sự / thành tựu / nhân gần.
  String? localizedCharacteristic(BuildContext context) =>
      context.contentCatalog.optionalText(
        'paticcas',
        id,
        'characteristic',
        trangThai,
      );

  String? localizedFunction(BuildContext context) =>
      context.contentCatalog.optionalText('paticcas', id, 'function', phanSu);

  String? localizedManifestation(BuildContext context) =>
      context.contentCatalog.optionalText(
        'paticcas',
        id,
        'manifestation',
        thanhTuu,
      );

  String? localizedProximateCause(BuildContext context) =>
      context.contentCatalog.optionalText(
        'paticcas',
        id,
        'proximateCause',
        nhanGan,
      );

  List<String>? localizedExamples(BuildContext context) =>
      context.contentCatalog.optionalTextList(
        'paticcas',
        id,
        'examples',
        examples,
      );

  String? localizedDoctrinalNote(BuildContext context) =>
      context.contentCatalog.optionalText(
        'paticcas',
        id,
        'doctrinalNote',
        doctrinalNote,
      );
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

  /// Bối cảnh phát sinh lộ — dataset chỉ có tiếng Việt, các ngôn ngữ khác đọc
  /// qua overlay (en trước); trả `null` thay vì lộ tiếng Việt.
  String? localizedArisingCondition(BuildContext context) =>
      context.contentCatalog.optionalText(
        'vithis',
        id,
        'arisingCondition',
        arisingCondition,
      );

  String? localizedSignificance(BuildContext context) =>
      context.contentCatalog.optionalText(
        'vithis',
        id,
        'significance',
        significance,
      );

  String? localizedDoctrinalNote(BuildContext context) =>
      context.contentCatalog.optionalText(
        'vithis',
        id,
        'doctrinalNote',
        doctrinalNote,
      );

  String? localizedStepDoctrinalNote(
    BuildContext context,
    VithiStep step,
  ) =>
      context.contentCatalog.optionalNestedText(
        'vithis',
        id,
        'steps',
        step.stepNumber.toString(),
        'doctrinalNote',
        step.doctrinalNote,
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
