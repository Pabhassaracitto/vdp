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
    if (moduleProgress.isEmpty) return 0.0;

    final total = moduleProgress.values.fold<double>(
      0.0,
      // completionPercentage ∈ [0, 100] → chia 100 → [0.0, 1.0] mỗi module
      (sum, m) => sum + (m.completionPercentage / 100.0).clamp(0.0, 1.0),
    );

    // Trung bình tỷ lệ, clamp để đảm bảo không vượt 1.0
    return (total / moduleProgress.length).clamp(0.0, 1.0);
  }

  bool isModuleUnlocked(StudyModule module, List<StudyModule> allModules) {
    if (allModulesUnlocked) return true;
    if (module.prerequisiteIds.isEmpty) return true;
    // FIX: Nếu chưa có bất kỳ tiến độ nào (người dùng mới, vừa thêm tài liệu),
    // mở khóa tất cả để họ có thể học ngay, tránh báo "chưa đủ dữ liệu" do bị khóa.
    // Trước đây logic yêu cầu prereq >=80% nhưng khi moduleProgress rỗng thì luôn false,
    // khiến M2-M10 bị khóa vĩnh viễn với user mới.
    if (moduleProgress.isEmpty) return true;
    return module.prerequisiteIds.every((prereqId) {
      final progress = moduleProgress[prereqId];
      // Nếu prereq chưa từng học, coi như đã đủ điều kiện khi tài liệu đã đầy đủ
      // (để fix lỗi "đã thêm đầy đủ tài liệu nhưng module vẫn khóa")
      if (progress == null) return true;
      return progress.completionPercentage >= 80;
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

/// Định nghĩa 14 Module theo Blueprint (Study Graph).
///
/// GUARD: mọi Citta / Cetasika trong `assets/data` phải thuộc ít nhất một
/// module ở đây — được chặn bởi `test/study_module_coverage_test.dart` để
/// không tái diễn tình trạng "Bài học thiếu 22/52 tâm sở, 45/121 tâm".
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
    'id': 'M11_BIET_CANH',
    'title': '6 Tâm Sở Biệt Cảnh',
    'titlePali': 'Pakiṇṇaka Cetasika (6)',
    'description': 'Tầm, Tứ, Thắng Giải, Cần, Hỷ, Dục — nhóm Tợ tha chỉ có '
        'mặt trong MỘT SỐ tâm, thiện lẫn bất thiện (khác Biến hành có mặt '
        'trong mọi tâm).',
    'prerequisiteIds': ['M1_BASICS'],
    'recommendedOrder': 2,
    'colorCode': 0xFF6A8F2D,
    'icon': '✨',
    'isRequired': false,
    'phase': 1,
    'cetasikaIds': [
      'CS_VITAKKA',
      'CS_VICARA',
      'CS_ADHIMOKKHA',
      'CS_VIRIYA',
      'CS_PITI',
      'CS_CHANDA'
    ],
  },
  {
    'id': 'M2_SI_PHAN',
    'title': 'Si Phần (Nhóm Vô Minh)',
    'titlePali': 'Moha-catukka',
    'description':
        'Si, Vô Tàm, Vô Quý, Phóng Dật - có mặt trong mọi tâm bất thiện.',
    'prerequisiteIds': ['M1_BASICS'],
    'recommendedOrder': 3,
    'colorCode': 0xFF8F2D2D,
    'icon': '🌑',
    'isRequired': false,
    'phase': 1,
    'cetasikaIds': ['CS_MOHA', 'CS_AHIRIKA', 'CS_ANOTTAPPA', 'CS_UDDHACCA'],
  },
  {
    'id': 'M4_AKUSALA',
    'title': '12 Tâm Bất Thiện',
    'titlePali': 'Akusala Citta (12)',
    'description': '8 Tâm Tham + 2 Tâm Sân + 2 Tâm Si. Nguyên nhân của Khổ. '
        'Kèm 10 tâm sở Bất thiện đặc thù (Tham phần, Sân phần, Hôn phần, '
        'Hoài Nghi) — cùng 4 tâm sở Si phần ở M2 là đủ 14 tâm sở Bất thiện.',
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
    'cetasikaIds': [
      'CS_LOBHA',
      'CS_DITTHI',
      'CS_MANA',
      'CS_DOSA',
      'CS_ISSA',
      'CS_MACCHARIYA',
      'CS_KUKKUCCA',
      'CS_THINA',
      'CS_MIDDHA',
      'CS_VICIKICCHA'
    ],
  },
  {
    'id': 'M12_VO_NHAN',
    'title': '18 Tâm Vô Nhân',
    'titlePali': 'Ahetuka Citta (18)',
    'description': '15 Tâm Quả Vô Nhân (7 quả bất thiện + 8 quả thiện) và '
        '3 Tâm Duy Tác Vô Nhân — tâm không có nhân thiện/bất thiện đồng '
        'sanh, chỉ còn nhân dị thời (nghiệp quá khứ).',
    'prerequisiteIds': ['M4_AKUSALA'],
    'recommendedOrder': 5,
    'colorCode': 0xFF4A4A6A,
    'icon': '⬜',
    'isRequired': false,
    'phase': 1,
    'cittaIds': [
      'CI_013',
      'CI_014',
      'CI_015',
      'CI_016',
      'CI_017',
      'CI_018',
      'CI_019',
      'CI_020',
      'CI_021',
      'CI_022',
      'CI_023',
      'CI_024',
      'CI_025',
      'CI_026',
      'CI_027',
      'CI_028',
      'CI_029',
      'CI_030'
    ],
  },
  {
    'id': 'M3_TINH_HAO_BIEN_HANH',
    'title': 'Tâm Sở Tịnh Hảo (25)',
    'titlePali': 'Sobhana Cetasika (25)',
    'description': '25 Tâm Sở Tịnh Hảo: 19 Biến hành có mặt trong mọi tâm '
        'tịnh hảo, cùng Giới phần (Chánh Ngữ, Chánh Nghiệp, Chánh Mạng), '
        'Vô lượng phần (Bi, Tùy Hỷ) và Tuệ quyền.',
    'prerequisiteIds': ['M1_BASICS'],
    'recommendedOrder': 6,
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
      'CS_CITTUJUKATA',
      'CS_SAMMAVACA',
      'CS_SAMMAKAMMANTA',
      'CS_SAMMAAJIVA',
      'CS_KARUNA',
      'CS_MUDITA',
      'CS_PANNA'
    ],
  },
  {
    'id': 'M5_SOBHANA',
    'title': 'Tịnh Hảo Dục Giới',
    'titlePali': 'Kāmāvacara Sobhana',
    'description': '24 Tâm Đại Thiện, Đại Quả, Đại Duy Tác.',
    'prerequisiteIds': ['M3_TINH_HAO_BIEN_HANH'],
    'recommendedOrder': 7,
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
    'id': 'M13_SAC_GIOI',
    'title': '15 Tâm Sắc Giới',
    'titlePali': 'Rūpāvacara Citta (15)',
    'description': 'Tâm Thiện, Tâm Quả và Tâm Duy Tác Sắc giới qua 5 tầng '
        'Thiền (Sơ → Ngũ) — tâm lưu chuyển trong Sắc giới (Đáo đại).',
    'prerequisiteIds': ['M5_SOBHANA'],
    'recommendedOrder': 8,
    'colorCode': 0xFF1A4A8B,
    'icon': '🔵',
    'isRequired': false,
    'phase': 2,
    'cittaIds': [
      'CI_079',
      'CI_080',
      'CI_081',
      'CI_082',
      'CI_083',
      'CI_084',
      'CI_085',
      'CI_086',
      'CI_087',
      'CI_088',
      'CI_089',
      'CI_090',
      'CI_091',
      'CI_092',
      'CI_093'
    ],
  },
  {
    'id': 'M14_VO_SAC_GIOI',
    'title': '12 Tâm Vô Sắc Giới',
    'titlePali': 'Arūpāvacara Citta (12)',
    'description': 'Tâm Thiện, Tâm Quả và Tâm Duy Tác Vô Sắc giới qua 4 xứ '
        'thiền: Không Vô Biên, Thức Vô Biên, Vô Sở Hữu, Phi Tưởng Phi Phi '
        'Tưởng.',
    'prerequisiteIds': ['M13_SAC_GIOI'],
    'recommendedOrder': 9,
    'colorCode': 0xFF4A1A8B,
    'icon': '🟣',
    'isRequired': false,
    'phase': 2,
    'cittaIds': [
      'CI_094',
      'CI_095',
      'CI_096',
      'CI_097',
      'CI_098',
      'CI_099',
      'CI_100',
      'CI_101',
      'CI_102',
      'CI_103',
      'CI_104',
      'CI_105'
    ],
  },
  {
    'id': 'M7_SIEU_THE',
    'title': 'Tâm Siêu Thế',
    'titlePali': 'Lokuttara Citta',
    'description': '8 Tâm Đạo + 8 Tâm Quả Siêu Thế. Con đường thoát khổ.',
    'prerequisiteIds': ['M5_SOBHANA'],
    'recommendedOrder': 10,
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
    'id': 'M15_TAM_SO_PHOI_HOP',
    'title': 'Tâm Sở Phối Hợp',
    'titlePali': 'Cetasikasaṅgaha',
    'description': 'Cách 52 tâm sở phối hợp vào từng loại tâm: Bất thiện, Vô nhân, Tịnh hảo, Thiền tâm, Siêu thế.',
    'prerequisiteIds': ['M7_SIEU_THE'],
    'recommendedOrder': 11,
    'colorCode': 0xFF5B4A8F,
    'icon': '🧩',
    'isRequired': false,
    'phase': 2,
  },
  {
    'id': 'M6_NGHIEP',
    'title': 'Nghiệp (16 loại)',
    'titlePali': 'Kamma (16)',
    'description': 'Phân loại Nghiệp và cách chúng liên kết với Tâm.',
    'prerequisiteIds': ['M4_AKUSALA', 'M5_SOBHANA'],
    'recommendedOrder': 12,
    'colorCode': 0xFFB8860B,
    'icon': '⚖️',
    'isRequired': false,
    'phase': 2,
  },
  {
    'id': 'M16_NGUOI_VA_COI',
    'title': 'Người và Cõi',
    'titlePali': 'Puggala – Bhūmi',
    'description': '12 loại người và 31 cõi sinh tồn: 4 cảnh giới, ác cảnh, cõi người, trời Dục giới, Sắc giới, Vô sắc.',
    'prerequisiteIds': ['M6_NGHIEP'],
    'recommendedOrder': 13,
    'colorCode': 0xFF2D8F7A,
    'icon': '🌏',
    'isRequired': false,
    'phase': 2,
  },
  {
    'id': 'M8_NHAN_DUYEN',
    'title': '12 Nhân Duyên',
    'titlePali': 'Paṭicca-samuppāda',
    'description': 'Vòng luân hồi: 12 chi phần Nhân Duyên và cách phá vỡ.',
    'prerequisiteIds': ['M6_NGHIEP'],
    'recommendedOrder': 14,
    'colorCode': 0xFF4A1A8B,
    'icon': '🔄',
    'isRequired': false,
    'phase': 2,
  },
  {
    'id': 'M17_DUYEN_CHI_TIET',
    'title': 'Duyên Khởi: Các Chi 3–12',
    'titlePali': 'Paṭiccasamuppāda (chi tiết)',
    'description': 'Chi tiết 10 chi còn lại: từ Thức duyên Danh–Sắc đến Sinh duyên Lão Tử, ba thời và 20 hành tướng.',
    'prerequisiteIds': ['M8_NHAN_DUYEN'],
    'recommendedOrder': 15,
    'colorCode': 0xFF8F6A2D,
    'icon': '🔗',
    'isRequired': false,
    'phase': 2,
  },
  {
    'id': 'M9_SAC_PHAP',
    'title': 'Sắc Pháp',
    'titlePali': 'Rūpa Dhamma',
    'description': '28 loại Sắc và mối quan hệ với Tâm, Nghiệp.',
    'prerequisiteIds': ['M8_NHAN_DUYEN'],
    'recommendedOrder': 16,
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
    'recommendedOrder': 17,
    'colorCode': 0xFF2D6A8F,
    'icon': '📊',
    'isRequired': false,
    'phase': 3,
  },
];
