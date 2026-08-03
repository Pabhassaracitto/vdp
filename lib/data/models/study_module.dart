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

    // Danh sách Nghiệp liên quan (M6)
    @Default([]) List<String> kammaIds,

    // Danh sách Nhân Duyên liên quan (M8)
    @Default([]) List<String> paticcaIds,

    // Danh sách Sắc Pháp liên quan (M9)
    @Default([]) List<String> rupaIds,

    // Danh sách Lộ Trình Tâm liên quan (M10)
    @Default([]) List<String> vithiIds,

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
    'description':
        'Phân loại Nghiệp theo 4 phương diện: Thời gian trổ (4) - Phận sự (4) - Thứ tự ưu tiên (4) - Nơi cho quả (4). Hiểu nghiệp để làm chủ tái sinh.',
    'prerequisiteIds': ['M4_AKUSALA', 'M5_SOBHANA'],
    'recommendedOrder': 6,
    'colorCode': 0xFFB8860B,
    'icon': '⚖️',
    'isRequired': false,
    'phase': 2,
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
      'CI_012',
      'CI_055',
      'CI_056',
      'CI_057',
      'CI_058',
      'CI_059',
      'CI_060',
      'CI_080',
      'CI_081',
      'CI_082',
      'CI_083',
      'CI_084'
    ],
    'cetasikaIds': [
      'CS_CETANA',
      'CS_LOBHA',
      'CS_DOSA',
      'CS_MOHA',
      'CS_SADDHA',
      'CS_ALOBHA',
      'CS_ADOSA'
    ],
    'kammaIds': [
      'KM_T_01',
      'KM_T_02',
      'KM_T_03',
      'KM_T_04',
      'KM_P_01',
      'KM_P_02',
      'KM_P_03',
      'KM_P_04',
      'KM_U_01',
      'KM_U_02',
      'KM_U_03',
      'KM_U_04',
      'KM_Q_01',
      'KM_Q_02',
      'KM_Q_03',
      'KM_Q_04'
    ],
  },
  {
    'id': 'M7_SIEU_THE',
    'title': 'Tâm Siêu Thế (40)',
    'titlePali': 'Lokuttara Citta (40)',
    'description': '40 Tâm Siêu Thế = 8 loại x 5 bậc thiền. 8 loại: 4 Đạo (Sotāpatti, Sakadāgāmi, Anāgāmi, Arahatta) + 4 Quả. Mỗi loại có 5 sắc thái thiền: Sơ (Tầm Tứ Hỷ Lạc Định) → Nhị (Tứ Hỷ Lạc Định) → Tam (Hỷ Lạc Định) → Tứ (Lạc Định) → Ngũ (Xả Định).\n\n'
        'Đạo Tâm: chỉ sanh 1 sát-na duy nhất, làm phận sự đoạn kiết sử. Phala Tâm: có thể nhập Phala-samāpatti hàng tháng để hưởng an lạc Niết Bàn.\n\n'
        'Nhập Lưu: đoạn Thân Kiến-Hoài Nghi-Giới Cấm Thủ, không đọa ác đạo, tối đa 7 kiếp.\n'
        'Nhất Lai: giảm Tham Sân thô, còn 1 kiếp Dục Giới.\n'
        'Bất Lai: đoạn Dục Ái + Sân, không về Dục Giới, sanh Tịnh Cư Thiên.\n'
        'A-la-hán: đoạn 5 thượng phần (Sắc Ái, Vô Sắc Ái, Mạn, Trạo Cử, Vô Minh), không tạo nghiệp mới, quả là Kiriya, nhập Bát Niết Bàn.\n\n'
        'Lộ Siêu Thế (Maggavīthi): Parikamma-Upacāra-Anuloma-Gotrabhū (Chuẩn bị- Cận Hành-Thuận Thứ-Chuyển Tộc, là 4 Mahākusala/Kriyā Trí) → Magga (1 sát-na) → Phala (2-3 sát-na) → Bhavanga. Niết Bàn là cảnh (Ārammaṇa) của cả Đạo và Quả.',
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
    'title': '12 Nhân Duyên (Toát Yếu)',
    'titlePali': 'Paṭicca-samuppāda Saṅkhepa',
    'description': 'Toát Yếu Duyên Khởi: 12 chi tóm thành 20 chi, 3 thời, 2 căn, 3 vòng, 4 tóm lược.\n\n'
        '12 Chi: 1.Av masses 2.Hành 3.Thức 4.Danh Sắc 5.Lục Nhập 6.Xúc 7.Thọ 8.Ái 9.Thủ 10.Hữu 11.Sanh 12.Lão Tử (+Sầu Bi Khổ Ưu Não).\n\n'
        '3 Thời: Quá khứ (1-2: Vô Minh-Hành là nhân), Hiện tại (3-10: 5 Quả 3-7 + 3 Nhân 8-10), Tương lai (11-12: Quả).\n'
        '2 Căn (Mūla): Vô Minh (gốc quá khứ) và Ái (gốc hiện tại) - như rễ cây và nhựa sống.\n'
        '3 Vòng (Vaṭṭa): Phiền Não (Avijjā-Taṇhā-Upādāna) → Nghiệp (Saṅkhāra-Bhava) → Quả (Viññāṇa...Vedanā-Jāti-Jarā) xoay không đầu.\n\n'
        '4 Tóm Lược: Nhân quá khứ (5: Vô Minh-Hành-Ái-Thủ-Hữu), Quả hiện tại (5: Thức-Danh Sắc-Lục Nhập-Xúc-Thọ), Nhân hiện tại (5: Ái-Thủ-Hữu-Vô Minh-Hành), Quả tương lai (5: Thức...Lão Tử).\n'
        '20 Chi Tóm Lược quét 3 vòng 12 chi nhưng đủ để thấy tính vô ngã - chỉ pháp, không có chúng sinh.\n\n'
        'Thực hành: Dừng tại Thọ (Vedanā) bằng chánh niệm - không cho Thọ duyên Ái. Đoạn Ái (Nhập Lưu diệt Kiến Thủ, Nhất Lai giảm Tham, Bất Lai diệt Dục Ái, A-la-hán diệt Hữu-Vô Hữu Ái) và Vô Minh (Tuệ Đạo) = Niết Bàn.',
    'prerequisiteIds': ['M6_NGHIEP'],
    'recommendedOrder': 8,
    'colorCode': 0xFF4A1A8B,
    'icon': '🔄',
    'isRequired': false,
    'phase': 2,
    'cittaIds': [
      'CI_001',
      'CI_002',
      'CI_009',
      'CI_010',
      'CI_011',
      'CI_012',
      'CI_055',
      'CI_056',
      'CI_063',
      'CI_064',
      'CI_065',
      'CI_066',
      'CI_067',
      'CI_068',
      'CI_069',
      'CI_070'
    ],
    'cetasikaIds': [
      'CS_MOHA',
      'CS_CETANA',
      'CS_PHASSA',
      'CS_VEDANA',
      'CS_LOBHA',
      'CS_DITTHI'
    ],
    'paticcaIds': [
      'PD_01',
      'PD_02',
      'PD_03',
      'PD_04',
      'PD_05',
      'PD_06',
      'PD_07',
      'PD_08',
      'PD_09',
      'PD_10',
      'PD_11',
      'PD_12'
    ],
  },
  {
    'id': 'M9_SAC_PHAP',
    'title': 'Sắc Pháp (28)',
    'titlePali': 'Rūpa Dhamma',
    'description': '28 Sắc Pháp chia 4 nhóm lớn: 4 Đại Hiển (Mahābhūta) là nền tảng, 5 Sắc Thần Kinh (Pasāda), 7 Sắc Cảnh (Gocara - Sắc, Thinh, Khí, Vị, Xúc là 3 Đại), 5 Sắc Đặc Biệt (Bhāva 2, Hadaya 1, Jīvita 1, Āhāra 1), 1 Hư Không Giới, 2 Biểu Tri, 3 Biến Hóa (Lahutā-Mudutā-Kammaññatā), 4 Tướng (Upacaya-Santati-Jaratā-Aniccatā).\n\n'
        'Sắc tụ thành đoàn 8-12 sắc gọi là Kalāpa (tổng hợp sắc). 9 Kalāpa do Nghiệp tạo (cơ thể), 8 do Tâm tạo (cử động, nói), 4 do thời tiết (Utu), 2 do vật thực (Ojā). Tuổi thọ sắc = 17 sát-na tâm = 51 sắc tiểu sát-na. Cõi Vô Sắc không có sắc.\n\n'
        'Học Rūpa để thấy thân này là sắc do 4 nhân tạo - vô ngã, vô thường, là đối tượng của thiền định (niệm thân) và quán.',
    'prerequisiteIds': ['M8_NHAN_DUYEN'],
    'recommendedOrder': 9,
    'colorCode': 0xFF1A4A8B,
    'icon': '🧱',
    'isRequired': false,
    'phase': 3,
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
    'rupaIds': [
      'RP_001',
      'RP_002',
      'RP_003',
      'RP_004',
      'RP_005',
      'RP_006',
      'RP_007',
      'RP_008',
      'RP_009',
      'RP_010',
      'RP_011',
      'RP_012',
      'RP_013',
      'RP_014',
      'RP_015',
      'RP_016',
      'RP_017',
      'RP_018',
      'RP_019',
      'RP_020',
      'RP_021',
      'RP_022',
      'RP_023',
      'RP_024',
      'RP_025',
      'RP_026',
      'RP_027',
      'RP_028'
    ],
  },
  {
    'id': 'M10_LO_TRINH',
    'title': 'Lộ Trình Tâm (17 Sát-na)',
    'titlePali': 'Vīthicitta (17) & Vīthimutta (3)',
    'description': 'Vīthi = Lộ trình nhận thức qua 6 môn. Vīthimutta = Ngoài lộ (Tục Sinh-Hộ Kiếp-Tử).\n\n'
        'Ngũ Môn Lộ (Pañcadvāra) có 4 loại theo cảnh lớn nhỏ:\n'
        '- Atimahanta (Rất Lớn): 17 sát-na: Atīta-Bhavaṅga + Calana + Upaccheda + Pañcadvārāvajjana + Dvipañca-viññāṇa + Sampaṭicchana + Santīraṇa + Voṭṭhapana + 7 Javana + 2 Tadārammaṇa + Bhavanga. Chỉ lộ này có Tadā.\n'
        '- Mahanta (Lớn): đủ 7 Javana, không Tadā.\n'
        '- Paritta (Nhỏ): đến Voṭṭhapana rồi rơi vào Bhavanga, không có Javana (cảnh quá yếu).\n'
        '- Atiparitta (Rất nhỏ): chỉ rúng động Bhavanga rồi dứt, không thành lộ.\n\n'
        'Ý Môn Lộ (Manodvāra) có 2 nhánh:\n'
        '- Anubandha (phụ thuộc): tiếp nối sau Ngũ Môn để biết rõ cảnh ngũ vừa qua.\n'
        '- Paṭibhāga (độc lập): suy nghĩ, nhớ, tưởng tượng, thiền Samatha-Vipassanā.\n'
        'Cấu trúc: Calana-Upaccheda-Manodvārāvajjana (kiêm Voṭṭhapana) + 7 Javana + (2 Tadā). 7 Javana chính là nơi tạo Kamma (J1=Hiện Báo, J7=Hậu Báo, J2-6=Hậu Hậu Báo).\n\n'
        'Appanā-vīthi (An Chỉ): đắc thiền (Jhāna) và Siêu Thế (Magga). Lộ Siêu Thế: Parikamma-Upacāra-Anuloma-Gotrabhū (Chuẩn bị) + Magga (1) + Phala (2-3) + Bhavanga.\n\n'
        'Vīthimutta (3): Paṭisandhi (tục sinh) - sát-na đầu kiếp, Bhavanga (hộ kiếp - dòng vô thức giữa các lộ, ví như sông), Cuti (tử) - sát-na cuối, Rūpa-Jīvita + Nāma-Jīvita diệt. Cả 3 dùng cùng 1 tâm quả (19 loại: 2 Santīraṇa Upekkhā + 8 Mahāvipāka + 9 Mahaggata Vipāka). Vīthimutta là quả, không tạo nghiệp mới.\n\n'
        'Hiểu Vīthi để thấy: Tâm sanh-diệt chớp nhoáng, không có Ngã, chỉ có tiến trình pháp. Thực hành hộ trì 6 căn ngay tại Voṭṭhapana-Javana để không tạo bất thiện.',
    'prerequisiteIds': ['M9_SAC_PHAP'],
    'recommendedOrder': 10,
    'colorCode': 0xFF2D6A8F,
    'icon': '📊',
    'isRequired': false,
    'phase': 3,
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
      'CI_013',
      'CI_014',
      'CI_015',
      'CI_016',
      'CI_017',
      'CI_018',
      'CI_019',
      'CI_025',
      'CI_026',
      'CI_027',
      'CI_028',
      'CI_029',
      'CI_030',
      'CI_055',
      'CI_056',
      'CI_063',
      'CI_064',
      'CI_065',
      'CI_066',
      'CI_067',
      'CI_068',
      'CI_069',
      'CI_070'
    ],
    'vithiIds': [
      'VT_NGU_MON_RATLON',
      'VT_NGU_MON_LON',
      'VT_Y_MON',
      'VT_VITHIMUTTA'
    ],
  },
];
