// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appName => 'พระอภิธรรม';

  @override
  String get appTagline => 'พระอภิธรรมปิฎก';

  @override
  String get initializing => 'กำลังเริ่มต้น…';

  @override
  String get loadingDoctrineData => 'กำลังโหลดและตรวจสอบข้อมูลพระธรรม…';

  @override
  String get loadingTakingLonger =>
      'การเริ่มต้นใช้เวลานานกว่าปกติ อาจกำลังปรับข้อมูลให้เหมาะสมกับอุปกรณ์';

  @override
  String get unknownError => 'ข้อผิดพลาดที่ไม่รู้จัก';

  @override
  String get dataError => 'ข้อผิดพลาดของข้อมูล';

  @override
  String get invalidData => 'ข้อมูลไม่ถูกต้อง';

  @override
  String get invalidDataDescription =>
      'ระบบตรวจพบความขัดแย้งของกฎการตรวจสอบธรรมะ โปรดติดต่อทีมงานเพื่อตรวจสอบ';

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
  String get hide => 'ซ่อน';

  @override
  String get learn => 'เรียน';

  @override
  String get notes => 'บันทึก';

  @override
  String errorWithMessage(Object message) {
    return 'ข้อผิดพลาด: $message';
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
    return 'อินเทอร์เฟซจะเปลี่ยนเป็น $language';
  }

  @override
  String languageChangedTo(Object language) {
    return 'เปลี่ยนภาษาเป็น $language แล้ว';
  }

  @override
  String get holdGlobeToReset =>
      'กดลูกโลกค้างไว้ 3 วินาทีเพื่อคืนค่าภาษาของระบบ';

  @override
  String get restoredSystemLanguage => 'คืนค่าภาษาของระบบแล้ว';

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
  String get highContrastSubtitle => 'เพิ่มความต่างสีสำหรับผู้มีสายตาเลือนราง';

  @override
  String get screenReaderHints => 'คำแนะนำโปรแกรมอ่านหน้าจอ';

  @override
  String get screenReaderHintsSubtitle =>
      'ให้รายละเอียดเพิ่มเติมสำหรับ TalkBack และ VoiceOver';

  @override
  String get textSize => 'ขนาดตัวอักษร';

  @override
  String get textScale => 'ขนาดตัวอักษร';

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
  String get showDataWarningAgainSubtitle => 'คืนค่าแถบคำเตือนของตาราง';

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
  String get onboardingVisualTitle => 'เห็นอย่างแจ่มแจ้ง';

  @override
  String get onboardingVisualSubtitle => 'ตารางจิต × เจตสิก';

  @override
  String get onboardingVisualBody =>
      'สำรวจจิต 121 ดวงและเจตสิก 52 ดวงในตารางปฏิสัมพันธ์ สี รูปร่าง และข้อความระบุความสัมพันธ์อย่างชัดเจน';

  @override
  String get onboardingCausalityTitle => 'เข้าใจอย่างลึกซึ้ง';

  @override
  String get onboardingCausalitySubtitle => 'ปฏิจจสมุปบาท';

  @override
  String get onboardingCausalityBody =>
      'สำรวจองค์ประกอบ 12 ของปฏิจจสมุปบาทและการจำแนกกรรมผ่านมุมมองการเรียนรู้ที่เชื่อมโยงกัน';

  @override
  String get onboardingExploreTitle => 'ค้นพบด้วยตนเอง';

  @override
  String get onboardingExploreSubtitle => 'เส้นทางการศึกษาแบบไม่เป็นเส้นตรง';

  @override
  String get onboardingExploreBody =>
      'เลือกเส้นทางของคุณผ่าน 10 บทเรียนที่เชื่อมโยงกัน การทบทวนและแบบทดสอบช่วยให้ความรู้คงทน';

  @override
  String get beginExploring => 'เริ่มการสำรวจ';

  @override
  String get matrixTitle => 'ตารางอภิธรรม';

  @override
  String matrixSemantics(Object count) {
    return 'ตารางพระอภิธรรมแสดงจิต $count ดวง';
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
  String get clearSearch => 'ล้างการค้นหา';

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
    return 'คำเตือนข้อมูล $count รายการ';
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
  String get matrixHelpSymbols =>
      '✦ = ประกอบเสมอ\n◎ = ประกอบเป็นบางครั้ง\n✕ = ไม่ประกอบ';

  @override
  String get tips => 'เคล็ดลับ:';

  @override
  String get matrixHelpTips =>
      '• แตะจิตเพื่อดูรายละเอียด\n• แตะเจตสิกเพื่อดูข้อขัดกัน\n• ใช้ตัวกรองเพื่อจำกัดมุมมอง\n• หมุนหน้าจอเพื่อเพิ่มพื้นที่';

  @override
  String get matrixListenCittas => 'ฟังจิตทั้งหมด';

  @override
  String get matrixListenCetasikas => 'ฟังเจตสิกทั้งหมด';

  @override
  String get matrixListenFromHint => 'กดค้างเพื่อฟังจากรายการนี้';

  @override
  String get matrixListenHelpBody =>
      'กดค้างที่แถวจิตหรือคอลัมน์เจตสิกเพื่อฟังจากรายการนั้น แตะไอคอนหูฟังที่มุมตารางเพื่อฟังรายการทั้งหมด';

  @override
  String get understood => 'เข้าใจแล้ว';

  @override
  String get dataWarningTitle => 'คำเตือนข้อมูล';

  @override
  String get allFilters => 'ทั้งหมด';

  @override
  String get defilements => 'กิเลส';

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
  String get paccayaConditioningStates => 'ธรรมที่เป็นปัจจัย (paccaya-dhamma)';

  @override
  String get paccayaConditionedStates =>
      'ธรรมที่ถูกปัจจัยปรุงแต่ง (paccayuppanna)';

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
  String get relatedDhammas => 'ธรรมที่เกี่ยวข้อง';

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
  String get kammaTitle => 'กรรม (Kamma)';

  @override
  String get mindProcessTitle => 'วิถีจิต';

  @override
  String get paliLabel => 'บาลี:';

  @override
  String get stopPronunciation => 'หยุดการออกเสียง';

  @override
  String get listenPaliPronunciation => 'ฟังการออกเสียงภาษาบาลี';

  @override
  String get ttsUnavailable => 'อุปกรณ์นี้ไม่รองรับการสังเคราะห์เสียงพูด';

  @override
  String get dragHandleSemantics => 'ลากเพื่อปรับขนาด';

  @override
  String cittaNumber(Object number) {
    return 'จิตที่ $number';
  }

  @override
  String get doctrine => 'คำอธิบายธรรม';

  @override
  String get examples => 'ตัวอย่าง';

  @override
  String fixedCetasikasCount(Object count) {
    return 'เจตสิกที่แน่นอน ($count)';
  }

  @override
  String variableCetasikasCount(Object count) {
    return 'เจตสิกที่ไม่แน่นอน ($count)';
  }

  @override
  String get personalNote => 'บันทึกส่วนตัว';

  @override
  String get personalNoteHint => 'พิมพ์บันทึกของคุณ…';

  @override
  String get wholesome => 'กุศล';

  @override
  String get functional => 'กิริยา';

  @override
  String get pleasantFeeling => 'สุขเวทนา (ทางกาย)';

  @override
  String get unpleasantFeeling => 'ทุกขเวทนา (ทางกาย)';

  @override
  String get neutralFeeling => 'อุเบกขาเวทนา';

  @override
  String get joyfulFeeling => 'โสมนัสสเวทนา (ทางใจ)';

  @override
  String get alwaysAssociated => 'ประกอบแน่นอน';

  @override
  String get mayBeAssociated => 'อาจประกอบร่วม';

  @override
  String get fourfoldDefinition => 'ลักขณาทิจตุกะ (ลักษณะ 4 ประการ)';

  @override
  String get characteristic => 'ลักษณะ (Lakkhaṇa)';

  @override
  String get functionLabel => 'กิจ (Rasa)';

  @override
  String get manifestation => 'อาการปรากฏ (Paccupaṭṭhāna)';

  @override
  String get proximateCause => 'เหตุใกล้ (Padaṭṭhāna)';

  @override
  String get doctrinalConflicts => 'เจตสิกที่เป็นปฏิปักษ์กัน';

  @override
  String rulesCount(Object count) {
    return '$count กฎ';
  }

  @override
  String get universalCetasikas => 'สัพพจิตตสาธารณเจตสิก 7';

  @override
  String get occasionalCetasikas => 'ปกิณณกเจตสิก 6';

  @override
  String get unwholesomeCetasikas => 'อกุศลเจตสิก 14';

  @override
  String get beautifulCetasikas => 'โสภณเจตสิก 25';

  @override
  String rowCittaSemantics(Object displayIndex, Object name, Object order,
      Object group, Object feeling, Object action) {
    return 'แถวจิตที่ $displayIndex: $name; ลำดับ $order; กลุ่ม $group; เวทนา $feeling. $action';
  }

  @override
  String cetasikaSemantics(
      Object name, Object pali, Object group, Object state) {
    return 'เจตสิก $name ($pali), กลุ่ม $group. $state แตะเพื่อดูรายละเอียด';
  }

  @override
  String get selected => 'เลือกแล้ว';

  @override
  String get dimmedByConflict => 'จางลงเพราะมีข้อขัดกัน';

  @override
  String get matrixCornerSemantics => 'มุมตาราง: แถวคือจิตและคอลัมน์คือเจตสิก';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: จิต $cittaId กับ เจตสิก $cetasikaId';
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
    return 'รายการที่บันทึกไว้ $count รายการ';
  }

  @override
  String get cittaTab => 'จิต';

  @override
  String get cetasikaTab => 'เจตสิก';

  @override
  String get notesTab => 'บันทึก';

  @override
  String get noBookmarkedCittas => 'ยังไม่มีจิตที่คั่นไว้';

  @override
  String get bookmarkCittaHint => 'เปิดบทเรียนและแตะไอคอนคั่นหน้าเพื่อบันทึก';

  @override
  String get loadingCittas => 'กำลังโหลดข้อมูลจิต…';

  @override
  String get noBookmarkedCetasikas => 'ยังไม่มีเจตสิกที่คั่นไว้';

  @override
  String get loadingCetasikas => 'กำลังโหลดข้อมูลเจตสิก…';

  @override
  String get noNotes => 'ยังไม่มีบันทึก';

  @override
  String get addNoteHint => 'แตะไอคอนแก้ไขในบทเรียนเพื่อเพิ่มบันทึกส่วนตัว';

  @override
  String get deleteNoteQuestion => 'ลบบันทึกหรือไม่?';

  @override
  String get deleteNoteWarning => 'บันทึกนี้จะถูกลบอย่างถาวร คุณแน่ใจหรือไม่?';

  @override
  String get addNote => 'เพิ่มบันทึก';

  @override
  String get removeBookmark => 'ลบบุ๊กมาร์ก';

  @override
  String get editNote => 'แก้ไขบันทึก';

  @override
  String get deleteNote => 'ลบบันทึก';

  @override
  String get noteUpdated => 'อัปเดตบันทึกแล้ว';

  @override
  String get noteSaved => 'บันทึกข้อมูลแล้ว';

  @override
  String get editNoteTitle => 'แก้ไขบันทึก';

  @override
  String get addNoteTitle => 'เพิ่มบันทึก';

  @override
  String get studyNoteHint =>
      'เขียนบันทึกของคุณเกี่ยวกับหัวข้อนี้…\n\nตัวอย่าง: จิตนี้เกิดขึ้นระหว่างการปฏิบัติธรรมเมื่อ…';

  @override
  String charactersCount(Object current, Object maximum) {
    return '$current / $maximum ตัวอักษร';
  }

  @override
  String get update => 'อัปเดต';

  @override
  String get saveNote => 'บันทึก';

  @override
  String studyProgressPercent(Object percent) {
    return 'ความคืบหน้าการศึกษา: $percent%';
  }

  @override
  String get modulesCompletedShort => 'บทเรียน\nที่สำเร็จ';

  @override
  String get recommendedNext => 'แนะนำบทเรียนถัดไป';

  @override
  String get progressOverview => 'ภาพรวมความคืบหน้า';

  @override
  String get totalModules => 'บทเรียนทั้งหมด';

  @override
  String get dueForReview => 'ถึงกำหนดทบทวน';

  @override
  String get learnTab => 'เรียน';

  @override
  String get reviewTab => 'ทบทวน';

  @override
  String get testTab => 'ทดสอบ';

  @override
  String get moduleHasNoData =>
      'บทเรียนนี้ไม่มีข้อมูลจิต/เจตสิก โปรดตรวจสอบข้อมูล JSON';

  @override
  String cittasInModule(Object count) {
    return 'จิตในบทเรียนนี้ — $count';
  }

  @override
  String cetasikasInModule(Object count) {
    return 'เจตสิกในบทเรียนนี้ — $count';
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
    return 'เจตสิก “$name” ($pali) มีความหมายอย่างไร?';
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
    return 'กลุ่ม: $group';
  }

  @override
  String reviewCittaQuestion(Object name) {
    return 'จิต “$name” อยู่ในภูมิใดและมีเวทนาอะไร?';
  }

  @override
  String cittaReviewAnswer(Object sphere, Object feeling, Object pali) {
    return 'ภูมิ: $sphere\nเวทนา: $feeling\nบาลี: $pali';
  }

  @override
  String get noReviewContent =>
      'บทเรียนนี้ยังไม่มีเนื้อหาทบทวน โปรดกลับมาใหม่ภายหลัง';

  @override
  String reviewedCount(Object revealed, Object total) {
    return 'ทบทวนแล้ว $revealed / $total';
  }

  @override
  String get reviewComplete =>
      'คุณทบทวนเนื้อหาครบแล้ว ทำแบบทดสอบเพื่อตรวจความเข้าใจ';

  @override
  String get tapToReveal => 'แตะเพื่อดูคำตอบ';

  @override
  String answerLabel(Object answer) {
    return 'คำตอบ: $answer';
  }

  @override
  String get revealAnswer => 'แสดงคำตอบ';

  @override
  String moduleQuizTitle(Object module) {
    return 'แบบทดสอบ\n$module';
  }

  @override
  String moduleContentCount(Object count) {
    return '$count หัวข้อในบทเรียนนี้';
  }

  @override
  String get quizMaximumDescription =>
      'คำถามปรนัยสูงสุด 10 ข้อครอบคลุมบทเรียนนี้';

  @override
  String get startQuiz => 'เริ่มแบบทดสอบ';

  @override
  String cittasCount(Object count) {
    return 'จิต $count ดวง';
  }

  @override
  String cetasikasCount(Object count) {
    return 'เจตสิก $count ดวง';
  }

  @override
  String noteForItem(Object name) {
    return 'บันทึก: $name';
  }

  @override
  String get chooseLevel => 'เลือกระดับ';

  @override
  String quizLevelDescription(Object count) {
    return 'แต่ละระดับจะสร้างคำถามสูงสุด $count ข้อจากบทเรียนนี้';
  }

  @override
  String get insufficientQuizData =>
      'บทเรียนนี้มีข้อมูลไม่เพียงพอในการสร้างคำถาม';

  @override
  String get explanation => 'คำอธิบาย';

  @override
  String get nextQuestion => 'คำถามถัดไป';

  @override
  String get viewResults => 'ดูผลลัพธ์';

  @override
  String correctAnswers(Object score, Object total) {
    return 'ถูกต้อง $score / $total ข้อ';
  }

  @override
  String get quizExcellent =>
      'ยอดเยี่ยม! คุณเข้าใจบทเรียนนี้อย่างเชี่ยวชาญแล้ว';

  @override
  String get quizTryAgain => 'ทบทวนเนื้อหาและลองใหม่อีกครั้ง';

  @override
  String get tryAgain => 'ลองอีกครั้ง';

  @override
  String quizInsufficientDataMessage(Object module) {
    return 'บทเรียน “$module” มีข้อมูลไม่เพียงพอในการสร้างคำถาม';
  }

  @override
  String get quizTypeCetasikaGroup => 'การจำแนกเจตสิก';

  @override
  String get quizTypeFeeling => 'การระบุเวทนา';

  @override
  String get quizTypeConflict => 'ความขัดแย้งทางธรรม';

  @override
  String get quizTypeSphere => 'ภูมิ (Sphere)';

  @override
  String get beginner => 'เริ่มต้น';

  @override
  String get beginnerDescription => 'กลุ่มเจตสิกพื้นฐานและเวทนา';

  @override
  String get intermediate => 'ปานกลาง';

  @override
  String get intermediateDescription => 'รวมถึงกฎความขัดแย้งของเจตสิก';

  @override
  String get advanced => 'ขั้นสูง';

  @override
  String get advancedDescription => 'รวมถึงภูมิและคำถามทุกประเภท';

  @override
  String get trueLabel => 'จริง';

  @override
  String get falseLabel => 'เท็จ';

  @override
  String get trueOrFalse => 'จริงหรือเท็จ?';

  @override
  String quizCetasikaGroupQuestion(Object name, Object pali) {
    return '“$name” ($pali) อยู่ในกลุ่มใด?';
  }

  @override
  String quizCetasikaGroupExplanation(
      Object name, Object group, Object description) {
    return '“$name” อยู่ในกลุ่ม $group\n$description';
  }

  @override
  String quizCetasikaClaim(Object name, Object pali, Object group) {
    return '“$name” ($pali) อยู่ในกลุ่ม $group จริงหรือเท็จ?';
  }

  @override
  String quizCittaFeelingQuestion(Object name) {
    return 'จิต “$name” มีเวทนาอะไรประกอบร่วม?';
  }

  @override
  String quizCittaFeelingExplanation(Object name, Object feeling) {
    return '“$name” มี $feeling';
  }

  @override
  String quizCittaFeelingClaim(Object name, Object feeling) {
    return 'จิต “$name” มี $feeling จริงหรือเท็จ?';
  }

  @override
  String get conflictNo => 'ไม่ — เป็นปฏิปักษ์กัน';

  @override
  String get conflictAlwaysYes => 'ใช่ — เกิดร่วมกันเสมอ';

  @override
  String get conflictSometimesYes => 'ใช่ — เกิดร่วมกันในบางครั้ง';

  @override
  String quizConflictQuestion(Object first, Object second) {
    return '“$first” และ “$second” สามารถเกิดร่วมกันในจิตดวงเดียวกันได้หรือไม่?';
  }

  @override
  String quizSphereQuestion(Object name) {
    return 'จิต “$name” จัดอยู่ในภูมิใด?';
  }

  @override
  String quizSphereExplanation(Object name, Object sphere) {
    return '“$name” อยู่ใน $sphere';
  }

  @override
  String quizSphereClaim(Object name, Object sphere) {
    return 'จิต “$name” จัดอยู่ใน $sphere จริงหรือเท็จ?';
  }

  @override
  String get phaseFoundation => 'ระยะที่ 1 — รากฐาน';

  @override
  String get phaseCausality => 'ระยะที่ 2 — เหตุปัจจัย';

  @override
  String get phaseMastery => 'ระยะที่ 3 — ความเชี่ยวชาญ';

  @override
  String get contentFallbackNotice =>
      'รายการนี้ยังไม่ได้แปล จึงแสดงเนื้อหาการเรียนภาษาอังกฤษ';

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
  String get minutesShort => 'นาที';

  @override
  String get playAudio => 'เล่น';

  @override
  String get pauseAudio => 'หยุดชั่วคราว';

  @override
  String get previousTrack => 'ส่วนก่อนหน้า';

  @override
  String get sleepTimer => 'ตั้งเวลาปิด';

  @override
  String get sleepTimerOff => 'ปิด';

  @override
  String get sleepTimer15 => '15 นาที';

  @override
  String get sleepTimer30 => '30 นาที';

  @override
  String get sleepTimer60 => '60 นาที';

  @override
  String sleepTimerRemaining(Object minutes) {
    return 'ตั้งเวลาปิด: เหลือ $minutes นาที';
  }

  @override
  String get audioModelUnavailable =>
      'ไม่มีเสียงประสาทเทียม กำลังใช้เสียงของอุปกรณ์';

  @override
  String get realDuration => 'ระยะเวลา';

  @override
  String get estimatedDuration => 'ระยะเวลาโดยประมาณ';

  @override
  String get continueListening => 'ฟังต่อ';

  @override
  String get audioBackgroundLimit =>
      'การเล่นเสียงพื้นหลังขึ้นอยู่กับเครื่องมือแปลงข้อความเป็นเสียงที่ติดตั้งไว้';

  @override
  String get karaokeSettingsTitle => 'การฟังและการไฮไลต์';

  @override
  String get karaokeModeTitle => 'โหมดคาราโอเกะ';

  @override
  String get karaokeModeSubtitle => 'ไฮไลต์ข้อความที่กำลังอ่านขณะฟัง';

  @override
  String get karaokeLineHighlightTitle => 'ไฮไลต์บรรทัดปัจจุบัน';

  @override
  String get karaokeLineHighlightSubtitle => 'เน้นข้อความย่อหน้าที่กำลังอ่าน';

  @override
  String get karaokeWordHighlightTitle => 'ไฮไลต์ทีละคำ';

  @override
  String get karaokeWordHighlightSubtitle =>
      'เน้นทีละคำตามจังหวะการอ่าน (ประมาณการ)';

  @override
  String get audioFloatingGoTo => 'ไปยังเนื้อหาที่กำลังเล่น';

  @override
  String get audioFloatingHide => 'ซ่อนแถบควบคุมเสียง';

  @override
  String get audioFloatingRestore => 'แสดงแถบควบคุมเสียง';

  @override
  String get audioFloatingClose => 'ปิดเครื่องเล่นเสียง';

  @override
  String get playModeTitle => 'โหมดการฟัง';

  @override
  String get playModeOnce => 'เฉพาะรายการนี้';

  @override
  String get playModeSequence => 'ฟังต่อเนื่อง';

  @override
  String get playModeOnceHint => 'หยุดเมื่ออ่านรายการปัจจุบันจบ';

  @override
  String get playModeRepeatOneHint => 'อ่านซ้ำรายการปัจจุบันไปเรื่อย ๆ';

  @override
  String get playModeSequenceHint => 'อ่านรายการถัดไปต่อเนื่อง หยุดเมื่อจบรายการ';

  @override
  String get playModeRepeatAllHint => 'อ่านต่อเนื่องและวนกลับไปเริ่มใหม่เมื่อจบรายการ';

  @override
  String get audioBubbleExpand => 'ขยายแถบเสียง';

  @override
  String get audioBubbleCollapse => 'ย่อแถบเสียง';

  @override
  String get studyTreeExpandAll => 'ขยายทั้งหมด';

  @override
  String get studyTreeCollapseAll => 'ย่อทั้งหมด';
}
