// lib/core/validators/data_validator.dart
// Content Governance - Lớp 2: Kỹ thuật
// Hard Rules và Soft Rules theo Blueprint VDP

import '../../data/models/citta_model.dart';
import '../../data/models/cetasika_model.dart';

/// Kết quả validation
class ValidationResult {
  final bool isValid;
  final List<ValidationError> errors;
  final List<ValidationWarning> warnings;

  const ValidationResult({
    required this.isValid,
    required this.errors,
    required this.warnings,
  });

  bool get hasWarnings => warnings.isNotEmpty;
}

class ValidationError {
  final String code;
  final String message;
  final String? cittaId;
  final String? cetasikaId;

  const ValidationError({
    required this.code,
    required this.message,
    this.cittaId,
    this.cetasikaId,
  });
}

class ValidationWarning {
  final String code;
  final String message;
  final String? note;

  const ValidationWarning({
    required this.code,
    required this.message,
    this.note,
  });
}

/// Validator chính - áp dụng Hard Rules và Soft Rules
class VdpDataValidator {
  /// Validate toàn bộ dataset trước khi load
  static ValidationResult validateAll({
    required List<CittaModel> cittas,
    required List<CetasikaModel> cetasikas,
  }) {
    final errors = <ValidationError>[];
    final warnings = <ValidationWarning>[];

    // === HARD RULES (vi phạm → từ chối load) ===

    // Rule H1: Tâm Siêu Thế không được Tạo sắc
    for (final citta in cittas) {
      if (citta.bhumiGroup == BhumiGroup.lokuttara) {
        if (citta.vatthurSaca?.rupaSampayutta != null &&
            citta.vatthurSaca!.rupaSampayutta!.isNotEmpty) {
          errors.add(ValidationError(
            code: 'H001_LOKUTTARA_NO_RUPA',
            message:
                'Tâm Siêu Thế "${citta.nameVietnamese}" không thể Tạo sắc. '
                'Vi phạm nguyên tắc: Tâm Siêu Thế ≠ Tạo sắc.',
            cittaId: citta.id,
          ));
        }
      }
    }

    // Rule H2: Nghiệp Dục giới không tạo Tâm Quả Sắc/Vô Sắc giới
    for (final citta in cittas) {
      if (citta.bhumiGroup == BhumiGroup.akusala ||
          citta.bhumiGroup == BhumiGroup.sobhanaKamavacara) {
        for (final kammaLink in citta.kammaLinks) {
          // Kiểm tra nếu kamma link đến Sắc/Vô Sắc quả
          final linkedCitta =
              cittas.where((c) => c.id == kammaLink).firstOrNull;
          if (linkedCitta != null) {
            if (linkedCitta.function == CittaFunction.vipaka &&
                (linkedCitta.bhumiGroup == BhumiGroup.rupavacara ||
                    linkedCitta.bhumiGroup == BhumiGroup.arupavacara)) {
              errors.add(ValidationError(
                code: 'H002_KAMAVACARA_NO_RUPA_VIPAKA',
                message:
                    'Nghiệp Dục giới "${citta.nameVietnamese}" không thể tạo '
                    'Tâm Quả Sắc/Vô Sắc giới "${linkedCitta.nameVietnamese}". '
                    'Vi phạm: Nghiệp Dục giới ≠ Tạo Tâm Quả Sắc/Vô Sắc giới.',
                cittaId: citta.id,
              ));
            }
          }
        }
      }
    }

    // Rule H3: Tâm Sở Tịnh Hảo không phối hợp với Tâm Bất Thiện
    for (final citta in cittas) {
      if (citta.bhumiGroup == BhumiGroup.akusala) {
        for (final assoc in citta.cetasikaAssociations) {
          if (assoc.type == AssociationType.always) {
            final cetasika =
                cetasikas.where((c) => c.id == assoc.cetasikaId).firstOrNull;
            if (cetasika != null && cetasika.group == CetasikaGroup.sobhana) {
              errors.add(ValidationError(
                code: 'H003_NO_SOBHANA_IN_AKUSALA',
                message:
                    'Tâm Bất Thiện "${citta.nameVietnamese}" không thể phối hợp '
                    'cố định với Tâm Sở Tịnh Hảo "${cetasika.nameVietnamese}". '
                    'Vi phạm: Tâm Sở Tịnh Hảo ≠ Phối hợp với Tâm Bất Thiện.',
                cittaId: citta.id,
                cetasikaId: cetasika.id,
              ));
            }
          }
        }
      }
    }

    // === SOFT RULES (vi phạm → cảnh báo + cho phép load) ===

    // Rule S1: Tâm Sở Bất Định (Tật/Lận/Hối) trong Tâm Sân nên có ghi chú "sometimes"
    final dosaFlagIds = [
      'CS_ISSA',
      'CS_MACCHARIYA',
      'CS_KUKKUCCA'
    ]; // Tật, Lận, Hối
    for (final citta in cittas) {
      // Kiểm tra tâm sân (Dosa citta - đơn giản hóa: nhóm bất thiện)
      if (citta.bhumiGroup == BhumiGroup.akusala) {
        for (final flagId in dosaFlagIds) {
          final assoc = citta.cetasikaAssociations
              .where((a) => a.cetasikaId == flagId)
              .firstOrNull;
          if (assoc != null &&
              assoc.type == AssociationType.sometimes &&
              assoc.note == null) {
            warnings.add(ValidationWarning(
              code: 'S001_DOSA_NEEDS_NOTE',
              message:
                  'Tâm Sở Bất Định trong Tâm Sân "${citta.nameVietnamese}" '
                  'nên có ghi chú "sometimes" để rõ nghĩa.',
              note: 'Thêm note: "sometimes - tùy duyên xuất hiện"',
            ));
          }
        }
      }
    }

    // Rule S2: Kiểm tra đủ 121 Tâm
    if (cittas.length != 121) {
      warnings.add(ValidationWarning(
        code: 'S002_CITTA_COUNT',
        message: 'Số lượng Tâm: ${cittas.length} (kỳ vọng: 121). '
            'Dữ liệu có thể chưa hoàn chỉnh.',
      ));
    }

    // Rule S3: Kiểm tra đủ 52 Tâm Sở
    if (cetasikas.length != 52) {
      warnings.add(ValidationWarning(
        code: 'S003_CETASIKA_COUNT',
        message: 'Số lượng Tâm Sở: ${cetasikas.length} (kỳ vọng: 52). '
            'Dữ liệu có thể chưa hoàn chỉnh.',
      ));
    }

    return ValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
    );
  }
}
