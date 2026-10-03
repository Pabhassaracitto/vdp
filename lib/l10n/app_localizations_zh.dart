// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'AbhiDhamma';

  @override
  String get appTagline => 'Abhidhamma Piṭaka';

  @override
  String get initializing => '正在初始化…';

  @override
  String get loadingDoctrineData => '正在加载并验证佛法数据…';

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
  String get navMatrix => '矩阵';

  @override
  String get navStudy => '学习';

  @override
  String get navConditions => '缘起';

  @override
  String get navMindProcess => '心路过程';

  @override
  String get navSettings => '设置';

  @override
  String get cancel => '取消';

  @override
  String get save => '保存';

  @override
  String get delete => '删除';

  @override
  String get close => '关闭';

  @override
  String get start => '开始';

  @override
  String get next => '下一步';

  @override
  String get done => '完成';

  @override
  String get skip => '跳过';

  @override
  String get apply => '应用';

  @override
  String get undo => '撤销';

  @override
  String get reset => '重置';

  @override
  String get all => '全部';

  @override
  String get hide => '隐藏';

  @override
  String get learn => '学习';

  @override
  String get notes => '笔记';

  @override
  String errorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get languageSection => '语言';

  @override
  String get interfaceLanguage => '界面语言';

  @override
  String get interfaceLanguageSubtitle => '跟随设备语言或手动选择';

  @override
  String get contentLanguage => '学习内容语言';

  @override
  String get contentLanguageSubtitle => '与界面语言相互独立';

  @override
  String get systemDefault => '跟随系统';

  @override
  String get systemDefaultSubtitle => '使用此设备选择的语言';

  @override
  String get languagePickerTitle => '语言';

  @override
  String get languagePickerSearchHint => '按语言名称或代码搜索';

  @override
  String get languageChangePreviewTitle => '更改界面语言？';

  @override
  String languageChangePreviewBody(Object language) {
    return '界面将切换为$language。学习内容保持不变。';
  }

  @override
  String languageChangedTo(Object language) {
    return '语言已切换为$language';
  }

  @override
  String get holdGlobeToReset =>
      'Press and hold the globe for 3 seconds to restore the system language';

  @override
  String get restoredSystemLanguage => '已恢复系统语言';

  @override
  String get contentVietnamese => '越南语';

  @override
  String get contentEnglish => '英语';

  @override
  String get translationReviewNotice => '本语言的法义内容为国际学习译本。巴利语术语仍为准据。';

  @override
  String get contentDraftNotice => '此译本为草稿，尚待教义审核。依用前请对照巴利原文核实。';

  @override
  String get settingsAccessibility => '无障碍';

  @override
  String get highContrastMode => '高对比度模式';

  @override
  String get highContrastSubtitle =>
      '提高色彩对比度，方便低视力用户';

  @override
  String get screenReaderHints => '屏幕阅读器提示';

  @override
  String get screenReaderHintsSubtitle =>
      '为 TalkBack 和 VoiceOver 提供更多细节';

  @override
  String get textSize => '字体大小';

  @override
  String get textScale => '文字缩放';

  @override
  String get studyProgress => '学习进度';

  @override
  String get unlockAllLessons => '解锁所有课程';

  @override
  String get unlockAllLessonsSubtitle =>
      '引导路径能建立坚实基础。有经验的学习者可以解锁所有课程。';

  @override
  String get resetProgress => '重置进度';

  @override
  String get resetProgressSubtitle => '删除所有学习数据';

  @override
  String get showDataWarningAgain => '再次显示数据警告';

  @override
  String get showDataWarningAgainSubtitle =>
      '恢复矩阵警告横幅';

  @override
  String get dataWarningEnabled => '数据警告已启用';

  @override
  String get aboutApp => '关于';

  @override
  String get version => '版本';

  @override
  String get sourceMaterial => '来源资料';

  @override
  String get sourceMaterialValue => 'Milanda 国王 A 课程 — 阿毗达摩';

  @override
  String get editorialPrinciples => '编审原则';

  @override
  String get resetProgressQuestion => '重置进度？';

  @override
  String get resetProgressWarning =>
      '所有学习进度和测验分数都会被删除。此操作无法撤销。';

  @override
  String get progressResetSuccess => '学习进度已重置';

  @override
  String get unlockLessonsQuestion => '解锁所有课程？';

  @override
  String get unlockLessonsWarning =>
      '引导路径是建立扎实阿毗达摩基础的最佳方式。此选项适合有经验的学习者。';

  @override
  String get keepGuidedPath => '保留引导路径';

  @override
  String get unlock => '解锁';

  @override
  String modulesCompleted(Object completed, Object total) {
    return '已完成 $completed / $total 个模块';
  }

  @override
  String mostRecentModule(Object module) {
    return '最近模块：$module';
  }

  @override
  String lastStudied(Object date) {
    return '上次学习：$date';
  }

  @override
  String get today => '今天';

  @override
  String get yesterday => '昨天';

  @override
  String daysAgo(Object count) {
    return '$count 天前';
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
  String get matrixTitle => '阿毗达摩矩阵';

  @override
  String matrixSemantics(Object count) {
    return 'Abhidhamma Matrix showing $count cittas';
  }

  @override
  String get rotateScreen => '旋转屏幕';

  @override
  String get rotationHint =>
      '如果屏幕没有旋转，请在设备设置中启用自动旋转。';

  @override
  String get highContrast => '高对比度';

  @override
  String get help => '帮助';

  @override
  String get searchCittaCetasika => '搜索心或心所…';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get citta => '心';

  @override
  String get cetasika => '心所';

  @override
  String get unwholesome => '不善';

  @override
  String get rootless => '无因';

  @override
  String get senseSphereBeautiful => '欲界美心';

  @override
  String get formSphere => '色界';

  @override
  String get formlessSphere => '无色界';

  @override
  String get supramundane => '出世间';

  @override
  String get legend => '图例：';

  @override
  String get associationAlways => '恒常';

  @override
  String get associationSometimes => '不定';

  @override
  String get associationNever => '无';

  @override
  String dataWarningsCount(Object count) {
    return '$count data warnings';
  }

  @override
  String get matrixHelpTitle => '矩阵指南';

  @override
  String get howToRead => '阅读方式：';

  @override
  String get matrixHelpRead =>
      '• 行：心\n• 列：心所\n• 交叉处：相应关系';

  @override
  String get symbols => '符号：';

  @override
  String get matrixHelpSymbols => '✦ = 恒常相应\n◎ = 不定相应\n✕ = 不相应';

  @override
  String get tips => '提示：';

  @override
  String get matrixHelpTips =>
      '• 点按一个心查看详情\n• 点按一个心所查看冲突\n• 使用筛选缩小范围\n• 旋转屏幕获得更多空间';

  @override
  String get understood => '明白了';

  @override
  String get dataWarningTitle => 'Data warning';

  @override
  String get allFilters => '全部';

  @override
  String get defilements => 'Defilements';

  @override
  String get kamma => '业';

  @override
  String get result => '果';

  @override
  String get conditionsTitle => '缘起';

  @override
  String get conditionDetails => '缘起详情：';

  @override
  String get lastConditionDescription =>
      '这是此生命循环中的最后果报支，不再开启新的条件。';

  @override
  String conditionLinkDescription(Object effect, Object explanation) {
    return '• 条件：$effect\n  说明：$explanation';
  }

  @override
  String get conditionsTabLinks => '十二支';

  @override
  String get conditionsTabPaccaya => '二十四缘';

  @override
  String get paccayaTitle => '二十四缘（发趣论）';

  @override
  String get paccayaIntro =>
      '《缘摄分别》的 B 部分：诸法如何互为条件。A 部分是缘起十二支。';

  @override
  String get paccayaDefinition => '定义';

  @override
  String get paccayaConditioningStates =>
      '能缘法 (paccaya-dhamma)';

  @override
  String get paccayaConditionedStates => '所缘起法 (paccayuppanna)';

  @override
  String get paccayaSubdivisions => '细分';

  @override
  String get paccayaInPaticca => '作用于这些支';

  @override
  String get paccayaEmpty => '没有符合此筛选的缘。';

  @override
  String get paccayaSearchHint => '搜索一个缘…';

  @override
  String get paccayaSourceNotice =>
      '来源：《发趣论》（阿毗达摩藏第七）与《清净道论》第 XVII 章。未见 Pa-Auk 文献逐项列出二十四缘；术语仍待资深审校。';

  @override
  String get paccayaSources => '来源';

  @override
  String paccayaCount(Object count) {
    return '$count 个缘';
  }

  @override
  String get relatedDhammas => 'Related dhammas';

  @override
  String get paccayaGroupRootObject => '根与所缘';

  @override
  String get paccayaGroupContinuity => '相续';

  @override
  String get paccayaGroupConascence => '俱生与依止';

  @override
  String get paccayaGroupTimeRelation => '生起次第';

  @override
  String get paccayaGroupKammaVipaka => '业与果';

  @override
  String get paccayaGroupGeneral => '通用';

  @override
  String get kiepPast => '过去生';

  @override
  String get kiepPresent => '今生';

  @override
  String get kiepFuture => '未来生';

  @override
  String get kammaTitle => 'Kamma';

  @override
  String get mindProcessTitle => '心路过程';

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
  String get selected => '已选择';

  @override
  String get dimmedByConflict => '因冲突而淡化';

  @override
  String get matrixCornerSemantics =>
      'Matrix corner: rows are cittas and columns are cetasikas';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: citta $cittaId with cetasika $cetasikaId';
  }

  @override
  String get tapForDetails => '点按查看详情';

  @override
  String get studyPath => '学习路径';

  @override
  String get bookmarksAndNotes => '书签与笔记';

  @override
  String get overallProgress => '总进度';

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
  String get learnTab => '学习';

  @override
  String get reviewTab => '复习';

  @override
  String get testTab => '测试';

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
    return '业 — $count';
  }

  @override
  String paticcasInModule(Object count) {
    return '缘起 — $count';
  }

  @override
  String rupasInModule(Object count) {
    return '色法 — $count';
  }

  @override
  String vithisInModule(Object count) {
    return '心路过程 — $count';
  }

  @override
  String reviewCetasikaQuestion(Object name, Object pali) {
    return 'What does cetasika “$name” ($pali) mean?';
  }

  @override
  String reviewKammaQuestion(Object name, Object pali) {
    return '关于业“$name”（$pali），应该记住什么？';
  }

  @override
  String reviewPaticcaQuestion(Object name, Object pali) {
    return '关于缘起支“$name”（$pali），应该记住什么？';
  }

  @override
  String reviewRupaQuestion(Object name, Object pali) {
    return '关于色法“$name”（$pali），应该记住什么？';
  }

  @override
  String reviewVithiQuestion(Object name, Object pali) {
    return '关于心路过程“$name”（$pali），应该记住什么？';
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
  String get chooseLevel => '选择难度';

  @override
  String quizLevelDescription(Object count) {
    return 'Each level generates up to $count questions from this module';
  }

  @override
  String get insufficientQuizData =>
      'This module does not have enough data to create questions.';

  @override
  String get explanation => '解释';

  @override
  String get nextQuestion => '下一题';

  @override
  String get viewResults => '查看结果';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total correct';
  }

  @override
  String get quizExcellent => 'Excellent! You have mastered this module.';

  @override
  String get quizTryAgain => 'Review the material and try again.';

  @override
  String get tryAgain => '重试';

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
  String get beginner => '初级';

  @override
  String get beginnerDescription => 'Basic cetasika groups and feelings';

  @override
  String get intermediate => '中级';

  @override
  String get intermediateDescription => 'Includes cetasika conflicts';

  @override
  String get advanced => '高级';

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
  String get contentFallbackNotice => '此项目尚未翻译，当前显示英文学习内容。';

  @override
  String get listenAll => '全部收听';

  @override
  String get listeningQueue => '收听列表';

  @override
  String get listenFromHere => '从此处收听';

  @override
  String get nowPlaying => '正在播放';

  @override
  String get repeatOff => '关闭重复';

  @override
  String get repeatOne => '循环本节';

  @override
  String get repeatAll => '循环全部';

  @override
  String get listenAgain => '再听一遍';

  @override
  String get playbackSpeed => '语速';

  @override
  String get resumeListening => '继续收听';

  @override
  String get continueListening => 'Continue listening';

  @override
  String get sleepTimer => '睡眠定时器';

  @override
  String get sleepTimerOff => '关闭';

  @override
  String get minutesShort => '分钟';

  @override
  String get playAudio => '播放';

  @override
  String get pauseAudio => '暂停';

  @override
  String get previousTrack => '上一节';

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

