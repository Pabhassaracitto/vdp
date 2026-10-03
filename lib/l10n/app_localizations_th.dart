// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'AbhiDhamma';

  @override
  String get appTagline => 'Abhidhamma Piṭaka';

  @override
  String get initializing => 'Initializing…';

  @override
  String get loadingDoctrineData => 'Loading and validating Dhamma data…';

  @override
  String get loadingTakingLonger =>
      'Startup is taking longer than expected. Dhamma data may be being optimized for your device.';

  @override
  String get unknownError => 'Unknown error';

  @override
  String get dataError => 'Data error';

  @override
  String get invalidData => 'Invalid data';

  @override
  String get invalidDataDescription =>
      'The system detected a violation of the Dhamma validation rules. Please contact the editorial team to review the data.';

  @override
  String get navMatrix => 'ตาราง';

  @override
  String get navStudy => 'ศึกษา';

  @override
  String get navConditions => 'ปฏิจจสมุปบาท';

  @override
  String get navMindProcess => 'วิถีจิต';

  @override
  String get navSettings => 'การตั้งค่า';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get save => 'บันทึก';

  @override
  String get delete => 'ลบ';

  @override
  String get close => 'ปิด';

  @override
  String get start => 'เริ่ม';

  @override
  String get next => 'ถัดไป';

  @override
  String get done => 'เสร็จ';

  @override
  String get skip => 'ข้าม';

  @override
  String get apply => 'ใช้';

  @override
  String get undo => 'เลิกทำ';

  @override
  String get reset => 'รีเซ็ต';

  @override
  String get all => 'ทั้งหมด';

  @override
  String get hide => 'Hide';

  @override
  String get learn => 'เรียน';

  @override
  String get notes => 'บันทึก';

  @override
  String errorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get languageSection => 'ภาษา';

  @override
  String get interfaceLanguage => 'ภาษาของหน้าจอ';

  @override
  String get interfaceLanguageSubtitle => 'ใช้ภาษาของอุปกรณ์หรือเลือกเอง';

  @override
  String get contentLanguage => 'ภาษาเนื้อหาการเรียน';

  @override
  String get contentLanguageSubtitle => 'แยกจากภาษาของหน้าจอ';

  @override
  String get systemDefault => 'ตามระบบ';

  @override
  String get systemDefaultSubtitle => 'ใช้ภาษาที่เลือกไว้ในอุปกรณ์';

  @override
  String get languagePickerTitle => 'ภาษา';

  @override
  String get languagePickerSearchHint => 'ค้นหาชื่อหรือรหัสภาษา';

  @override
  String get languageChangePreviewTitle => 'เปลี่ยนภาษาของหน้าจอหรือไม่';

  @override
  String languageChangePreviewBody(Object language) {
    return 'The interface will change to $language. Learning content remains unchanged.';
  }

  @override
  String languageChangedTo(Object language) {
    return 'Language changed to $language';
  }

  @override
  String get holdGlobeToReset =>
      'Press and hold the globe for 3 seconds to restore the system language';

  @override
  String get restoredSystemLanguage => 'Restored the system language';

  @override
  String get contentVietnamese => 'ภาษาเวียดนาม';

  @override
  String get contentEnglish => 'ภาษาอังกฤษ';

  @override
  String get translationReviewNotice =>
      'เนื้อหาธรรมะในภาษานี้เป็นคำแปลเพื่อการศึกษาระดับสากล ศัพท์บาลียังคงเป็นหลักอ้างอิง';

  @override
  String get contentDraftNotice =>
      'คำแปลนี้เป็นฉบับร่าง รอการตรวจทานด้านหลักธรรม โปรดตรวจสอบกับบาลีก่อนนำไปอ้างอิง';

  @override
  String get settingsAccessibility => 'การช่วยการเข้าถึง';

  @override
  String get highContrastMode => 'โหมดความต่างสีสูง';

  @override
  String get highContrastSubtitle =>
      'เพิ่มความต่างสีสำหรับผู้มีสายตาเลือนราง';

  @override
  String get screenReaderHints => 'Screen reader hints';

  @override
  String get screenReaderHintsSubtitle =>
      'ให้รายละเอียดเพิ่มเติมสำหรับ TalkBack และ VoiceOver';

  @override
  String get textSize => 'ขนาดตัวอักษร';

  @override
  String get textScale => 'Text scale';

  @override
  String get studyProgress => 'ความก้าวหน้า';

  @override
  String get unlockAllLessons => 'ปลดล็อกทุกบทเรียน';

  @override
  String get unlockAllLessonsSubtitle =>
      'เส้นทางแนะนำช่วยสร้างพื้นฐานที่มั่นคง ผู้เรียนที่มีประสบการณ์สามารถปลดล็อกทุกบทเรียนได้';

  @override
  String get resetProgress => 'รีเซ็ตความก้าวหน้า';

  @override
  String get resetProgressSubtitle => 'ลบข้อมูลการเรียนทั้งหมด';

  @override
  String get showDataWarningAgain => 'แสดงคำเตือนข้อมูลอีกครั้ง';

  @override
  String get showDataWarningAgainSubtitle =>
      'คืนค่าแถบคำเตือนของตาราง';

  @override
  String get dataWarningEnabled => 'เปิดใช้คำเตือนข้อมูลแล้ว';

  @override
  String get aboutApp => 'เกี่ยวกับแอป';

  @override
  String get version => 'เวอร์ชัน';

  @override
  String get sourceMaterial => 'แหล่งข้อมูล';

  @override
  String get sourceMaterialValue => 'หลักสูตรพระเจ้ามิลินท์ A — อภิธรรม';

  @override
  String get editorialPrinciples => 'หลักการบรรณาธิการ';

  @override
  String get resetProgressQuestion => 'รีเซ็ตความคืบหน้าหรือไม่?';

  @override
  String get resetProgressWarning =>
      'ความคืบหน้าและคะแนนแบบทดสอบทั้งหมดจะถูกลบ การกระทำนี้ไม่สามารถย้อนกลับได้';

  @override
  String get progressResetSuccess => 'รีเซ็ตความคืบหน้าการเรียนแล้ว';

  @override
  String get unlockLessonsQuestion => 'ปลดล็อกทุกบทเรียนหรือไม่?';

  @override
  String get unlockLessonsWarning =>
      'เส้นทางแนะนำเป็นวิธีที่ดีที่สุดในการสร้างพื้นฐานอภิธรรมที่มั่นคง ตัวเลือกนี้เหมาะสำหรับผู้เรียนที่มีประสบการณ์';

  @override
  String get keepGuidedPath => 'คงเส้นทางแนะนำไว้';

  @override
  String get unlock => 'ปลดล็อก';

  @override
  String modulesCompleted(Object completed, Object total) {
    return 'เสร็จแล้ว $completed / $total โมดูล';
  }

  @override
  String mostRecentModule(Object module) {
    return 'โมดูลล่าสุด: $module';
  }

  @override
  String lastStudied(Object date) {
    return 'เรียนล่าสุด: $date';
  }

  @override
  String get today => 'วันนี้';

  @override
  String get yesterday => 'เมื่อวาน';

  @override
  String daysAgo(Object count) {
    return '$count วันที่แล้ว';
  }

  @override
  String get onboardingVisualTitle => 'See Clearly';

  @override
  String get onboardingVisualSubtitle => 'Citta × Cetasika Matrix';

  @override
  String get onboardingVisualBody =>
      'Explore 121 cittas and 52 cetasikas in an interactive matrix. Color, shape, and text encode every association accessibly.';

  @override
  String get onboardingCausalityTitle => 'Understand Deeply';

  @override
  String get onboardingCausalitySubtitle => 'Dependent Origination';

  @override
  String get onboardingCausalityBody =>
      'Explore the twelve links of dependent origination and classifications of kamma through connected learning views.';

  @override
  String get onboardingExploreTitle => 'Discover for Yourself';

  @override
  String get onboardingExploreSubtitle => 'A Non-linear Study Path';

  @override
  String get onboardingExploreBody =>
      'Choose your path through ten connected modules. Active recall, quizzes, and review help knowledge endure.';

  @override
  String get beginExploring => 'Begin exploring';

  @override
  String get matrixTitle => 'ตารางอภิธรรม';

  @override
  String matrixSemantics(Object count) {
    return 'Abhidhamma Matrix showing $count cittas';
  }

  @override
  String get rotateScreen => 'หมุนหน้าจอ';

  @override
  String get rotationHint =>
      'หากหน้าจอไม่หมุน ให้เปิดหมุนอัตโนมัติในการตั้งค่าอุปกรณ์';

  @override
  String get highContrast => 'ความต่างสีสูง';

  @override
  String get help => 'ช่วยเหลือ';

  @override
  String get searchCittaCetasika => 'ค้นหาจิตหรือเจตสิก…';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get citta => 'จิต';

  @override
  String get cetasika => 'เจตสิก';

  @override
  String get unwholesome => 'อกุศล';

  @override
  String get rootless => 'อเหตุกะ';

  @override
  String get senseSphereBeautiful => 'กามาวจรโสภณ';

  @override
  String get formSphere => 'รูปาวจร';

  @override
  String get formlessSphere => 'อรูปาวจร';

  @override
  String get supramundane => 'โลกุตตระ';

  @override
  String get legend => 'คำอธิบาย:';

  @override
  String get associationAlways => 'เสมอ';

  @override
  String get associationSometimes => 'บางครั้ง';

  @override
  String get associationNever => 'ไม่มี';

  @override
  String dataWarningsCount(Object count) {
    return '$count data warnings';
  }

  @override
  String get matrixHelpTitle => 'คู่มือตาราง';

  @override
  String get howToRead => 'วิธีอ่าน:';

  @override
  String get matrixHelpRead =>
      '• แถว: จิต\n• คอลัมน์: เจตสิก\n• จุดตัด: ความสัมพันธ์';

  @override
  String get symbols => 'สัญลักษณ์:';

  @override
  String get matrixHelpSymbols => '✦ = ประกอบเสมอ\n◎ = ประกอบเป็นบางครั้ง\n✕ = ไม่ประกอบ';

  @override
  String get tips => 'เคล็ดลับ:';

  @override
  String get matrixHelpTips =>
      '• แตะจิตเพื่อดูรายละเอียด\n• แตะเจตสิกเพื่อดูข้อขัดกัน\n• ใช้ตัวกรองเพื่อจำกัดมุมมอง\n• หมุนหน้าจอเพื่อเพิ่มพื้นที่';

  @override
  String get understood => 'เข้าใจแล้ว';

  @override
  String get dataWarningTitle => 'Data warning';

  @override
  String get allFilters => 'ทั้งหมด';

  @override
  String get defilements => 'Defilements';

  @override
  String get kamma => 'กรรม';

  @override
  String get result => 'วิบาก';

  @override
  String get conditionsTitle => 'ปฏิจจสมุปบาท';

  @override
  String get conditionDetails => 'รายละเอียดปฏิจจสมุปบาท:';

  @override
  String get lastConditionDescription =>
      'นี่คือองค์วิบากสุดท้ายในวงจรชีวิตนี้ และไม่เริ่มปัจจัยใหม่';

  @override
  String conditionLinkDescription(Object effect, Object explanation) {
    return '• ปัจจัย: $effect\n  คำอธิบาย: $explanation';
  }

  @override
  String get conditionsTabLinks => 'องค์ 12';

  @override
  String get conditionsTabPaccaya => 'ปัจจัย 24';

  @override
  String get paccayaTitle => 'ปัจจัย 24 (ปัฏฐาน)';

  @override
  String get paccayaIntro =>
      'ส่วน B ของ Paccaya-saṅgaha-vibhāga: ธรรมทั้งหลายเป็นปัจจัยแก่กันอย่างไร ส่วน A คือองค์ 12 แห่งปฏิจจสมุปบาท';

  @override
  String get paccayaDefinition => 'คำนิยาม';

  @override
  String get paccayaConditioningStates =>
      'ธรรมที่เป็นปัจจัย (paccaya-dhamma)';

  @override
  String get paccayaConditionedStates => 'ธรรมที่ถูกปัจจัยปรุงแต่ง (paccayuppanna)';

  @override
  String get paccayaSubdivisions => 'หมวดย่อย';

  @override
  String get paccayaInPaticca => 'ทำงานในองค์เหล่านี้';

  @override
  String get paccayaEmpty => 'ไม่มีปัจจัยที่ตรงกับตัวกรองนี้';

  @override
  String get paccayaSearchHint => 'ค้นหาปัจจัย…';

  @override
  String get paccayaSourceNotice =>
      'แหล่งอ้างอิง: Paṭṭhāna (Abhidhamma Piṭaka VII) และ Visuddhimagga บทที่ XVII ยังไม่พบคัมภีร์ Pa-Auk ที่แจกแจงปัจจัย 24 รายการ คำศัพท์ยังรอการทบทวนจากผู้เชี่ยวชาญ';

  @override
  String get paccayaSources => 'แหล่งอ้างอิง';

  @override
  String paccayaCount(Object count) {
    return '$count ปัจจัย';
  }

  @override
  String get relatedDhammas => 'Related dhammas';

  @override
  String get paccayaGroupRootObject => 'เหตุและอารมณ์';

  @override
  String get paccayaGroupContinuity => 'ความต่อเนื่อง';

  @override
  String get paccayaGroupConascence => 'สหชาตและอุปถัมภ์';

  @override
  String get paccayaGroupTimeRelation => 'ลำดับการเกิด';

  @override
  String get paccayaGroupKammaVipaka => 'กรรมและวิบาก';

  @override
  String get paccayaGroupGeneral => 'ทั่วไป';

  @override
  String get kiepPast => 'อดีตชาติ';

  @override
  String get kiepPresent => 'ชาตินี้';

  @override
  String get kiepFuture => 'อนาคตชาติ';

  @override
  String get kammaTitle => 'Kamma';

  @override
  String get mindProcessTitle => 'วิถีจิต';

  @override
  String get paliLabel => 'Pāḷi:';

  @override
  String get stopPronunciation => 'Stop pronunciation';

  @override
  String get listenPaliPronunciation => 'Listen to Pāḷi pronunciation';

  @override
  String get ttsUnavailable =>
      'Speech synthesis is not supported on this device.';

  @override
  String get dragHandleSemantics => 'Drag to resize';

  @override
  String cittaNumber(Object number) {
    return 'Citta $number';
  }

  @override
  String get doctrine => 'Dhamma explanation';

  @override
  String get examples => 'Examples';

  @override
  String fixedCetasikasCount(Object count) {
    return 'Invariable cetasikas ($count)';
  }

  @override
  String variableCetasikasCount(Object count) {
    return 'Variable cetasikas ($count)';
  }

  @override
  String get personalNote => 'Personal note';

  @override
  String get personalNoteHint => 'Enter your note…';

  @override
  String get wholesome => 'Wholesome';

  @override
  String get functional => 'Functional';

  @override
  String get pleasantFeeling => 'Pleasant bodily feeling';

  @override
  String get unpleasantFeeling => 'Painful bodily feeling';

  @override
  String get neutralFeeling => 'Equanimous feeling';

  @override
  String get joyfulFeeling => 'Joyful feeling';

  @override
  String get alwaysAssociated => 'Always associated';

  @override
  String get mayBeAssociated => 'May be associated';

  @override
  String get fourfoldDefinition => 'Fourfold definition';

  @override
  String get characteristic => 'Characteristic';

  @override
  String get functionLabel => 'Function';

  @override
  String get manifestation => 'Manifestation';

  @override
  String get proximateCause => 'Proximate cause';

  @override
  String get doctrinalConflicts => 'Doctrinal conflicts';

  @override
  String rulesCount(Object count) {
    return '$count rules';
  }

  @override
  String get universalCetasikas => '7 universals';

  @override
  String get occasionalCetasikas => '6 occasionals';

  @override
  String get unwholesomeCetasikas => '14 unwholesome';

  @override
  String get beautifulCetasikas => '25 beautiful';

  @override
  String rowCittaSemantics(Object displayIndex, Object name, Object order,
      Object group, Object feeling, Object action) {
    return 'Citta row $displayIndex: $name; canonical number $order; group $group; feeling $feeling. $action';
  }

  @override
  String cetasikaSemantics(
      Object name, Object pali, Object group, Object state) {
    return 'Cetasika $name ($pali), group $group. $state Tap for details.';
  }

  @override
  String get selected => 'เลือกแล้ว';

  @override
  String get dimmedByConflict => 'จางลงเพราะมีข้อขัดกัน';

  @override
  String get matrixCornerSemantics =>
      'Matrix corner: rows are cittas and columns are cetasikas';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: citta $cittaId with cetasika $cetasikaId';
  }

  @override
  String get tapForDetails => 'แตะเพื่อดูรายละเอียด';

  @override
  String get studyPath => 'เส้นทางการเรียน';

  @override
  String get bookmarksAndNotes => 'บุ๊กมาร์กและบันทึก';

  @override
  String get overallProgress => 'ความก้าวหน้ารวม';

  @override
  String savedItemsCount(Object count) {
    return '$count saved items';
  }

  @override
  String get cittaTab => 'Cittas';

  @override
  String get cetasikaTab => 'Cetasikas';

  @override
  String get notesTab => 'Notes';

  @override
  String get noBookmarkedCittas => 'No bookmarked cittas';

  @override
  String get bookmarkCittaHint =>
      'Open a lesson and tap the bookmark icon to save one';

  @override
  String get loadingCittas => 'Loading cittas…';

  @override
  String get noBookmarkedCetasikas => 'No bookmarked cetasikas';

  @override
  String get loadingCetasikas => 'Loading cetasikas…';

  @override
  String get noNotes => 'No notes yet';

  @override
  String get addNoteHint =>
      'Tap the edit icon in a lesson to add a personal note';

  @override
  String get deleteNoteQuestion => 'Delete note?';

  @override
  String get deleteNoteWarning =>
      'This note will be permanently deleted. Are you sure?';

  @override
  String get addNote => 'Add note';

  @override
  String get removeBookmark => 'Remove bookmark';

  @override
  String get editNote => 'Edit note';

  @override
  String get deleteNote => 'Delete note';

  @override
  String get noteUpdated => 'Note updated';

  @override
  String get noteSaved => 'Note saved';

  @override
  String get editNoteTitle => 'Edit note';

  @override
  String get addNoteTitle => 'Add note';

  @override
  String get studyNoteHint =>
      'Write your note about this item…\n\nExample: this citta appears during meditation when…';

  @override
  String charactersCount(Object current, Object maximum) {
    return '$current / $maximum characters';
  }

  @override
  String get update => 'Update';

  @override
  String get saveNote => 'Save note';

  @override
  String studyProgressPercent(Object percent) {
    return 'Study progress: $percent%';
  }

  @override
  String get modulesCompletedShort => 'Modules\ncompleted';

  @override
  String get recommendedNext => 'Recommended next';

  @override
  String get progressOverview => 'Progress overview';

  @override
  String get totalModules => 'Total modules';

  @override
  String get dueForReview => 'Due for review';

  @override
  String get learnTab => 'เรียน';

  @override
  String get reviewTab => 'ทบทวน';

  @override
  String get testTab => 'ทดสอบ';

  @override
  String get moduleHasNoData =>
      'This module has no citta/cetasika data. Please check the JSON data.';

  @override
  String cittasInModule(Object count) {
    return 'Cittas in this module — $count';
  }

  @override
  String cetasikasInModule(Object count) {
    return 'Cetasikas in this module — $count';
  }

  @override
  String kammasInModule(Object count) {
    return 'Kamma — $count';
  }

  @override
  String paticcasInModule(Object count) {
    return 'Dependent origination — $count';
  }

  @override
  String rupasInModule(Object count) {
    return 'Material phenomena — $count';
  }

  @override
  String vithisInModule(Object count) {
    return 'Cognitive processes — $count';
  }

  @override
  String reviewCetasikaQuestion(Object name, Object pali) {
    return 'What does cetasika “$name” ($pali) mean?';
  }

  @override
  String reviewKammaQuestion(Object name, Object pali) {
    return 'What should you remember about the kamma “$name” ($pali)?';
  }

  @override
  String reviewPaticcaQuestion(Object name, Object pali) {
    return 'What should you remember about the dependent-origination link “$name” ($pali)?';
  }

  @override
  String reviewRupaQuestion(Object name, Object pali) {
    return 'What should you remember about the material phenomenon “$name” ($pali)?';
  }

  @override
  String reviewVithiQuestion(Object name, Object pali) {
    return 'What should you remember about the cognitive process “$name” ($pali)?';
  }

  @override
  String groupAnswer(Object group) {
    return 'Group: $group';
  }

  @override
  String reviewCittaQuestion(Object name) {
    return 'Which group and feeling does citta “$name” have?';
  }

  @override
  String cittaReviewAnswer(Object sphere, Object feeling, Object pali) {
    return 'Sphere: $sphere\nFeeling: $feeling\nPāḷi: $pali';
  }

  @override
  String get noReviewContent =>
      'This module has no review content yet. Please come back later.';

  @override
  String reviewedCount(Object revealed, Object total) {
    return '$revealed / $total reviewed';
  }

  @override
  String get reviewComplete =>
      'You reviewed all the content. Take the quiz to check your understanding.';

  @override
  String get tapToReveal => 'Tap to reveal the answer';

  @override
  String answerLabel(Object answer) {
    return 'Answer: $answer';
  }

  @override
  String get revealAnswer => 'Reveal answer';

  @override
  String moduleQuizTitle(Object module) {
    return 'Quiz\n$module';
  }

  @override
  String moduleContentCount(Object count) {
    return '$count items in this module';
  }

  @override
  String get quizMaximumDescription =>
      'Up to 10 multiple-choice questions covering this module';

  @override
  String get startQuiz => 'Start quiz';

  @override
  String cittasCount(Object count) {
    return '$count cittas';
  }

  @override
  String cetasikasCount(Object count) {
    return '$count cetasikas';
  }

  @override
  String noteForItem(Object name) {
    return 'Note: $name';
  }

  @override
  String get chooseLevel => 'เลือกระดับ';

  @override
  String quizLevelDescription(Object count) {
    return 'Each level generates up to $count questions from this module';
  }

  @override
  String get insufficientQuizData =>
      'This module does not have enough data to create questions.';

  @override
  String get explanation => 'คำอธิบาย';

  @override
  String get nextQuestion => 'คำถามถัดไป';

  @override
  String get viewResults => 'ดูผลลัพธ์';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total correct';
  }

  @override
  String get quizExcellent => 'Excellent! You have mastered this module.';

  @override
  String get quizTryAgain => 'Review the material and try again.';

  @override
  String get tryAgain => 'ลองอีกครั้ง';

  @override
  String quizInsufficientDataMessage(Object module) {
    return 'Module “$module” does not have enough data to create questions.';
  }

  @override
  String get quizTypeCetasikaGroup => 'Cetasika classification';

  @override
  String get quizTypeFeeling => 'Feeling recognition';

  @override
  String get quizTypeConflict => 'Doctrinal conflict';

  @override
  String get quizTypeSphere => 'Sphere';

  @override
  String get beginner => 'เริ่มต้น';

  @override
  String get beginnerDescription => 'Basic cetasika groups and feelings';

  @override
  String get intermediate => 'ปานกลาง';

  @override
  String get intermediateDescription => 'Includes cetasika conflicts';

  @override
  String get advanced => 'ขั้นสูง';

  @override
  String get advancedDescription => 'Includes spheres and all question types';

  @override
  String get trueLabel => 'True';

  @override
  String get falseLabel => 'False';

  @override
  String get trueOrFalse => 'True or false?';

  @override
  String quizCetasikaGroupQuestion(Object name, Object pali) {
    return 'Which group contains “$name” ($pali)?';
  }

  @override
  String quizCetasikaGroupExplanation(
      Object name, Object group, Object description) {
    return '“$name” belongs to $group.\n$description';
  }

  @override
  String quizCetasikaClaim(Object name, Object pali, Object group) {
    return '“$name” ($pali) belongs to $group. True or false?';
  }

  @override
  String quizCittaFeelingQuestion(Object name) {
    return 'What feeling accompanies citta “$name”?';
  }

  @override
  String quizCittaFeelingExplanation(Object name, Object feeling) {
    return '“$name” has $feeling.';
  }

  @override
  String quizCittaFeelingClaim(Object name, Object feeling) {
    return 'Citta “$name” has $feeling. True or false?';
  }

  @override
  String get conflictNo => 'No — they conflict';

  @override
  String get conflictAlwaysYes => 'Yes — they always arise together';

  @override
  String get conflictSometimesYes => 'Yes — they sometimes arise together';

  @override
  String quizConflictQuestion(Object first, Object second) {
    return 'Can “$first” and “$second” arise together in one citta?';
  }

  @override
  String quizSphereQuestion(Object name) {
    return 'To which sphere does citta “$name” belong?';
  }

  @override
  String quizSphereExplanation(Object name, Object sphere) {
    return '“$name” belongs to $sphere.';
  }

  @override
  String quizSphereClaim(Object name, Object sphere) {
    return 'Citta “$name” belongs to $sphere. True or false?';
  }

  @override
  String get phaseFoundation => 'Phase 1 — Foundation';

  @override
  String get phaseCausality => 'Phase 2 — Causality';

  @override
  String get phaseMastery => 'Phase 3 — Mastery';

  @override
  String get contentFallbackNotice => 'รายการนี้ยังไม่ได้แปล จึงแสดงเนื้อหาการเรียนภาษาอังกฤษ';

  @override
  String get listenAll => 'ฟังทั้งหมด';

  @override
  String get listeningQueue => 'รายการที่จะฟัง';

  @override
  String get listenFromHere => 'ฟังจากตรงนี้';

  @override
  String get nowPlaying => 'กำลังเล่น';

  @override
  String get repeatOff => 'ปิดการวนซ้ำ';

  @override
  String get repeatOne => 'วนซ้ำส่วนนี้';

  @override
  String get repeatAll => 'วนซ้ำทั้งหมด';

  @override
  String get listenAgain => 'ฟังอีกครั้ง';

  @override
  String get playbackSpeed => 'ความเร็ว';

  @override
  String get resumeListening => 'ฟังต่อ';

  @override
  String get continueListening => 'Continue listening';

  @override
  String get sleepTimer => 'ตั้งเวลาปิด';

  @override
  String get sleepTimerOff => 'ปิด';

  @override
  String get minutesShort => 'นาที';

  @override
  String get playAudio => 'เล่น';

  @override
  String get pauseAudio => 'หยุดชั่วคราว';

  @override
  String get previousTrack => 'ส่วนก่อนหน้า';

  @override
  String get karaokeSettingsTitle => 'Listening & karaoke';

  @override
  String get karaokeModeTitle => 'Karaoke mode';

  @override
  String get karaokeModeSubtitle => 'Highlight the text being read while listening';

  @override
  String get karaokeLineHighlightTitle => 'Highlight current line';

  @override
  String get karaokeLineHighlightSubtitle => 'Shade the paragraph being read';

  @override
  String get karaokeWordHighlightTitle => 'Highlight current word';

  @override
  String get karaokeWordHighlightSubtitle => 'Shade each word as it is spoken (estimated timing)';

  @override
  String get audioFloatingGoTo => 'Go to what\'s playing';

  @override
  String get audioFloatingHide => 'Hide player';

  @override
  String get audioFloatingRestore => 'Show player';

  @override
  String get audioFloatingClose => 'Close player';
}
