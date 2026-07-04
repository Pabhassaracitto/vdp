// lib/data/models/study_module.dart
// Study Graph - Hệ thống học phi tuyến theo Blueprint

import 'package:freezed_annotation/freezed_annotation.dart';

part 'study_module.freezed.dart';
part 'study_module.g.dart';

@freezed
class StudyModule with _$StudyModule {
  const factory StudyModule({
    required String id,
    required String title,
    required String titlePali,
    required String description,

    // Prerequisite modules (edges trong Study Graph)
    @Default([]) List<String> prerequisiteIds,

    // Danh sách Tâm liên quan
    @Default([]) List<String> cittaIds,

    // Danh sách Tâm Sở liên quan
    @Default([]) List<String> cetasikaIds,

    // Thứ tự khuyến nghị
    required int recommendedOrder,

    // Màu sắc cho UI
    required int colorCode,

    // Icon
    required String icon,

    // Có phải bắt buộc không
    @Default(false) bool isRequired,

    // Phase (1/2/3)
    @Default(1) int phase,
  }) = _StudyModule;

  factory StudyModule.fromJson(Map<String, dynamic> json) =>
      _$StudyModuleFromJson(json);
}

/// User Progress - lưu local
class UserProgress {
  final Map<String, ModuleProgress> moduleProgress;
  final DateTime lastStudied;
  final String? lastModuleId;
  final bool allModulesUnlocked;

  /// Danh sách Citta ID đã bookmark
  final Set<String> bookmarkedCittaIds;

  /// Danh sách Cetasika ID đã bookmark
  final Set<String> bookmarkedCetasikaIds;

  /// Ghi chú cá nhân - key format: citta_CI_001, cetasika_CS_PHASSA
  final Map<String, String> personalNotes;

  const UserProgress({
    required this.moduleProgress,
    required this.lastStudied,
    this.lastModuleId,
    this.allModulesUnlocked = false,
    this.bookmarkedCittaIds = const {},
    this.bookmarkedCetasikaIds = const {},
    this.personalNotes = const {},
  });

  double get overallProgress {
    if (moduleProgress.isEmpty) return 0;
    final total = moduleProgress.values
        .map((p) => p.completionPercentage)
        .reduce((a, b) => a + b);
    return total / moduleProgress.length;
  }

  bool isModuleUnlocked(StudyModule module, List<StudyModule> allModules) {
    if (allModulesUnlocked) return true;
    if (module.prerequisiteIds.isEmpty) return true;
    return module.prerequisiteIds.every((prereqId) {
      final progress = moduleProgress[prereqId];
      return progress != null && progress.completionPercentage >= 80;
    });
  }

  bool isModuleDueForReview(StudyModule module) {
    if (moduleProgress.containsKey(module.id)) {
      final progress = moduleProgress[module.id]!;
      if (progress.completionPercentage >= 80) {
        // Due for review if completed more than 7 days ago
        if (progress.completedAt != null) {
          return DateTime.now().difference(progress.completedAt!).inDays >= 7;
        }
      }
    }
    return false;
  }
}

class ModuleProgress {
  final String moduleId;
  final double completionPercentage;
  final int quizScore;
  final DateTime? completedAt;
  final List<String> viewedCittaIds;

  // Spaced Repetition fields
  final int reviewCount;
  final int consecutivePasses;
  final double easinessFactor;
  final DateTime? lastReviewedAt;
  final DateTime? nextReviewDue;

  const ModuleProgress({
    required this.moduleId,
    this.completionPercentage = 0,
    this.quizScore = 0,
    this.completedAt,
    this.viewedCittaIds = const [],
    this.reviewCount = 0,
    this.consecutivePasses = 0,
    this.easinessFactor = 2.5,
    this.lastReviewedAt,
    this.nextReviewDue,
  });
}