class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appName => 'AbhiDhamma';

  @override
  String get appTagline => 'Abhidhamma Piṭaka';

  @override
  String get initializing => '正在初始化…';

  @override
  String get loadingDoctrineData => '正在載入並驗證佛法資料…';

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
  String get navMatrix => '矩陣';

  @override
  String get navStudy => '學習';

  @override
  String get navConditions => '緣起';

  @override
  String get navMindProcess => '心路過程';

  @override
  String get navSettings => '設定';

  @override
  String get cancel => '取消';

  @override
  String get save => '儲存';

  @override
  String get delete => '刪除';

  @override
  String get close => '關閉';

  @override
  String get start => '開始';

  @override
  String get next => '下一步';

  @override
  String get done => '完成';

  @override
  String get skip => '略過';

  @override
  String get apply => '套用';

  @override
  String get undo => '復原';

  @override
  String get reset => '重設';

  @override
  String get all => '全部';

  @override
  String get hide => '隱藏';

  @override
  String get learn => '學習';

  @override
  String get notes => '筆記';

  @override
  String errorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get languageSection => '語言';

  @override
  String get interfaceLanguage => '介面語言';

  @override
  String get interfaceLanguageSubtitle => '依照裝置語言或手動選擇';

  @override
  String get contentLanguage => '學習內容語言';

  @override
  String get contentLanguageSubtitle => '與介面語言互相獨立';

  @override
  String get systemDefault => '依照系統';

  @override
  String get systemDefaultSubtitle => '使用此裝置選擇的語言';

  @override
  String get languagePickerTitle => '語言';

  @override
  String get languagePickerSearchHint => '依語言名稱或代碼搜尋';

  @override
  String get languageChangePreviewTitle => '變更介面語言？';

  @override
  String languageChangePreviewBody(Object language) {
    return '介面將切換為$language。學習內容保持不變。';
  }

  @override
  String languageChangedTo(Object language) {
    return '語言已切換為$language';
  }

  @override
  String get holdGlobeToReset =>
      'Press and hold the globe for 3 seconds to restore the system language';

  @override
  String get restoredSystemLanguage => '已恢復系統語言';

  @override
  String get contentVietnamese => '越南語';

  @override
  String get contentEnglish => '英語';

  @override
  String get translationReviewNotice => '本語言的法義內容為國際學習譯本。巴利語術語仍為準據。';

  @override
  String get contentDraftNotice => '此譯本為草稿，尚待教義審核。依用前請對照巴利原文核實。';

  @override
  String get settingsAccessibility => '輔助使用';

  @override
  String get highContrastMode => '高對比模式';

  @override
  String get highContrastSubtitle =>
      '提高色彩對比度，方便低視力使用者';

  @override
  String get screenReaderHints => '螢幕閱讀器提示';

  @override
  String get screenReaderHintsSubtitle =>
      '為 TalkBack 和 VoiceOver 提供更多細節';

  @override
  String get textSize => '字體大小';

  @override
  String get textScale => '文字縮放';

  @override
  String get studyProgress => '學習進度';

  @override
  String get unlockAllLessons => '解鎖所有課程';

  @override
  String get unlockAllLessonsSubtitle =>
      '引導路徑能建立堅實基礎。有經驗的學習者可以解鎖所有課程。';

  @override
  String get resetProgress => '重設進度';

  @override
  String get resetProgressSubtitle => '刪除所有學習資料';

  @override
  String get showDataWarningAgain => '再次顯示資料警告';

  @override
  String get showDataWarningAgainSubtitle =>
      '恢復矩陣警告橫幅';

  @override
  String get dataWarningEnabled => '資料警告已啟用';

  @override
  String get aboutApp => '關於';

  @override
  String get version => '版本';

  @override
  String get sourceMaterial => '來源資料';

  @override
  String get sourceMaterialValue => 'Milanda 國王 A 課程 — 阿毘達摩';

  @override
  String get editorialPrinciples => '編審原則';

  @override
  String get resetProgressQuestion => '重置進度？';

  @override
  String get resetProgressWarning =>
      '所有學習進度和測驗分數都會被刪除。此操作無法復原。';

  @override
  String get progressResetSuccess => '學習進度已重置';

  @override
  String get unlockLessonsQuestion => '解鎖所有課程？';

  @override
  String get unlockLessonsWarning =>
      '引導路徑是建立扎實阿毘達摩基礎的最佳方式。此選項適合有經驗的學習者。';

  @override
  String get keepGuidedPath => '保留引導路徑';

  @override
  String get unlock => '解鎖';

  @override
  String modulesCompleted(Object completed, Object total) {
    return '已完成 $completed / $total 個模組';
  }

  @override
  String mostRecentModule(Object module) {
    return '最近模組：$module';
  }

  @override
  String lastStudied(Object date) {
    return '上次學習：$date';
  }

  @override
  String get today => '今天';

  @override
  String get yesterday => '昨天';

  @override
  String daysAgo(Object count) {
    return '$count 天前';
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
  String get matrixTitle => '阿毘達摩矩陣';

  @override
  String matrixSemantics(Object count) {
    return 'Abhidhamma Matrix showing $count cittas';
  }

  @override
  String get rotateScreen => '旋轉螢幕';

  @override
  String get rotationHint =>
      '如果螢幕沒有旋轉，請在裝置設定中啟用自動旋轉。';

  @override
  String get highContrast => '高對比';

  @override
  String get help => '說明';

  @override
  String get searchCittaCetasika => '搜尋心或心所…';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get citta => '心';

  @override
  String get cetasika => '心所';

  @override
  String get unwholesome => '不善';

  @override
  String get rootless => '無因';

  @override
  String get senseSphereBeautiful => '欲界美心';

  @override
  String get formSphere => '色界';

  @override
  String get formlessSphere => '無色界';

  @override
  String get supramundane => '出世間';

  @override
  String get legend => '圖例：';

  @override
  String get associationAlways => '恆常';

  @override
  String get associationSometimes => '不定';

  @override
  String get associationNever => '無';

  @override
  String dataWarningsCount(Object count) {
    return '$count data warnings';
  }

  @override
  String get matrixHelpTitle => '矩陣指南';

  @override
  String get howToRead => '閱讀方式：';

  @override
  String get matrixHelpRead =>
      '• 行：心\n• 列：心所\n• 交叉處：相應關係';

  @override
  String get symbols => '符號：';

  @override
  String get matrixHelpSymbols => '✦ = 恆常相應\n◎ = 不定相應\n✕ = 不相應';

  @override
  String get tips => '提示：';

  @override
  String get matrixHelpTips =>
      '• 點按一個心查看詳情\n• 點按一個心所查看衝突\n• 使用篩選縮小範圍\n• 旋轉螢幕獲得更多空間';

  @override
  String get understood => '明白了';

  @override
  String get dataWarningTitle => 'Data warning';

  @override
  String get allFilters => '全部';

  @override
  String get defilements => 'Defilements';

  @override
  String get kamma => '業';

  @override
  String get result => '果';

  @override
  String get conditionsTitle => '緣起';

  @override
  String get conditionDetails => '緣起詳情：';

  @override
  String get lastConditionDescription =>
      '這是此生命循環中的最後果報支，不再開啟新的條件。';

  @override
  String conditionLinkDescription(Object effect, Object explanation) {
    return '• 條件：$effect\n  說明：$explanation';
  }

  @override
  String get conditionsTabLinks => '十二支';

  @override
  String get conditionsTabPaccaya => '二十四緣';

  @override
  String get paccayaTitle => '二十四緣（發趣論）';

  @override
  String get paccayaIntro =>
      '《緣攝分別》的 B 部分：諸法如何互為條件。A 部分是緣起十二支。';

  @override
  String get paccayaDefinition => '定義';

  @override
  String get paccayaConditioningStates =>
      '能緣法 (paccaya-dhamma)';

  @override
  String get paccayaConditionedStates => '所緣起法 (paccayuppanna)';

  @override
  String get paccayaSubdivisions => '細分';

  @override
  String get paccayaInPaticca => '作用於這些支';

  @override
  String get paccayaEmpty => '沒有符合此篩選的緣。';

  @override
  String get paccayaSearchHint => '搜尋一個緣…';

  @override
  String get paccayaSourceNotice =>
      '來源：《發趣論》（阿毘達摩藏第七）與《清淨道論》第 XVII 章。未見 Pa-Auk 文獻逐項列出二十四緣；術語仍待資深審校。';

  @override
  String get paccayaSources => '來源';

  @override
  String paccayaCount(Object count) {
    return '$count 個緣';
  }

  @override
  String get relatedDhammas => 'Related dhammas';

  @override
  String get paccayaGroupRootObject => '根與所緣';

  @override
  String get paccayaGroupContinuity => '相續';

  @override
  String get paccayaGroupConascence => '俱生與依止';

  @override
  String get paccayaGroupTimeRelation => '生起次第';

  @override
  String get paccayaGroupKammaVipaka => '業與果';

  @override
  String get paccayaGroupGeneral => '通用';

  @override
  String get kiepPast => '過去生';

  @override
  String get kiepPresent => '今生';

  @override
  String get kiepFuture => '未來生';

  @override
  String get kammaTitle => 'Kamma';

  @override
  String get mindProcessTitle => '心路過程';

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
  String get selected => '已選擇';

  @override
  String get dimmedByConflict => '因衝突而淡化';

  @override
  String get matrixCornerSemantics =>
      'Matrix corner: rows are cittas and columns are cetasikas';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: citta $cittaId with cetasika $cetasikaId';
  }

  @override
  String get tapForDetails => '點按查看詳情';

  @override
  String get studyPath => '學習路徑';

  @override
  String get bookmarksAndNotes => '書籤與筆記';

  @override
  String get overallProgress => '總進度';

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
  String get learnTab => '學習';

  @override
  String get reviewTab => '複習';

  @override
  String get testTab => '測驗';

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
    return '業 — $count';
  }

  @override
  String paticcasInModule(Object count) {
    return '緣起 — $count';
  }

  @override
  String rupasInModule(Object count) {
    return '色法 — $count';
  }

  @override
  String vithisInModule(Object count) {
    return '心路過程 — $count';
  }

  @override
  String reviewCetasikaQuestion(Object name, Object pali) {
    return 'What does cetasika “$name” ($pali) mean?';
  }

  @override
  String reviewKammaQuestion(Object name, Object pali) {
    return '關於業「$name」（$pali），應該記住什麼？';
  }

  @override
  String reviewPaticcaQuestion(Object name, Object pali) {
    return '關於緣起支「$name」（$pali），應該記住什麼？';
  }

  @override
  String reviewRupaQuestion(Object name, Object pali) {
    return '關於色法「$name」（$pali），應該記住什麼？';
  }

  @override
  String reviewVithiQuestion(Object name, Object pali) {
    return '關於心路過程「$name」（$pali），應該記住什麼？';
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
  String get chooseLevel => '選擇難度';

  @override
  String quizLevelDescription(Object count) {
    return 'Each level generates up to $count questions from this module';
  }

  @override
  String get insufficientQuizData =>
      'This module does not have enough data to create questions.';

  @override
  String get explanation => '解釋';

  @override
  String get nextQuestion => '下一題';

  @override
  String get viewResults => '查看結果';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total correct';
  }

  @override
  String get quizExcellent => 'Excellent! You have mastered this module.';

  @override
  String get quizTryAgain => 'Review the material and try again.';

  @override
  String get tryAgain => '再試一次';

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
  String get beginner => '初級';

  @override
  String get beginnerDescription => 'Basic cetasika groups and feelings';

  @override
  String get intermediate => '中級';

  @override
  String get intermediateDescription => 'Includes cetasika conflicts';

  @override
  String get advanced => '高級';

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
  String get contentFallbackNotice => '此項目尚未翻譯，目前顯示英文學習內容。';

  @override
  String get listenAll => '全部收聽';

  @override
  String get listeningQueue => '收聽清單';

  @override
  String get listenFromHere => '從此處收聽';

  @override
  String get nowPlaying => '正在播放';

  @override
  String get repeatOff => '關閉重複';

  @override
  String get repeatOne => '循環本節';

  @override
  String get repeatAll => '循環全部';

  @override
  String get listenAgain => '再聽一遍';

  @override
  String get playbackSpeed => '語速';

  @override
  String get resumeListening => '繼續收聽';

  @override
  String get sleepTimer => '睡眠計時器';

  @override
  String get sleepTimerOff => '關閉';

  @override
  String get minutesShort => '分鐘';

  @override
  String get playAudio => '播放';

  @override
  String get pauseAudio => '暫停';

  @override
  String get previousTrack => '上一節';
}
