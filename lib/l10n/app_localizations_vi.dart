// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'AbhiDhamma';

  @override
  String get appTagline => 'Abhidhamma Piṭaka';

  @override
  String get initializing => 'Đang khởi tạo…';

  @override
  String get loadingDoctrineData => 'Đang tải và kiểm tra dữ liệu giáo lý…';

  @override
  String get loadingTakingLonger =>
      'Quá trình khởi động đang mất nhiều thời gian hơn dự kiến. Có thể dữ liệu giáo lý đang được tối ưu cho thiết bị của bạn.';

  @override
  String get unknownError => 'Lỗi không xác định';

  @override
  String get dataError => 'Lỗi dữ liệu';

  @override
  String get invalidData => 'Dữ liệu không hợp lệ';

  @override
  String get invalidDataDescription =>
      'Hệ thống phát hiện vi phạm quy tắc giáo lý. Vui lòng liên hệ đội biên soạn để kiểm tra lại dữ liệu.';

  @override
  String get navMatrix => 'Bảng Tương Ưng';

  @override
  String get navStudy => 'Học Tập';

  @override
  String get navConditions => 'Nhân Duyên';

  @override
  String get navMindProcess => 'Lộ Trình Tâm';

  @override
  String get navSettings => 'Cài Đặt';

  @override
  String get cancel => 'Hủy';

  @override
  String get save => 'Lưu';

  @override
  String get delete => 'Xóa';

  @override
  String get close => 'Đóng';

  @override
  String get start => 'Bắt đầu';

  @override
  String get next => 'Tiếp theo';

  @override
  String get done => 'Xong';

  @override
  String get skip => 'Bỏ qua';

  @override
  String get apply => 'Áp dụng';

  @override
  String get undo => 'Hoàn tác';

  @override
  String get reset => 'Đặt lại';

  @override
  String get all => 'Tất cả';

  @override
  String get hide => 'Ẩn';

  @override
  String get learn => 'Học';

  @override
  String get notes => 'Ghi chú';

  @override
  String errorWithMessage(Object message) {
    return 'Lỗi: $message';
  }

  @override
  String get languageSection => 'Ngôn ngữ';

  @override
  String get interfaceLanguage => 'Ngôn ngữ giao diện';

  @override
  String get interfaceLanguageSubtitle =>
      'Theo ngôn ngữ thiết bị hoặc chọn thủ công';

  @override
  String get contentLanguage => 'Ngôn ngữ nội dung học';

  @override
  String get contentLanguageSubtitle => 'Độc lập với ngôn ngữ giao diện';

  @override
  String get systemDefault => 'Theo hệ thống';

  @override
  String get systemDefaultSubtitle => 'Dùng ngôn ngữ được chọn trên thiết bị';

  @override
  String get languagePickerTitle => 'Language / Ngôn ngữ';

  @override
  String get languagePickerSearchHint => 'Tìm theo tên hoặc mã ngôn ngữ';

  @override
  String get languageChangePreviewTitle => 'Đổi ngôn ngữ giao diện?';

  @override
  String languageChangePreviewBody(Object language) {
    return 'Giao diện sẽ chuyển sang $language. Ngôn ngữ nội dung học không thay đổi.';
  }

  @override
  String languageChangedTo(Object language) {
    return 'Đã đổi ngôn ngữ sang $language';
  }

  @override
  String get holdGlobeToReset =>
      'Nhấn giữ quả địa cầu 3 giây để khôi phục ngôn ngữ hệ thống';

  @override
  String get restoredSystemLanguage => 'Đã khôi phục ngôn ngữ hệ thống';

  @override
  String get contentVietnamese => 'Tiếng Việt';

  @override
  String get contentEnglish => 'Tiếng Anh';

  @override
  String get translationReviewNotice =>
      'Nội dung giáo lý tiếng Anh là bản dịch học tập quốc tế. Thuật ngữ Pāḷi vẫn là căn cứ chính.';

  @override
  String get settingsAccessibility => 'Trợ năng';

  @override
  String get highContrastMode => 'Chế độ tương phản cao';

  @override
  String get highContrastSubtitle =>
      'Tăng độ tương phản màu sắc cho người khó nhìn';

  @override
  String get screenReaderHints => 'Gợi ý trình đọc màn hình';

  @override
  String get screenReaderHintsSubtitle =>
      'Mô tả chi tiết hơn cho TalkBack và VoiceOver';

  @override
  String get textSize => 'Cỡ chữ';

  @override
  String get textScale => 'Tỉ lệ chữ';

  @override
  String get studyProgress => 'Tiến độ học tập';

  @override
  String get unlockAllLessons => 'Mở khóa tất cả bài học';

  @override
  String get unlockAllLessonsSubtitle =>
      'Lộ trình tuần tự giúp xây dựng nền tảng vững chắc. Người đã có kiến thức nền có thể mở khóa toàn bộ bài học.';

  @override
  String get resetProgress => 'Đặt lại tiến độ';

  @override
  String get resetProgressSubtitle => 'Xóa toàn bộ dữ liệu học tập';

  @override
  String get showDataWarningAgain => 'Hiện lại cảnh báo dữ liệu';

  @override
  String get showDataWarningAgainSubtitle =>
      'Bật lại banner cảnh báo Bảng Tương Ưng';

  @override
  String get dataWarningEnabled => 'Đã bật lại cảnh báo dữ liệu';

  @override
  String get aboutApp => 'Về ứng dụng';

  @override
  String get version => 'Phiên bản';

  @override
  String get sourceMaterial => 'Nguồn tài liệu';

  @override
  String get sourceMaterialValue => 'Giáo trình King Milanda A — Abhidhamma';

  @override
  String get editorialPrinciples => 'Nguyên tắc biên soạn';

  @override
  String get resetProgressQuestion => 'Đặt lại tiến độ?';

  @override
  String get resetProgressWarning =>
      'Toàn bộ tiến độ học tập và điểm quiz sẽ bị xóa. Hành động này không thể hoàn tác.';

  @override
  String get progressResetSuccess => 'Đã đặt lại tiến độ học tập';

  @override
  String get unlockLessonsQuestion => 'Mở khóa tất cả bài học?';

  @override
  String get unlockLessonsWarning =>
      'Lộ trình tuần tự là cách hiệu quả để xây dựng nền tảng Abhidhamma vững chắc. Tùy chọn này dành cho người đã có kiến thức nền.';

  @override
  String get keepGuidedPath => 'Giữ lộ trình';

  @override
  String get unlock => 'Mở khóa';

  @override
  String modulesCompleted(Object completed, Object total) {
    return '$completed / $total module hoàn thành';
  }

  @override
  String mostRecentModule(Object module) {
    return 'Module gần nhất: $module';
  }

  @override
  String lastStudied(Object date) {
    return 'Học lần cuối: $date';
  }

  @override
  String get today => 'Hôm nay';

  @override
  String get yesterday => 'Hôm qua';

  @override
  String daysAgo(Object count) {
    return '$count ngày trước';
  }

  @override
  String get onboardingVisualTitle => 'Thấy Bằng Mắt';

  @override
  String get onboardingVisualSubtitle => 'Bảng Tương Ưng Tâm × Tâm Sở';

  @override
  String get onboardingVisualBody =>
      'Khám phá 121 Tâm và 52 Tâm Sở trong Bảng Tương Ưng tương tác. Màu sắc, hình dạng và chữ giúp mọi người tiếp cận các mối tương ưng.';

  @override
  String get onboardingCausalityTitle => 'Hiểu Bằng Tim';

  @override
  String get onboardingCausalitySubtitle => 'Dòng Chảy Nhân Duyên';

  @override
  String get onboardingCausalityBody =>
      'Khám phá mười hai chi Nhân Duyên và các cách phân loại Nghiệp qua những góc nhìn học tập kết nối.';

  @override
  String get onboardingExploreTitle => 'Tự Mình Khám Phá';

  @override
  String get onboardingExploreSubtitle => 'Lộ Trình Học Phi Tuyến';

  @override
  String get onboardingExploreBody =>
      'Tự chọn hướng đi qua mười module liên kết. Active Recall, quiz và ôn tập giúp kiến thức bền lâu.';

  @override
  String get beginExploring => 'Bắt đầu khám phá';

  @override
  String get matrixTitle => 'Bảng Tương Ưng Abhidhamma';

  @override
  String matrixSemantics(Object count) {
    return 'Bảng Tương Ưng Abhidhamma đang hiển thị $count Tâm';
  }

  @override
  String get rotateScreen => 'Xoay màn hình';

  @override
  String get rotationHint =>
      'Nếu màn hình không xoay, hãy bật Xoay tự động trong cài đặt thiết bị.';

  @override
  String get highContrast => 'Tương phản cao';

  @override
  String get help => 'Hướng dẫn';

  @override
  String get searchCittaCetasika => 'Tìm Tâm hoặc Tâm Sở…';

  @override
  String get clearSearch => 'Xóa tìm kiếm';

  @override
  String get citta => 'Tâm';

  @override
  String get cetasika => 'Tâm Sở';

  @override
  String get unwholesome => 'Bất Thiện';

  @override
  String get rootless => 'Vô Nhân';

  @override
  String get senseSphereBeautiful => 'Tịnh Hảo Dục Giới';

  @override
  String get formSphere => 'Sắc Giới';

  @override
  String get formlessSphere => 'Vô Sắc Giới';

  @override
  String get supramundane => 'Siêu Thế';

  @override
  String get legend => 'Ký hiệu:';

  @override
  String get associationAlways => 'Cố định';

  @override
  String get associationSometimes => 'Bất định';

  @override
  String get associationNever => 'Không có';

  @override
  String dataWarningsCount(Object count) {
    return '$count cảnh báo dữ liệu';
  }

  @override
  String get matrixHelpTitle => 'Hướng dẫn Bảng Tương Ưng';

  @override
  String get howToRead => 'Cách đọc:';

  @override
  String get matrixHelpRead =>
      '• Hàng: Tâm (Citta)\n• Cột: Tâm Sở (Cetasika)\n• Ô giao nhau: mối tương ưng';

  @override
  String get symbols => 'Ký hiệu:';

  @override
  String get matrixHelpSymbols => '✦ = Cố định\n◎ = Bất định\n✕ = Không có';

  @override
  String get tips => 'Mẹo:';

  @override
  String get matrixHelpTips =>
      '• Nhấn Tâm để xem chi tiết\n• Nhấn Tâm Sở để xem xung đột\n• Dùng bộ lọc để thu hẹp\n• Xoay ngang để xem rộng hơn';

  @override
  String get understood => 'Đã hiểu';

  @override
  String get dataWarningTitle => 'Cảnh báo dữ liệu';

  @override
  String get allFilters => 'Tất cả';

  @override
  String get defilements => 'Phiền Não';

  @override
  String get kamma => 'Nghiệp';

  @override
  String get result => 'Quả';

  @override
  String get conditionsTitle => 'Nhân Duyên';

  @override
  String get conditionDetails => 'Chi tiết Nhân Duyên:';

  @override
  String get lastConditionDescription =>
      'Đây là chi quả cuối của vòng Nhân Duyên kiếp này và không khởi sanh điều kiện mới.';

  @override
  String conditionLinkDescription(Object effect, Object explanation) {
    return '• Duyên sang: $effect\n  Giải thích: $explanation';
  }

  @override
  String get kammaTitle => 'Nghiệp (Kamma)';

  @override
  String get mindProcessTitle => 'Lộ Trình Tâm';

  @override
  String get paliLabel => 'Pāḷi:';

  @override
  String get stopPronunciation => 'Dừng phát âm';

  @override
  String get listenPaliPronunciation => 'Nghe phát âm Pāḷi';

  @override
  String get ttsUnavailable => 'Thiết bị không hỗ trợ phát âm TTS.';

  @override
  String get dragHandleSemantics => 'Thanh kéo để thay đổi kích thước';

  @override
  String cittaNumber(Object number) {
    return 'Tâm số $number';
  }

  @override
  String get doctrine => 'Giáo lý';

  @override
  String get examples => 'Ví dụ';

  @override
  String fixedCetasikasCount(Object count) {
    return 'Tâm Sở Cố Định ($count)';
  }

  @override
  String variableCetasikasCount(Object count) {
    return 'Tâm Sở Bất Định ($count)';
  }

  @override
  String get personalNote => 'Ghi chú cá nhân';

  @override
  String get personalNoteHint => 'Nhập ghi chú của bạn…';

  @override
  String get wholesome => 'Thiện';

  @override
  String get functional => 'Duy Tác';

  @override
  String get pleasantFeeling => 'Lạc thọ';

  @override
  String get unpleasantFeeling => 'Khổ thọ';

  @override
  String get neutralFeeling => 'Xả thọ';

  @override
  String get joyfulFeeling => 'Hỷ thọ';

  @override
  String get alwaysAssociated => 'Luôn phối hợp';

  @override
  String get mayBeAssociated => 'Có thể có';

  @override
  String get fourfoldDefinition => 'Tứ Nghĩa';

  @override
  String get characteristic => 'Đặc tướng';

  @override
  String get functionLabel => 'Phận sự';

  @override
  String get manifestation => 'Thành tựu';

  @override
  String get proximateCause => 'Nhân gần';

  @override
  String get doctrinalConflicts => 'Xung đột giáo lý';

  @override
  String rulesCount(Object count) {
    return '$count quy tắc';
  }

  @override
  String get universalCetasikas => '7 Tâm Sở Biến Hành';

  @override
  String get occasionalCetasikas => '6 Tâm Sở Biệt Cảnh';

  @override
  String get unwholesomeCetasikas => '14 Tâm Sở Bất Thiện';

  @override
  String get beautifulCetasikas => '25 Tâm Sở Tịnh Hảo';

  @override
  String rowCittaSemantics(Object displayIndex, Object name, Object order,
      Object group, Object feeling, Object action) {
    return 'Tâm hàng $displayIndex: $name; số gốc $order; nhóm $group; thọ $feeling. $action';
  }

  @override
  String cetasikaSemantics(
      Object name, Object pali, Object group, Object state) {
    return 'Tâm Sở $name ($pali), nhóm $group. $state Nhấn để xem chi tiết.';
  }

  @override
  String get selected => 'Đang được chọn';

  @override
  String get dimmedByConflict => 'Bị mờ do xung đột';

  @override
  String get matrixCornerSemantics => 'Góc bảng: hàng là Tâm và cột là Tâm Sở';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: Tâm $cittaId với Tâm Sở $cetasikaId';
  }

  @override
  String get tapForDetails => 'Nhấn để xem chi tiết';

  @override
  String get studyPath => 'Lộ Trình Học';

  @override
  String get bookmarksAndNotes => 'Bookmark & Ghi chú';

  @override
  String get overallProgress => 'Tiến độ tổng quan';

  @override
  String savedItemsCount(Object count) {
    return '$count mục đã lưu';
  }

  @override
  String get cittaTab => 'Tâm';

  @override
  String get cetasikaTab => 'Tâm Sở';

  @override
  String get notesTab => 'Ghi chú';

  @override
  String get noBookmarkedCittas => 'Chưa có Tâm nào được bookmark';

  @override
  String get bookmarkCittaHint =>
      'Vào màn hình học và nhấn biểu tượng bookmark để lưu';

  @override
  String get loadingCittas => 'Đang tải dữ liệu Tâm…';

  @override
  String get noBookmarkedCetasikas => 'Chưa có Tâm Sở nào được bookmark';

  @override
  String get loadingCetasikas => 'Đang tải dữ liệu Tâm Sở…';

  @override
  String get noNotes => 'Chưa có ghi chú nào';

  @override
  String get addNoteHint =>
      'Nhấn biểu tượng sửa trong màn hình học để thêm ghi chú cá nhân';

  @override
  String get deleteNoteQuestion => 'Xóa ghi chú?';

  @override
  String get deleteNoteWarning =>
      'Ghi chú này sẽ bị xóa vĩnh viễn. Bạn có chắc không?';

  @override
  String get addNote => 'Thêm ghi chú';

  @override
  String get removeBookmark => 'Xóa bookmark';

  @override
  String get editNote => 'Sửa ghi chú';

  @override
  String get deleteNote => 'Xóa ghi chú';

  @override
  String get noteUpdated => 'Đã cập nhật ghi chú';

  @override
  String get noteSaved => 'Đã lưu ghi chú';

  @override
  String get editNoteTitle => 'Sửa ghi chú';

  @override
  String get addNoteTitle => 'Thêm ghi chú';

  @override
  String get studyNoteHint =>
      'Nhập ghi chú của bạn về mục này…\n\nVí dụ: Tâm này xuất hiện trong lúc thiền định khi…';

  @override
  String charactersCount(Object current, Object maximum) {
    return '$current / $maximum ký tự';
  }

  @override
  String get update => 'Cập nhật';

  @override
  String get saveNote => 'Lưu ghi chú';

  @override
  String studyProgressPercent(Object percent) {
    return 'Tiến độ học tập: $percent%';
  }

  @override
  String get modulesCompletedShort => 'Module\nhoàn thành';

  @override
  String get recommendedNext => 'Nên học tiếp';

  @override
  String get progressOverview => 'Tổng Quan Tiến Độ';

  @override
  String get totalModules => 'Tổng modules';

  @override
  String get dueForReview => 'Cần ôn tập';

  @override
  String get learnTab => 'Học';

  @override
  String get reviewTab => 'Ôn Tập';

  @override
  String get testTab => 'Kiểm Tra';

  @override
  String get moduleHasNoData =>
      'Module này chưa có dữ liệu Tâm/Tâm Sở. Vui lòng kiểm tra dữ liệu JSON.';

  @override
  String cittasInModule(Object count) {
    return 'Tâm trong module — $count';
  }

  @override
  String cetasikasInModule(Object count) {
    return 'Tâm Sở trong module — $count';
  }

  @override
  String reviewCetasikaQuestion(Object name, Object pali) {
    return 'Tâm Sở “$name” ($pali) có nghĩa là gì?';
  }

  @override
  String groupAnswer(Object group) {
    return 'Nhóm: $group';
  }

  @override
  String reviewCittaQuestion(Object name) {
    return 'Tâm “$name” thuộc nhóm nào và có thọ gì?';
  }

  @override
  String cittaReviewAnswer(Object sphere, Object feeling, Object pali) {
    return 'Cõi: $sphere\nThọ: $feeling\nPāḷi: $pali';
  }

  @override
  String get noReviewContent =>
      'Module này chưa có nội dung ôn tập. Hãy quay lại sau.';

  @override
  String reviewedCount(Object revealed, Object total) {
    return '$revealed / $total đã xem';
  }

  @override
  String get reviewComplete =>
      'Bạn đã ôn tập tất cả nội dung. Hãy làm Quiz để kiểm tra.';

  @override
  String get tapToReveal => 'Nhấn để xem câu trả lời';

  @override
  String answerLabel(Object answer) {
    return 'Câu trả lời: $answer';
  }

  @override
  String get revealAnswer => 'Hiện đáp án';

  @override
  String moduleQuizTitle(Object module) {
    return 'Kiểm Tra\n$module';
  }

  @override
  String moduleContentCount(Object count) {
    return '$count nội dung trong module';
  }

  @override
  String get quizMaximumDescription =>
      'Tối đa 10 câu hỏi trắc nghiệm tổng hợp kiến thức trong module';

  @override
  String get startQuiz => 'Bắt đầu Quiz';

  @override
  String cittasCount(Object count) {
    return '$count Tâm';
  }

  @override
  String cetasikasCount(Object count) {
    return '$count Tâm Sở';
  }

  @override
  String noteForItem(Object name) {
    return 'Ghi chú: $name';
  }

  @override
  String get chooseLevel => 'Chọn cấp độ';

  @override
  String quizLevelDescription(Object count) {
    return 'Mỗi cấp độ sinh tối đa $count câu hỏi từ module này';
  }

  @override
  String get insufficientQuizData =>
      'Module này chưa đủ dữ liệu để tạo câu hỏi.';

  @override
  String get explanation => 'Giải thích';

  @override
  String get nextQuestion => 'Câu tiếp theo';

  @override
  String get viewResults => 'Xem kết quả';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total câu đúng';
  }

  @override
  String get quizExcellent => 'Xuất sắc! Bạn đã nắm vững module này.';

  @override
  String get quizTryAgain => 'Hãy ôn lại và thử lại nhé!';

  @override
  String get tryAgain => 'Làm lại';

  @override
  String quizInsufficientDataMessage(Object module) {
    return 'Module “$module” chưa đủ dữ liệu để tạo câu hỏi.';
  }

  @override
  String get quizTypeCetasikaGroup => 'Phân loại Tâm Sở';

  @override
  String get quizTypeFeeling => 'Nhận diện Thọ';

  @override
  String get quizTypeConflict => 'Xung đột giáo lý';

  @override
  String get quizTypeSphere => 'Cõi giới';

  @override
  String get beginner => 'Sơ cấp';

  @override
  String get beginnerDescription => 'Nhóm Tâm Sở và Thọ cơ bản';

  @override
  String get intermediate => 'Trung cấp';

  @override
  String get intermediateDescription => 'Bao gồm xung đột Tâm Sở';

  @override
  String get advanced => 'Nâng cao';

  @override
  String get advancedDescription => 'Bao gồm Cõi Giới và mọi loại câu hỏi';

  @override
  String get trueLabel => 'Đúng';

  @override
  String get falseLabel => 'Sai';

  @override
  String get trueOrFalse => 'Đúng hay Sai?';

  @override
  String quizCetasikaGroupQuestion(Object name, Object pali) {
    return 'Tâm Sở “$name” ($pali) thuộc nhóm nào?';
  }

  @override
  String quizCetasikaGroupExplanation(
      Object name, Object group, Object description) {
    return '“$name” thuộc $group.\n$description';
  }

  @override
  String quizCetasikaClaim(Object name, Object pali, Object group) {
    return '“$name” ($pali) thuộc $group. Đúng hay Sai?';
  }

  @override
  String quizCittaFeelingQuestion(Object name) {
    return 'Tâm “$name” có thọ gì?';
  }

  @override
  String quizCittaFeelingExplanation(Object name, Object feeling) {
    return '“$name” có $feeling.';
  }

  @override
  String quizCittaFeelingClaim(Object name, Object feeling) {
    return 'Tâm “$name” có $feeling. Đúng hay Sai?';
  }

  @override
  String get conflictNo => 'Không — chúng xung đột nhau';

  @override
  String get conflictAlwaysYes => 'Có — luôn xuất hiện cùng nhau';

  @override
  String get conflictSometimesYes => 'Có — đôi khi cùng xuất hiện';

  @override
  String quizConflictQuestion(Object first, Object second) {
    return '“$first” và “$second” có thể cùng xuất hiện trong một tâm không?';
  }

  @override
  String quizSphereQuestion(Object name) {
    return 'Tâm “$name” thuộc cõi giới nào?';
  }

  @override
  String quizSphereExplanation(Object name, Object sphere) {
    return '“$name” thuộc $sphere.';
  }

  @override
  String quizSphereClaim(Object name, Object sphere) {
    return 'Tâm “$name” thuộc $sphere. Đúng hay Sai?';
  }

  @override
  String get phaseFoundation => 'Pha 1 — Nền tảng';

  @override
  String get phaseCausality => 'Pha 2 — Nhân quả';

  @override
  String get phaseMastery => 'Pha 3 — Làm chủ';

  @override
  String get contentFallbackNotice =>
      'Mục này chưa được dịch; đang hiển thị nội dung học tiếng Anh.';
}