/// Định nghĩa 10 Module theo Blueprint
final List<Map<String, dynamic>> kStudyModules = [
  {
    'id': 'M1_BASICS',
    'title': '7 Tâm Sở Biến Hành',
    'titlePali': 'Sabbacittasādhārana Cetasika',
    'description': 'Nền tảng bắt buộc: 7 Tâm Sở có mặt trong mọi tâm. '
        'Hiểu rõ trước khi học các module khác.',
    'prerequisiteIds': [],
    'recommendedOrder': 1,
    'colorCode': 0xFF2D6A8F,
    'icon': '🌱',
    'isRequired': true,
    'phase': 1,
    'cetasikaIds': [
      'CS_PHASSA',
      'CS_VEDANA',
      'CS_SANNA',
      'CS_CETANA',
      'CS_EKAGGATA',
      'CS_JIVITINDRIYA',
      'CS_MANASIKARA'
    ],
  },
  {
    'id': 'M2_SI_PHAN',
    'title': 'Si Phần (Nhóm Vô Minh)',
    'titlePali': 'Moha-pakinnaka',
    'description':
        'Si, Vô Tàm, Vô Quý, Phóng Dật - có mặt trong mọi tâm bất thiện.',
    'prerequisiteIds': ['M1_BASICS'],
    'recommendedOrder': 2,
    'colorCode': 0xFF8F2D2D,
    'icon': '🌑',
    'isRequired': false,
    'phase': 1,
    'cetasikaIds': ['CS_MOHA', 'CS_AHIRIKA', 'CS_ANOTTAPPA', 'CS_UDDHACCA'],
  },
  {
    'id': 'M3_TINH_HAO_BIEN_HANH',
    'title': 'Tịnh Hảo Biến Hành',
    'titlePali': 'Sobhana Sādhārana',
    'description': '19 Tâm Sở Tịnh Hảo có mặt trong mọi tâm tịnh hảo.',
    'prerequisiteIds': ['M1_BASICS'],
    'recommendedOrder': 3,
    'colorCode': 0xFF2D8F6A,
    'icon': '🌟',
    'isRequired': false,
    'phase': 1,
    'cetasikaIds': [
      'CS_SADDHA',
      'CS_SATI',
      'CS_HIRI',
      'CS_OTTAPPA',
      'CS_ALOBHA',
      'CS_ADOSA',
      'CS_TATRAMAJJHATTATA',
      'CS_KAYAPASSADDHI',
      'CS_CITTAPASSADDHI',
      'CS_KAYALAHUTA',
      'CS_CITTALAHUTA',
      'CS_KAYAMUDUTA',
      'CS_CITTAMUDUTA',
      'CS_KAYAKAMMANNATA',
      'CS_CITTAKAMMANNATA',
      'CS_KAYAPAGUNNATA',
      'CS_CITTAPAGUNNATA',
      'CS_KAYUJUKATA',
      'CS_CITTUJUKATA'
    ],
  },
  {
    'id': 'M4_AKUSALA',
    'title': '12 Tâm Bất Thiện',
    'titlePali': 'Akusala Citta (12)',
    'description': '8 Tâm Tham + 2 Tâm Sân + 2 Tâm Si. Nguyên nhân của Khổ.',
    'prerequisiteIds': ['M2_SI_PHAN'],
    'recommendedOrder': 4,
    'colorCode': 0xFF8B2500,
    'icon': '⚠️',
    'isRequired': false,
    'phase': 1,
    'cittaIds': [
      'CI_001',
      'CI_002',
      'CI_003',
      'CI_004',
      'CI_005',
      'CI_006',
      'CI_007',
      'CI_008',
      'CI_009',
      'CI_010',
      'CI_011',
      'CI_012'
    ],
  },
  {
    'id': 'M5_SOBHANA',
    'title': 'Tịnh Hảo Dục Giới',
    'titlePali': 'Kāmāvacara Sobhana',
    'description': '24 Tâm Đại Thiện, Đại Quả, Đại Duy Tác.',
    'prerequisiteIds': ['M3_TINH_HAO_BIEN_HANH'],
    'recommendedOrder': 5,
    'colorCode': 0xFF1A6B3C,
    'icon': '🌿',
    'isRequired': false,
    'phase': 1,
    'cittaIds': [
      'CI_055',
      'CI_056',
      'CI_057',
      'CI_058',
      'CI_059',
      'CI_060',
      'CI_061',
      'CI_062',
      'CI_063',
      'CI_064',
      'CI_065',
      'CI_066',
      'CI_067',
      'CI_068',
      'CI_069',
      'CI_070',
      'CI_071',
      'CI_072',
      'CI_073',
      'CI_074',
      'CI_075',
      'CI_076',
      'CI_077',
      'CI_078'
    ],
  },
  {
    'id': 'M6_NGHIEP',
    'title': 'Nghiệp (16 loại)',
    'titlePali': 'Kamma (16)',
    'description': 'Phân loại Nghiệp và cách chúng liên kết với Tâm.',
    'prerequisiteIds': ['M4_AKUSALA', 'M5_SOBHANA'],
    'recommendedOrder': 6,
    'colorCode': 0xFFB8860B,
    'icon': '⚖️',
    'isRequired': false,
    'phase': 2,
  },
  {
    'id': 'M7_SIEU_THE',
    'title': 'Tâm Siêu Thế',
    'titlePali': 'Lokuttara Citta',
    'description': '8 Tâm Đạo + 8 Tâm Quả Siêu Thế. Con đường thoát khổ.',
    'prerequisiteIds': ['M5_SOBHANA'],
    'recommendedOrder': 7,
    'colorCode': 0xFFB8860B,
    'icon': '⭐',
    'isRequired': false,
    'phase': 2,
    'cittaIds': [
      'CI_106',
      'CI_107',
      'CI_108',
      'CI_109',
      'CI_110',
      'CI_111',
      'CI_112',
      'CI_113',
      'CI_114',
      'CI_115',
      'CI_116',
      'CI_117',
      'CI_118',
      'CI_119',
      'CI_120',
      'CI_121',
      'CI_122',
      'CI_123',
      'CI_124',
      'CI_125',
      'CI_126',
      'CI_127',
      'CI_128',
      'CI_129',
      'CI_130',
      'CI_131',
      'CI_132',
      'CI_133',
      'CI_134',
      'CI_135',
      'CI_136',
      'CI_137',
      'CI_138',
      'CI_139',
      'CI_140',
      'CI_141',
      'CI_142',
      'CI_143',
      'CI_144',
      'CI_145'
    ],
  },
  {
    'id': 'M8_NHAN_DUYEN',
    'title': '12 Nhân Duyên',
    'titlePali': 'Paṭicca-samuppāda',
    'description': 'Vòng luân hồi: 12 chi phần Nhân Duyên và cách phá vỡ.',
    'prerequisiteIds': ['M6_NGHIEP'],
    'recommendedOrder': 8,
    'colorCode': 0xFF4A1A8B,
    'icon': '🔄',
    'isRequired': false,
    'phase': 2,
  },
  {
    'id': 'M9_SAC_PHAP',
    'title': 'Sắc Pháp',
    'titlePali': 'Rūpa Dhamma',
    'description': '28 loại Sắc và mối quan hệ với Tâm, Nghiệp.',
    'prerequisiteIds': ['M8_NHAN_DUYEN'],
    'recommendedOrder': 9,
    'colorCode': 0xFF1A4A8B,
    'icon': '🧱',
    'isRequired': false,
    'phase': 3,
  },
  {
    'id': 'M10_LO_TRINH',
    'title': 'Lộ Trình Tâm 17 Sát-na',
    'titlePali': 'Vīthicitta (17)',
    'description': 'Lộ trình sinh diệt của Tâm trong 17 sát-na nhận thức.',
    'prerequisiteIds': ['M9_SAC_PHAP'],
    'recommendedOrder': 10,
    'colorCode': 0xFF2D6A8F,
    'icon': '📊',
    'isRequired': false,
    'phase': 3,
  },
];
