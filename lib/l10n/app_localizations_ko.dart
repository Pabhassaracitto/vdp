// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appName => 'AbhiDhamma';

  @override
  String get appTagline => 'Abhidhamma Piṭaka';

  @override
  String get initializing => '초기화 중…';

  @override
  String get loadingDoctrineData => '담마 데이터를 불러오고 검증하는 중…';

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
  String get navMatrix => '매트릭스';

  @override
  String get navStudy => '학습';

  @override
  String get navConditions => '연기';

  @override
  String get navMindProcess => '마음 과정';

  @override
  String get navSettings => '설정';

  @override
  String get cancel => '취소';

  @override
  String get save => '저장';

  @override
  String get delete => '삭제';

  @override
  String get close => '닫기';

  @override
  String get start => '시작';

  @override
  String get next => '다음';

  @override
  String get done => '완료';

  @override
  String get skip => '건너뛰기';

  @override
  String get apply => '적용';

  @override
  String get undo => '실행 취소';

  @override
  String get reset => '재설정';

  @override
  String get all => '전체';

  @override
  String get hide => '숨기기';

  @override
  String get learn => '학습';

  @override
  String get notes => '메모';

  @override
  String errorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get languageSection => '언어';

  @override
  String get interfaceLanguage => '인터페이스 언어';

  @override
  String get interfaceLanguageSubtitle => '기기 언어를 따르거나 직접 선택';

  @override
  String get contentLanguage => '학습 콘텐츠 언어';

  @override
  String get contentLanguageSubtitle => '인터페이스 언어와 독립적입니다';

  @override
  String get systemDefault => '시스템 기본값';

  @override
  String get systemDefaultSubtitle => '이 기기에서 선택한 언어 사용';

  @override
  String get languagePickerTitle => 'Language / 언어';

  @override
  String get languagePickerSearchHint => '언어 이름 또는 코드로 검색';

  @override
  String get languageChangePreviewTitle => '인터페이스 언어를 변경할까요?';

  @override
  String languageChangePreviewBody(Object language) {
    return '인터페이스가 $language(으)로 변경됩니다. 학습 내용은 바뀌지 않습니다.';
  }

  @override
  String languageChangedTo(Object language) {
    return '언어가 $language(으)로 변경되었습니다';
  }

  @override
  String get holdGlobeToReset =>
      'Press and hold the globe for 3 seconds to restore the system language';

  @override
  String get restoredSystemLanguage => '시스템 언어를 복원했습니다';

  @override
  String get contentVietnamese => '베트남어';

  @override
  String get contentEnglish => '영어';

  @override
  String get translationReviewNotice =>
      'English Dhamma content is an international study translation. Pāḷi terms remain authoritative.';

  @override
  String get settingsAccessibility => '접근성';

  @override
  String get highContrastMode => '고대비 모드';

  @override
  String get highContrastSubtitle =>
      'Increase color contrast for people with low vision';

  @override
  String get screenReaderHints => '스크린 리더 힌트';

  @override
  String get screenReaderHintsSubtitle =>
      'Provide more detail for TalkBack and VoiceOver';

  @override
  String get textSize => '글자 크기';

  @override
  String get textScale => '글자 배율';

  @override
  String get studyProgress => '학습 진행도';

  @override
  String get unlockAllLessons => '모든 수업 잠금 해제';

  @override
  String get unlockAllLessonsSubtitle =>
      'The guided path builds a strong foundation. Experienced learners can unlock every lesson.';

  @override
  String get resetProgress => '진행도 재설정';

  @override
  String get resetProgressSubtitle => 'Delete all study data';

  @override
  String get showDataWarningAgain => 'Show data warning again';

  @override
  String get showDataWarningAgainSubtitle =>
      'Restore the Matrix warning banner';

  @override
  String get dataWarningEnabled => 'Data warning enabled';

  @override
  String get aboutApp => '앱 정보';

  @override
  String get version => '버전';

  @override
  String get sourceMaterial => '출처';

  @override
  String get sourceMaterialValue => 'King Milanda A curriculum — Abhidhamma';

  @override
  String get editorialPrinciples => 'Editorial principles';

  @override
  String get resetProgressQuestion => 'Reset progress?';

  @override
  String get resetProgressWarning =>
      'All study progress and quiz scores will be deleted. This action cannot be undone.';

  @override
  String get progressResetSuccess => 'Study progress reset';

  @override
  String get unlockLessonsQuestion => 'Unlock all lessons?';

  @override
  String get unlockLessonsWarning =>
      'The guided path is the most effective way to build a sound Abhidhamma foundation. This option is intended for experienced learners.';

  @override
  String get keepGuidedPath => 'Keep guided path';

  @override
  String get unlock => 'Unlock';

  @override
  String modulesCompleted(Object completed, Object total) {
    return '$completed / $total modules completed';
  }

  @override
  String mostRecentModule(Object module) {
    return 'Most recent module: $module';
  }

  @override
  String lastStudied(Object date) {
    return 'Last studied: $date';
  }

  @override
  String get today => 'Today';

  @override
  String get yesterday => 'Yesterday';

  @override
  String daysAgo(Object count) {
    return '$count days ago';
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
  String get matrixTitle => '아비담마 매트릭스';

  @override
  String matrixSemantics(Object count) {
    return 'Abhidhamma Matrix showing $count cittas';
  }

  @override
  String get rotateScreen => '화면 회전';

  @override
  String get rotationHint =>
      'If the screen does not rotate, enable Auto-rotate in device settings.';

  @override
  String get highContrast => '고대비';

  @override
  String get help => '도움말';

  @override
  String get searchCittaCetasika => '찌따 또는 쩨따시까 검색…';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get citta => '찌따';

  @override
  String get cetasika => '쩨따시까';

  @override
  String get unwholesome => 'Unwholesome';

  @override
  String get rootless => 'Rootless';

  @override
  String get senseSphereBeautiful => 'Sense-sphere beautiful';

  @override
  String get formSphere => 'Form sphere';

  @override
  String get formlessSphere => 'Formless sphere';

  @override
  String get supramundane => 'Supramundane';

  @override
  String get legend => 'Legend:';

  @override
  String get associationAlways => 'Invariable';

  @override
  String get associationSometimes => 'Variable';

  @override
  String get associationNever => 'Absent';

  @override
  String dataWarningsCount(Object count) {
    return '$count data warnings';
  }

  @override
  String get matrixHelpTitle => 'Matrix guide';

  @override
  String get howToRead => 'How to read:';

  @override
  String get matrixHelpRead =>
      '• Rows: Citta\n• Columns: Cetasika\n• Intersections: association';

  @override
  String get symbols => 'Symbols:';

  @override
  String get matrixHelpSymbols => '✦ = Invariable\n◎ = Variable\n✕ = Absent';

  @override
  String get tips => 'Tips:';

  @override
  String get matrixHelpTips =>
      '• Tap a citta for details\n• Tap a cetasika for conflicts\n• Use filters to narrow the view\n• Rotate for more space';

  @override
  String get understood => 'Got it';

  @override
  String get dataWarningTitle => 'Data warning';

  @override
  String get allFilters => 'All';

  @override
  String get defilements => 'Defilements';

  @override
  String get kamma => '깜마';

  @override
  String get result => '결과';

  @override
  String get conditionsTitle => '연기';

  @override
  String get conditionDetails => 'Dependent-origination details:';

  @override
  String get lastConditionDescription =>
      'This is the final resultant link in this life-cycle and starts no new condition.';

  @override
  String conditionLinkDescription(Object effect, Object explanation) {
    return '• Conditions: $effect\n  Explanation: $explanation';
  }

  @override
  String get kammaTitle => 'Kamma';

  @override
  String get mindProcessTitle => '마음 과정';

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
  String get selected => 'Selected';

  @override
  String get dimmedByConflict => 'Dimmed because of a conflict';

  @override
  String get matrixCornerSemantics =>
      'Matrix corner: rows are cittas and columns are cetasikas';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: citta $cittaId with cetasika $cetasikaId';
  }

  @override
  String get tapForDetails => 'Tap for details';

  @override
  String get studyPath => '학습 경로';

  @override
  String get bookmarksAndNotes => '북마크와 메모';

  @override
  String get overallProgress => '전체 진행도';

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
  String get learnTab => '학습';

  @override
  String get reviewTab => '복습';

  @override
  String get testTab => '시험';

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
  String reviewCetasikaQuestion(Object name, Object pali) {
    return 'What does cetasika “$name” ($pali) mean?';
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
  String get chooseLevel => '난이도 선택';

  @override
  String quizLevelDescription(Object count) {
    return 'Each level generates up to $count questions from this module';
  }

  @override
  String get insufficientQuizData =>
      'This module does not have enough data to create questions.';

  @override
  String get explanation => '해설';

  @override
  String get nextQuestion => '다음 문제';

  @override
  String get viewResults => '결과 보기';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total correct';
  }

  @override
  String get quizExcellent => 'Excellent! You have mastered this module.';

  @override
  String get quizTryAgain => 'Review the material and try again.';

  @override
  String get tryAgain => '다시 시도';

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
  String get beginner => '초급';

  @override
  String get beginnerDescription => 'Basic cetasika groups and feelings';

  @override
  String get intermediate => '중급';

  @override
  String get intermediateDescription => 'Includes cetasika conflicts';

  @override
  String get advanced => '고급';

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
  String get contentFallbackNotice =>
      'This item is not translated yet; showing the English study text.';
}
