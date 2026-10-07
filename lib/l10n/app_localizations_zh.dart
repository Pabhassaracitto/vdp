// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => '阿毗达摩';

  @override
  String get appTagline => '阿毗达摩藏';

  @override
  String get initializing => '正在初始化…';

  @override
  String get loadingDoctrineData => '正在加载并校验法数数据…';

  @override
  String get loadingTakingLonger => '启动时间长于预期。可能正在为您的设备优化数据。';

  @override
  String get unknownError => '未知错误';

  @override
  String get dataError => '数据错误';

  @override
  String get invalidData => '数据无效';

  @override
  String get invalidDataDescription => '系统检测到法数校验规则冲突。请联系编辑团队审查数据。';

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
    return '错误: $message';
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
  String get holdGlobeToReset => '长按地球图标3秒可恢复系统语言';

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
  String get highContrastSubtitle => '提高色彩对比度，方便低视力用户';

  @override
  String get screenReaderHints => '屏幕阅读器提示';

  @override
  String get screenReaderHintsSubtitle => '为 TalkBack 和 VoiceOver 提供更多细节';

  @override
  String get textSize => '字体大小';

  @override
  String get textScale => '文字缩放';

  @override
  String get studyProgress => '学习进度';

  @override
  String get unlockAllLessons => '解锁所有课程';

  @override
  String get unlockAllLessonsSubtitle => '引导路径能建立坚实基础。有经验的学习者可以解锁所有课程。';

  @override
  String get resetProgress => '重置进度';

  @override
  String get resetProgressSubtitle => '删除所有学习数据';

  @override
  String get showDataWarningAgain => '再次显示数据警告';

  @override
  String get showDataWarningAgainSubtitle => '恢复矩阵警告横幅';

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
  String get resetProgressWarning => '所有学习进度和测验分数都会被删除。此操作无法撤销。';

  @override
  String get progressResetSuccess => '学习进度已重置';

  @override
  String get unlockLessonsQuestion => '解锁所有课程？';

  @override
  String get unlockLessonsWarning => '引导路径是建立扎实阿毗达摩基础的最佳方式。此选项适合有经验的学习者。';

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
  String get onboardingVisualTitle => '清晰洞见';

  @override
  String get onboardingVisualSubtitle => '心与心所矩阵';

  @override
  String get onboardingVisualBody => '在交互式矩阵中探索121种心和52种心所。色彩、形状与文字清晰标示每种相应关系。';

  @override
  String get onboardingCausalityTitle => '深刻理解';

  @override
  String get onboardingCausalitySubtitle => '十二缘起';

  @override
  String get onboardingCausalityBody => '通过互联的学习视角探索十二缘起支与业的分类法。';

  @override
  String get onboardingExploreTitle => '自主探索';

  @override
  String get onboardingExploreSubtitle => '非线性学习路径';

  @override
  String get onboardingExploreBody => '自由选择十个相互关联的修学单元。主动回忆、测验与复习助您稳固法义。';

  @override
  String get beginExploring => '开始探索';

  @override
  String get matrixTitle => '阿毗达摩矩阵';

  @override
  String matrixSemantics(Object count) {
    return '阿毗达摩矩阵，显示 $count 种心';
  }

  @override
  String get rotateScreen => '旋转屏幕';

  @override
  String get rotationHint => '如果屏幕没有旋转，请在设备设置中启用自动旋转。';

  @override
  String get highContrast => '高对比度';

  @override
  String get help => '帮助';

  @override
  String get searchCittaCetasika => '搜索心或心所…';

  @override
  String get clearSearch => '清除搜索';

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
    return '$count 个数据警告';
  }

  @override
  String get matrixHelpTitle => '矩阵指南';

  @override
  String get howToRead => '阅读方式：';

  @override
  String get matrixHelpRead => '• 行：心\n• 列：心所\n• 交叉处：相应关系';

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
  String get matrixListenCittas => '收听全部心';

  @override
  String get matrixListenCetasikas => '收听全部心所';

  @override
  String get matrixListenFromHint => '长按可从此项开始收听';

  @override
  String get matrixListenHelpBody => '长按某一行心或某一列心所可从该项开始收听。点击表格角落的耳机图标可收听整个列表。';

  @override
  String get understood => '明白了';

  @override
  String get dataWarningTitle => '数据警告';

  @override
  String get allFilters => '全部';

  @override
  String get defilements => '烦恼';

  @override
  String get kamma => '业';

  @override
  String get result => '果';

  @override
  String get conditionsTitle => '缘起';

  @override
  String get conditionDetails => '缘起详情：';

  @override
  String get lastConditionDescription => '这是此生命循环中的最后果报支，不再开启新的条件。';

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
  String get paccayaIntro => '《缘摄分别》的 B 部分：诸法如何互为条件。A 部分是缘起十二支。';

  @override
  String get paccayaDefinition => '定义';

  @override
  String get paccayaConditioningStates => '能缘法 (paccaya-dhamma)';

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
  String get relatedDhammas => '相关法';

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
  String get kammaTitle => '业 (Kamma)';

  @override
  String get mindProcessTitle => '心路过程';

  @override
  String get paliLabel => '巴利语:';

  @override
  String get stopPronunciation => '停止发音';

  @override
  String get listenPaliPronunciation => '聆听巴利语发音';

  @override
  String get ttsUnavailable => '此设备不支持语音合成。';

  @override
  String get dragHandleSemantics => '拖动以调整大小';

  @override
  String cittaNumber(Object number) {
    return '第 $number 心';
  }

  @override
  String get doctrine => '教理说明';

  @override
  String get examples => '例子';

  @override
  String fixedCetasikasCount(Object count) {
    return '固定心所 ($count)';
  }

  @override
  String variableCetasikasCount(Object count) {
    return '不固定心所 ($count)';
  }

  @override
  String get personalNote => '个人笔记';

  @override
  String get personalNoteHint => '输入您的笔记…';

  @override
  String get wholesome => '善';

  @override
  String get functional => '唯作';

  @override
  String get pleasantFeeling => '乐受';

  @override
  String get unpleasantFeeling => '苦受';

  @override
  String get neutralFeeling => '舍受';

  @override
  String get joyfulFeeling => '喜受';

  @override
  String get alwaysAssociated => '必定相应';

  @override
  String get mayBeAssociated => '可能相应';

  @override
  String get fourfoldDefinition => '四种特相 (特相/作用/现起/近因)';

  @override
  String get characteristic => '特相 (Lakkhaṇa)';

  @override
  String get functionLabel => '作用 (Rasa)';

  @override
  String get manifestation => '现起 (Paccupaṭṭhāna)';

  @override
  String get proximateCause => '近因 (Padaṭṭhāna)';

  @override
  String get doctrinalConflicts => '教理相违心所';

  @override
  String rulesCount(Object count) {
    return '$count 条规则';
  }

  @override
  String get universalCetasikas => '7 通一切心心所';

  @override
  String get occasionalCetasikas => '6 杂心所';

  @override
  String get unwholesomeCetasikas => '14 不善心所';

  @override
  String get beautifulCetasikas => '25 美心所';

  @override
  String rowCittaSemantics(Object displayIndex, Object name, Object order,
      Object group, Object feeling, Object action) {
    return '第 $displayIndex 行心: $name; 典籍编号 $order; 分组 $group; 感受 $feeling。$action';
  }

  @override
  String cetasikaSemantics(
      Object name, Object pali, Object group, Object state) {
    return '心所 $name ($pali)，分组 $group。$state 点击查看详情。';
  }

  @override
  String get selected => '已选择';

  @override
  String get dimmedByConflict => '因冲突而淡化';

  @override
  String get matrixCornerSemantics => '矩阵角: 行代表心，列代表心所';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: 心 $cittaId 与 心所 $cetasikaId';
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
    return '$count 个已保存项目';
  }

  @override
  String get cittaTab => '心';

  @override
  String get cetasikaTab => '心所';

  @override
  String get notesTab => '笔记';

  @override
  String get noBookmarkedCittas => '暂无收藏的心';

  @override
  String get bookmarkCittaHint => '打开修学课程并点击书签图标以保存';

  @override
  String get loadingCittas => '正在加载心的数据…';

  @override
  String get noBookmarkedCetasikas => '暂无收藏的心所';

  @override
  String get loadingCetasikas => '正在加载心所数据…';

  @override
  String get noNotes => '暂无笔记';

  @override
  String get addNoteHint => '在修学中点击编辑图标添加个人笔记';

  @override
  String get deleteNoteQuestion => '删除笔记？';

  @override
  String get deleteNoteWarning => '此笔记将被永久删除。您确定吗？';

  @override
  String get addNote => '添加笔记';

  @override
  String get removeBookmark => '移除书签';

  @override
  String get editNote => '编辑笔记';

  @override
  String get deleteNote => '删除笔记';

  @override
  String get noteUpdated => '笔记已更新';

  @override
  String get noteSaved => '笔记已保存';

  @override
  String get editNoteTitle => '编辑笔记';

  @override
  String get addNoteTitle => '添加笔记';

  @override
  String get studyNoteHint => '写下您关于此项的修学体会…\n\n例如：此心在禅修中生起于…';

  @override
  String charactersCount(Object current, Object maximum) {
    return '$current / $maximum 字符';
  }

  @override
  String get update => '更新';

  @override
  String get saveNote => '保存笔记';

  @override
  String studyProgressPercent(Object percent) {
    return '修学进度: $percent%';
  }

  @override
  String get modulesCompletedShort => '已完成\n单元';

  @override
  String get recommendedNext => '推荐下一单元';

  @override
  String get progressOverview => '修学进度概览';

  @override
  String get totalModules => '单元总数';

  @override
  String get dueForReview => '待复习';

  @override
  String get learnTab => '学习';

  @override
  String get reviewTab => '复习';

  @override
  String get testTab => '测试';

  @override
  String get moduleHasNoData => '此单元暂无心/心所数据。请检查JSON数据。';

  @override
  String cittasInModule(Object count) {
    return '本单元包含的心 — $count';
  }

  @override
  String cetasikasInModule(Object count) {
    return '本单元包含的心所 — $count';
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
    return '心所 “$name” ($pali) 的含义是什么？';
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
    return '分组: $group';
  }

  @override
  String reviewCittaQuestion(Object name) {
    return '心 “$name” 属于哪个界，伴随何种感受？';
  }

  @override
  String cittaReviewAnswer(Object sphere, Object feeling, Object pali) {
    return '界: $sphere\n感受: $feeling\n巴利语: $pali';
  }

  @override
  String get noReviewContent => '此单元暂无复习内容。请稍后查看。';

  @override
  String reviewedCount(Object revealed, Object total) {
    return '$revealed / $total 已复习';
  }

  @override
  String get reviewComplete => '您已复习全部内容。快来通过测验检验理解吧。';

  @override
  String get tapToReveal => '点击显示答案';

  @override
  String answerLabel(Object answer) {
    return '答案: $answer';
  }

  @override
  String get revealAnswer => '显示答案';

  @override
  String moduleQuizTitle(Object module) {
    return '测验\n$module';
  }

  @override
  String moduleContentCount(Object count) {
    return '本单元共 $count 个知识点';
  }

  @override
  String get quizMaximumDescription => '涵盖本单元的最多10道单项选择题';

  @override
  String get startQuiz => '开始测验';

  @override
  String cittasCount(Object count) {
    return '$count 种心';
  }

  @override
  String cetasikasCount(Object count) {
    return '$count 种心所';
  }

  @override
  String noteForItem(Object name) {
    return '笔记: $name';
  }

  @override
  String get chooseLevel => '选择难度';

  @override
  String quizLevelDescription(Object count) {
    return '每个级别从本单元生成最多 $count 道题目';
  }

  @override
  String get insufficientQuizData => '本单元数据不足以生成题目。';

  @override
  String get explanation => '解释';

  @override
  String get nextQuestion => '下一题';

  @override
  String get viewResults => '查看结果';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total 正确';
  }

  @override
  String get quizExcellent => '太棒了！您已掌握本单元内容。';

  @override
  String get quizTryAgain => '请温习课程内容后重试。';

  @override
  String get tryAgain => '重试';

  @override
  String quizInsufficientDataMessage(Object module) {
    return '单元 “$module” 数据不足以生成题目。';
  }

  @override
  String get quizTypeCetasikaGroup => '心所分类';

  @override
  String get quizTypeFeeling => '感受辨识';

  @override
  String get quizTypeConflict => '教理相违';

  @override
  String get quizTypeSphere => '界 (Sphere)';

  @override
  String get beginner => '初级';

  @override
  String get beginnerDescription => '基础心所分组与感受';

  @override
  String get intermediate => '中级';

  @override
  String get intermediateDescription => '包含心所相违规则';

  @override
  String get advanced => '高级';

  @override
  String get advancedDescription => '包含界分类及所有题型';

  @override
  String get trueLabel => '正确';

  @override
  String get falseLabel => '错误';

  @override
  String get trueOrFalse => '对还是错？';

  @override
  String quizCetasikaGroupQuestion(Object name, Object pali) {
    return '“$name” ($pali) 属于哪个心所分组？';
  }

  @override
  String quizCetasikaGroupExplanation(
      Object name, Object group, Object description) {
    return '“$name” 属于 $group。\n$description';
  }

  @override
  String quizCetasikaClaim(Object name, Object pali, Object group) {
    return '“$name” ($pali) 属于 $group。对还是错？';
  }

  @override
  String quizCittaFeelingQuestion(Object name) {
    return '心 “$name” 伴随何种感受？';
  }

  @override
  String quizCittaFeelingExplanation(Object name, Object feeling) {
    return '“$name” 伴随 $feeling。';
  }

  @override
  String quizCittaFeelingClaim(Object name, Object feeling) {
    return '心 “$name” 伴随 $feeling。对还是错？';
  }

  @override
  String get conflictNo => '否 — 彼此相违';

  @override
  String get conflictAlwaysYes => '是 — 恒常俱起';

  @override
  String get conflictSometimesYes => '是 — 有时俱起';

  @override
  String quizConflictQuestion(Object first, Object second) {
    return '“$first” 和 “$second” 能否在同一个心中同起？';
  }

  @override
  String quizSphereQuestion(Object name) {
    return '心 “$name” 属于哪个界？';
  }

  @override
  String quizSphereExplanation(Object name, Object sphere) {
    return '“$name” 属于 $sphere。';
  }

  @override
  String quizSphereClaim(Object name, Object sphere) {
    return '心 “$name” 属于 $sphere。对还是错？';
  }

  @override
  String get phaseFoundation => '第一阶段 — 基础';

  @override
  String get phaseCausality => '第二阶段 — 因果';

  @override
  String get phaseMastery => '第三阶段 — 通达';

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
  String get minutesShort => '分钟';

  @override
  String get playAudio => '播放';

  @override
  String get pauseAudio => '暂停';

  @override
  String get previousTrack => '上一节';

  @override
  String get sleepTimer => '睡眠定时器';

  @override
  String get sleepTimerOff => '关闭';

  @override
  String get sleepTimer15 => '15 分钟';

  @override
  String get sleepTimer30 => '30 分钟';

  @override
  String get sleepTimer60 => '60 分钟';

  @override
  String sleepTimerRemaining(Object minutes) {
    return '睡眠定时器：剩余 $minutes 分钟';
  }

  @override
  String get audioModelUnavailable => '神经语音不可用，正在使用设备语音';

  @override
  String get realDuration => '时长';

  @override
  String get estimatedDuration => '预计时长';

  @override
  String get continueListening => '继续聆听';

  @override
  String get audioBackgroundLimit => '后台音频播放取决于系统已安装的语音引擎';

  @override
  String get karaokeSettingsTitle => '聆听与卡拉OK高亮';

  @override
  String get karaokeModeTitle => '高亮跟读模式';

  @override
  String get karaokeModeSubtitle => '聆听时高亮显示正在朗读的文本';

  @override
  String get karaokeLineHighlightTitle => '高亮当前行';

  @override
  String get karaokeLineHighlightSubtitle => '对正在朗读的段落进行背景高亮';

  @override
  String get karaokeWordHighlightTitle => '逐字高亮';

  @override
  String get karaokeWordHighlightSubtitle => '根据朗读节奏逐字高亮（估算时间）';

  @override
  String get audioFloatingGoTo => '转到正在播放的内容';

  @override
  String get audioFloatingHide => '隐藏播放栏';

  @override
  String get audioFloatingRestore => '显示播放栏';

  @override
  String get audioFloatingClose => '关闭播放器';

  @override
  String get playModeTitle => '播放模式';

  @override
  String get playModeOnce => '仅此项';

  @override
  String get playModeSequence => '连续播放';

  @override
  String get playModeOnceHint => '当前项读完后停止';

  @override
  String get playModeRepeatOneHint => '反复朗读当前项';

  @override
  String get playModeSequenceHint => '继续播放后面的项目，到列表末尾停止';

  @override
  String get playModeRepeatAllHint => '继续播放，到最后回到开头循环';

  @override
  String get audioBubbleExpand => '展开播放栏';

  @override
  String get audioBubbleCollapse => '收起播放栏';

  @override
  String get studyTreeExpandAll => '全部展开';

  @override
  String get studyTreeCollapseAll => '全部收起';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appName => '阿毗達摩';

  @override
  String get appTagline => '阿毗達摩藏';

  @override
  String get initializing => '正在初始化…';

  @override
  String get loadingDoctrineData => '正在加載並校驗法數數據…';

  @override
  String get loadingTakingLonger => '啟動時間長於預期。可能正在為您的設備優化數據。';

  @override
  String get unknownError => '未知錯誤';

  @override
  String get dataError => '數據錯誤';

  @override
  String get invalidData => '數據無效';

  @override
  String get invalidDataDescription => '系統檢測到法數校驗規則衝突。請聯繫編輯團隊審查數據。';

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
    return '錯誤: $message';
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
  String get holdGlobeToReset => '長按地球圖標3秒可恢復系統語言';

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
  String get highContrastSubtitle => '提高色彩對比度，方便低視力使用者';

  @override
  String get screenReaderHints => '螢幕閱讀器提示';

  @override
  String get screenReaderHintsSubtitle => '為 TalkBack 和 VoiceOver 提供更多細節';

  @override
  String get textSize => '字體大小';

  @override
  String get textScale => '文字縮放';

  @override
  String get studyProgress => '學習進度';

  @override
  String get unlockAllLessons => '解鎖所有課程';

  @override
  String get unlockAllLessonsSubtitle => '引導路徑能建立堅實基礎。有經驗的學習者可以解鎖所有課程。';

  @override
  String get resetProgress => '重設進度';

  @override
  String get resetProgressSubtitle => '刪除所有學習資料';

  @override
  String get showDataWarningAgain => '再次顯示資料警告';

  @override
  String get showDataWarningAgainSubtitle => '恢復矩陣警告橫幅';

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
  String get resetProgressWarning => '所有學習進度和測驗分數都會被刪除。此操作無法復原。';

  @override
  String get progressResetSuccess => '學習進度已重置';

  @override
  String get unlockLessonsQuestion => '解鎖所有課程？';

  @override
  String get unlockLessonsWarning => '引導路徑是建立扎實阿毘達摩基礎的最佳方式。此選項適合有經驗的學習者。';

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
  String get onboardingVisualTitle => '清晰洞見';

  @override
  String get onboardingVisualSubtitle => '心與心所矩陣';

  @override
  String get onboardingVisualBody => '在互動式矩陣中探索121種心和52種心所。色彩、形狀與文字清晰標示每種相應關係。';

  @override
  String get onboardingCausalityTitle => '深刻理解';

  @override
  String get onboardingCausalitySubtitle => '十二緣起';

  @override
  String get onboardingCausalityBody => '透過互聯的學習視角探索十二緣起支與業的分類法。';

  @override
  String get onboardingExploreTitle => '自主探索';

  @override
  String get onboardingExploreSubtitle => '非線性學習路徑';

  @override
  String get onboardingExploreBody => '自由選擇十個相互關聯的修學單元。主動回憶、測驗與複習助您穩固法義。';

  @override
  String get beginExploring => '開始探索';

  @override
  String get matrixTitle => '阿毘達摩矩陣';

  @override
  String matrixSemantics(Object count) {
    return '阿毗達摩矩陣，顯示 $count 種心';
  }

  @override
  String get rotateScreen => '旋轉螢幕';

  @override
  String get rotationHint => '如果螢幕沒有旋轉，請在裝置設定中啟用自動旋轉。';

  @override
  String get highContrast => '高對比';

  @override
  String get help => '說明';

  @override
  String get searchCittaCetasika => '搜尋心或心所…';

  @override
  String get clearSearch => '清除搜尋';

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
    return '$count 個數據警告';
  }

  @override
  String get matrixHelpTitle => '矩陣指南';

  @override
  String get howToRead => '閱讀方式：';

  @override
  String get matrixHelpRead => '• 行：心\n• 列：心所\n• 交叉處：相應關係';

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
  String get matrixListenCittas => '收聽全部心';

  @override
  String get matrixListenCetasikas => '收聽全部心所';

  @override
  String get matrixListenFromHint => '長按可從此項開始收聽';

  @override
  String get matrixListenHelpBody => '長按某一行心或某一列心所可從該項開始收聽。點擊表格角落的耳機圖標可收聽整個列表。';

  @override
  String get understood => '明白了';

  @override
  String get dataWarningTitle => '數據警告';

  @override
  String get allFilters => '全部';

  @override
  String get defilements => '煩惱';

  @override
  String get kamma => '業';

  @override
  String get result => '果';

  @override
  String get conditionsTitle => '緣起';

  @override
  String get conditionDetails => '緣起詳情：';

  @override
  String get lastConditionDescription => '這是此生命循環中的最後果報支，不再開啟新的條件。';

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
  String get paccayaIntro => '《緣攝分別》的 B 部分：諸法如何互為條件。A 部分是緣起十二支。';

  @override
  String get paccayaDefinition => '定義';

  @override
  String get paccayaConditioningStates => '能緣法 (paccaya-dhamma)';

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
  String get relatedDhammas => '相關法';

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
  String get kammaTitle => '業 (Kamma)';

  @override
  String get mindProcessTitle => '心路過程';

  @override
  String get paliLabel => '巴利語:';

  @override
  String get stopPronunciation => '停止發音';

  @override
  String get listenPaliPronunciation => '聆聽巴利語發音';

  @override
  String get ttsUnavailable => '此設備不支援語音合成。';

  @override
  String get dragHandleSemantics => '拖動以調整大小';

  @override
  String cittaNumber(Object number) {
    return '第 $number 心';
  }

  @override
  String get doctrine => '教理說明';

  @override
  String get examples => '例子';

  @override
  String fixedCetasikasCount(Object count) {
    return '固定心所 ($count)';
  }

  @override
  String variableCetasikasCount(Object count) {
    return '不固定心所 ($count)';
  }

  @override
  String get personalNote => '個人筆記';

  @override
  String get personalNoteHint => '輸入您的筆記…';

  @override
  String get wholesome => '善';

  @override
  String get functional => '唯作';

  @override
  String get pleasantFeeling => '樂受';

  @override
  String get unpleasantFeeling => '苦受';

  @override
  String get neutralFeeling => '捨受';

  @override
  String get joyfulFeeling => '喜受';

  @override
  String get alwaysAssociated => '必定相應';

  @override
  String get mayBeAssociated => '可能相應';

  @override
  String get fourfoldDefinition => '四種特相 (特相/作用/現起/近因)';

  @override
  String get characteristic => '特相 (Lakkhaṇa)';

  @override
  String get functionLabel => '作用 (Rasa)';

  @override
  String get manifestation => '現起 (Paccupaṭṭhāna)';

  @override
  String get proximateCause => '近因 (Padaṭṭhāna)';

  @override
  String get doctrinalConflicts => '教理相違心所';

  @override
  String rulesCount(Object count) {
    return '$count 條規則';
  }

  @override
  String get universalCetasikas => '7 通一切心心所';

  @override
  String get occasionalCetasikas => '6 雜心所';

  @override
  String get unwholesomeCetasikas => '14 不善心所';

  @override
  String get beautifulCetasikas => '25 美心所';

  @override
  String rowCittaSemantics(Object displayIndex, Object name, Object order,
      Object group, Object feeling, Object action) {
    return '第 $displayIndex 行心: $name; 典籍編號 $order; 分組 $group; 感受 $feeling。$action';
  }

  @override
  String cetasikaSemantics(
      Object name, Object pali, Object group, Object state) {
    return '心所 $name ($pali)，分組 $group。$state 點擊查看詳情。';
  }

  @override
  String get selected => '已選擇';

  @override
  String get dimmedByConflict => '因衝突而淡化';

  @override
  String get matrixCornerSemantics => '矩陣角: 行代表心，列代表心所';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: 心 $cittaId 與 心所 $cetasikaId';
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
    return '$count 個已保存項目';
  }

  @override
  String get cittaTab => '心';

  @override
  String get cetasikaTab => '心所';

  @override
  String get notesTab => '筆記';

  @override
  String get noBookmarkedCittas => '暫無收藏的心';

  @override
  String get bookmarkCittaHint => '打開修學課程並點擊書籤圖標以保存';

  @override
  String get loadingCittas => '正在加載心的數據…';

  @override
  String get noBookmarkedCetasikas => '暫無收藏的心所';

  @override
  String get loadingCetasikas => '正在加載心所數據…';

  @override
  String get noNotes => '暫無筆記';

  @override
  String get addNoteHint => '在修學中點擊編輯圖標添加個人筆記';

  @override
  String get deleteNoteQuestion => '刪除筆記？';

  @override
  String get deleteNoteWarning => '此筆記將被永久刪除。您確定嗎？';

  @override
  String get addNote => '添加筆記';

  @override
  String get removeBookmark => '移除書籤';

  @override
  String get editNote => '編輯筆記';

  @override
  String get deleteNote => '刪除筆記';

  @override
  String get noteUpdated => '筆記已更新';

  @override
  String get noteSaved => '筆記已保存';

  @override
  String get editNoteTitle => '編輯筆記';

  @override
  String get addNoteTitle => '添加筆記';

  @override
  String get studyNoteHint => '寫下您關於此項的修學體會…\n\n例如：此心在禪修中生起於…';

  @override
  String charactersCount(Object current, Object maximum) {
    return '$current / $maximum 字符';
  }

  @override
  String get update => '更新';

  @override
  String get saveNote => '保存筆記';

  @override
  String studyProgressPercent(Object percent) {
    return '修學進度: $percent%';
  }

  @override
  String get modulesCompletedShort => '已完成\n單元';

  @override
  String get recommendedNext => '推薦下一單元';

  @override
  String get progressOverview => '修學進度概覽';

  @override
  String get totalModules => '單元總數';

  @override
  String get dueForReview => '待複習';

  @override
  String get learnTab => '學習';

  @override
  String get reviewTab => '複習';

  @override
  String get testTab => '測驗';

  @override
  String get moduleHasNoData => '此單元暫無心/心所數據。請檢查JSON數據。';

  @override
  String cittasInModule(Object count) {
    return '本單元包含的心 — $count';
  }

  @override
  String cetasikasInModule(Object count) {
    return '本單元包含的心所 — $count';
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
    return '心所 “$name” ($pali) 的含義是什麼？';
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
    return '分組: $group';
  }

  @override
  String reviewCittaQuestion(Object name) {
    return '心 “$name” 屬於哪個界，伴隨何種感受？';
  }

  @override
  String cittaReviewAnswer(Object sphere, Object feeling, Object pali) {
    return '界: $sphere\n感受: $feeling\n巴利語: $pali';
  }

  @override
  String get noReviewContent => '此單元暫無複習內容。請稍後查看。';

  @override
  String reviewedCount(Object revealed, Object total) {
    return '$revealed / $total 已複習';
  }

  @override
  String get reviewComplete => '您已複習全部內容。快來透過測驗檢驗理解吧。';

  @override
  String get tapToReveal => '點擊顯示答案';

  @override
  String answerLabel(Object answer) {
    return '答案: $answer';
  }

  @override
  String get revealAnswer => '顯示答案';

  @override
  String moduleQuizTitle(Object module) {
    return '測驗\n$module';
  }

  @override
  String moduleContentCount(Object count) {
    return '本單元共 $count 個知識點';
  }

  @override
  String get quizMaximumDescription => '涵蓋本單元的最多10道單項選擇題';

  @override
  String get startQuiz => '開始測驗';

  @override
  String cittasCount(Object count) {
    return '$count 種心';
  }

  @override
  String cetasikasCount(Object count) {
    return '$count 種心所';
  }

  @override
  String noteForItem(Object name) {
    return '筆記: $name';
  }

  @override
  String get chooseLevel => '選擇難度';

  @override
  String quizLevelDescription(Object count) {
    return '每個級別從本單元生成最多 $count 道題目';
  }

  @override
  String get insufficientQuizData => '本單元數據不足以生成題目。';

  @override
  String get explanation => '解釋';

  @override
  String get nextQuestion => '下一題';

  @override
  String get viewResults => '查看結果';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total 正確';
  }

  @override
  String get quizExcellent => '太棒了！您已掌握本單元內容。';

  @override
  String get quizTryAgain => '請溫習課程內容後重試。';

  @override
  String get tryAgain => '再試一次';

  @override
  String quizInsufficientDataMessage(Object module) {
    return '單元 “$module” 數據不足以生成題目。';
  }

  @override
  String get quizTypeCetasikaGroup => '心所分類';

  @override
  String get quizTypeFeeling => '感受辨識';

  @override
  String get quizTypeConflict => '教理相違';

  @override
  String get quizTypeSphere => '界 (Sphere)';

  @override
  String get beginner => '初級';

  @override
  String get beginnerDescription => '基礎心所分組與感受';

  @override
  String get intermediate => '中級';

  @override
  String get intermediateDescription => '包含心所相違規則';

  @override
  String get advanced => '高級';

  @override
  String get advancedDescription => '包含界分類及所有題型';

  @override
  String get trueLabel => '正確';

  @override
  String get falseLabel => '錯誤';

  @override
  String get trueOrFalse => '對還是錯？';

  @override
  String quizCetasikaGroupQuestion(Object name, Object pali) {
    return '“$name” ($pali) 屬於哪個心所分組？';
  }

  @override
  String quizCetasikaGroupExplanation(
      Object name, Object group, Object description) {
    return '“$name” 屬於 $group。\n$description';
  }

  @override
  String quizCetasikaClaim(Object name, Object pali, Object group) {
    return '“$name” ($pali) 屬於 $group。對還是錯？';
  }

  @override
  String quizCittaFeelingQuestion(Object name) {
    return '心 “$name” 伴隨何種感受？';
  }

  @override
  String quizCittaFeelingExplanation(Object name, Object feeling) {
    return '“$name” 伴隨 $feeling。';
  }

  @override
  String quizCittaFeelingClaim(Object name, Object feeling) {
    return '心 “$name” 伴随 $feeling。對還是錯？';
  }

  @override
  String get conflictNo => '否 — 彼此相違';

  @override
  String get conflictAlwaysYes => '是 — 恆常俱起';

  @override
  String get conflictSometimesYes => '是 — 有時俱起';

  @override
  String quizConflictQuestion(Object first, Object second) {
    return '“$first” 和 “$second” 能否在同一個心中同起？';
  }

  @override
  String quizSphereQuestion(Object name) {
    return '心 “$name” 屬於哪個界？';
  }

  @override
  String quizSphereExplanation(Object name, Object sphere) {
    return '“$name” 屬於 $sphere。';
  }

  @override
  String quizSphereClaim(Object name, Object sphere) {
    return '心 “$name” 屬於 $sphere。對還是錯？';
  }

  @override
  String get phaseFoundation => '第一階段 — 基礎';

  @override
  String get phaseCausality => '第二階段 — 因果';

  @override
  String get phaseMastery => '第三階段 — 通達';

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
  String get minutesShort => '分鐘';

  @override
  String get playAudio => '播放';

  @override
  String get pauseAudio => '暫停';

  @override
  String get previousTrack => '上一節';

  @override
  String get sleepTimer => '睡眠計時器';

  @override
  String get sleepTimerOff => '關閉';

  @override
  String get sleepTimer15 => '15 分鐘';

  @override
  String get sleepTimer30 => '30 分鐘';

  @override
  String get sleepTimer60 => '60 分鐘';

  @override
  String sleepTimerRemaining(Object minutes) {
    return '睡眠計時器：剩餘 $minutes 分鐘';
  }

  @override
  String get audioModelUnavailable => '神經語音無法使用，正在使用裝置語音';

  @override
  String get realDuration => '時長';

  @override
  String get estimatedDuration => '預估時長';

  @override
  String get continueListening => '繼續聆聽';

  @override
  String get audioBackgroundLimit => '後台音頻播放取決於系統已安裝的語音引擎';

  @override
  String get karaokeSettingsTitle => '聆聽與卡拉OK高亮';

  @override
  String get karaokeModeTitle => '高亮跟讀模式';

  @override
  String get karaokeModeSubtitle => '聆聽時高亮顯示正在朗讀的文本';

  @override
  String get karaokeLineHighlightTitle => '高亮當前行';

  @override
  String get karaokeLineHighlightSubtitle => '對正在朗讀的段落進行背景高亮';

  @override
  String get karaokeWordHighlightTitle => '逐字高亮';

  @override
  String get karaokeWordHighlightSubtitle => '根據朗讀節奏逐字高亮（估算時間）';

  @override
  String get audioFloatingGoTo => '轉到正在播放的內容';

  @override
  String get audioFloatingHide => '隱藏播放欄';

  @override
  String get audioFloatingRestore => '顯示播放欄';

  @override
  String get audioFloatingClose => '關閉播放器';

  @override
  String get playModeTitle => '播放模式';

  @override
  String get playModeOnce => '僅此項';

  @override
  String get playModeSequence => '連續播放';

  @override
  String get playModeOnceHint => '目前項目讀完後停止';

  @override
  String get playModeRepeatOneHint => '反覆朗讀目前項目';

  @override
  String get playModeSequenceHint => '繼續播放後面的項目，到清單末尾停止';

  @override
  String get playModeRepeatAllHint => '繼續播放，到最後回到開頭循環';

  @override
  String get audioBubbleExpand => '展開播放欄';

  @override
  String get audioBubbleCollapse => '收合播放欄';

  @override
  String get studyTreeExpandAll => '全部展開';

  @override
  String get studyTreeCollapseAll => '全部收合';
}
