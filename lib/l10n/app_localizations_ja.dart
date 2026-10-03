// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appName => 'AbhiDhamma';

  @override
  String get appTagline => 'Abhidhamma Piṭaka';

  @override
  String get initializing => '初期化しています…';

  @override
  String get loadingDoctrineData => 'ダンマデータを読み込み、検証しています…';

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
  String get navMatrix => 'マトリックス';

  @override
  String get navStudy => '学習';

  @override
  String get navConditions => '縁起';

  @override
  String get navMindProcess => '心路過程';

  @override
  String get navSettings => '設定';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get delete => '削除';

  @override
  String get close => '閉じる';

  @override
  String get start => '開始';

  @override
  String get next => '次へ';

  @override
  String get done => '完了';

  @override
  String get skip => 'スキップ';

  @override
  String get apply => '適用';

  @override
  String get undo => '元に戻す';

  @override
  String get reset => 'リセット';

  @override
  String get all => 'すべて';

  @override
  String get hide => '隠す';

  @override
  String get learn => '学ぶ';

  @override
  String get notes => 'ノート';

  @override
  String errorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get languageSection => '言語';

  @override
  String get interfaceLanguage => '表示言語';

  @override
  String get interfaceLanguageSubtitle => '端末の言語に従うか手動で選択';

  @override
  String get contentLanguage => '学習コンテンツの言語';

  @override
  String get contentLanguageSubtitle => '表示言語とは独立しています';

  @override
  String get systemDefault => 'システムの設定';

  @override
  String get systemDefaultSubtitle => 'この端末で選択した言語を使用';

  @override
  String get languagePickerTitle => '言語';

  @override
  String get languagePickerSearchHint => '言語名またはコードで検索';

  @override
  String get languageChangePreviewTitle => '表示言語を変更しますか？';

  @override
  String languageChangePreviewBody(Object language) {
    return '表示を$languageに変更します。学習内容は変わりません。';
  }

  @override
  String languageChangedTo(Object language) {
    return '言語を$languageに変更しました';
  }

  @override
  String get holdGlobeToReset =>
      'Press and hold the globe for 3 seconds to restore the system language';

  @override
  String get restoredSystemLanguage => 'システム言語に戻しました';

  @override
  String get contentVietnamese => 'ベトナム語';

  @override
  String get contentEnglish => '英語';

  @override
  String get translationReviewNotice =>
      'この言語の法(ダンマ)内容は国際学習用の翻訳です。パーリ語の用語が正典として優先されます。';

  @override
  String get contentDraftNotice => 'この翻訳は教義レビュー待ちの草稿です。依拠する前にパーリ語原典と照合してください。';

  @override
  String get settingsAccessibility => 'アクセシビリティ';

  @override
  String get highContrastMode => '高コントラストモード';

  @override
  String get highContrastSubtitle =>
      '弱視の方のために色のコントラストを高めます';

  @override
  String get screenReaderHints => 'スクリーンリーダーのヒント';

  @override
  String get screenReaderHintsSubtitle =>
      'TalkBack と VoiceOver により詳しい説明を提供します';

  @override
  String get textSize => '文字サイズ';

  @override
  String get textScale => '文字の倍率';

  @override
  String get studyProgress => '学習の進捗';

  @override
  String get unlockAllLessons => 'すべてのレッスンを開く';

  @override
  String get unlockAllLessonsSubtitle =>
      'ガイド付きの道筋は確かな基礎を築きます。経験のある学習者はすべての課程を解放できます。';

  @override
  String get resetProgress => '進捗をリセット';

  @override
  String get resetProgressSubtitle => 'すべての学習データを削除';

  @override
  String get showDataWarningAgain => 'データ警告を再表示';

  @override
  String get showDataWarningAgainSubtitle =>
      'マトリックスの警告バナーを復元';

  @override
  String get dataWarningEnabled => 'データ警告が有効になりました';

  @override
  String get aboutApp => 'アプリについて';

  @override
  String get version => 'バージョン';

  @override
  String get sourceMaterial => '典拠資料';

  @override
  String get sourceMaterialValue => 'ミリンダ王 A カリキュラム — アビダンマ';

  @override
  String get editorialPrinciples => '編集方針';

  @override
  String get resetProgressQuestion => '進捗をリセットしますか？';

  @override
  String get resetProgressWarning =>
      '学習進捗とクイズ得点がすべて削除されます。この操作は元に戻せません。';

  @override
  String get progressResetSuccess => '学習進捗をリセットしました';

  @override
  String get unlockLessonsQuestion => 'すべての課程を解放しますか？';

  @override
  String get unlockLessonsWarning =>
      'ガイド付きの道筋は、堅固なアビダンマの基礎を築く最も効果的な方法です。この選択肢は経験のある学習者向けです。';

  @override
  String get keepGuidedPath => 'ガイド付きの道筋を維持';

  @override
  String get unlock => '解放';

  @override
  String modulesCompleted(Object completed, Object total) {
    return '$completed / $total モジュール完了';
  }

  @override
  String mostRecentModule(Object module) {
    return '最近のモジュール：$module';
  }

  @override
  String lastStudied(Object date) {
    return '最終学習：$date';
  }

  @override
  String get today => '今日';

  @override
  String get yesterday => '昨日';

  @override
  String daysAgo(Object count) {
    return '$count 日前';
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
  String get matrixTitle => 'アビダンマ・マトリックス';

  @override
  String matrixSemantics(Object count) {
    return 'Abhidhamma Matrix showing $count cittas';
  }

  @override
  String get rotateScreen => '画面を回転';

  @override
  String get rotationHint =>
      '画面が回転しない場合は、端末設定で自動回転を有効にしてください。';

  @override
  String get highContrast => '高コントラスト';

  @override
  String get help => 'ヘルプ';

  @override
  String get searchCittaCetasika => 'チッタまたはチェータシカを検索…';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get citta => 'チッタ';

  @override
  String get cetasika => 'チェータシカ';

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
  String get legend => '凡例：';

  @override
  String get associationAlways => '必ず相応';

  @override
  String get associationSometimes => '場合により相応';

  @override
  String get associationNever => '不相応';

  @override
  String dataWarningsCount(Object count) {
    return '$count data warnings';
  }

  @override
  String get matrixHelpTitle => 'マトリックス案内';

  @override
  String get howToRead => '読み方：';

  @override
  String get matrixHelpRead =>
      '• 行：心\n• 列：心所\n• 交点：相応関係';

  @override
  String get symbols => '記号：';

  @override
  String get matrixHelpSymbols => '✦ = 必ず相応\n◎ = 場合により相応\n✕ = 不相応';

  @override
  String get tips => 'ヒント：';

  @override
  String get matrixHelpTips =>
      '• 心をタップして詳細を表示\n• 心所をタップして衝突を表示\n• フィルターで表示を絞り込み\n• 画面を回転して広く表示';

  @override
  String get understood => '了解';

  @override
  String get dataWarningTitle => 'Data warning';

  @override
  String get allFilters => 'すべて';

  @override
  String get defilements => 'Defilements';

  @override
  String get kamma => 'カンマ';

  @override
  String get result => '結果';

  @override
  String get conditionsTitle => '縁起';

  @override
  String get conditionDetails => '縁起の詳細：';

  @override
  String get lastConditionDescription =>
      'これはこの生命循環における最後の果報支で、新たな条件を開始しません。';

  @override
  String conditionLinkDescription(Object effect, Object explanation) {
    return '• 条件：$effect\n  説明：$explanation';
  }

  @override
  String get conditionsTabLinks => '十二支';

  @override
  String get conditionsTabPaccaya => '二十四縁';

  @override
  String get paccayaTitle => '二十四縁（発趣論）';

  @override
  String get paccayaIntro =>
      'Paccaya-saṅgaha-vibhāga の B 部：諸法が互いにどのように条件となるか。A 部は縁起十二支です。';

  @override
  String get paccayaDefinition => '定義';

  @override
  String get paccayaConditioningStates =>
      '能縁法 (paccaya-dhamma)';

  @override
  String get paccayaConditionedStates => '所縁起法 (paccayuppanna)';

  @override
  String get paccayaSubdivisions => '下位区分';

  @override
  String get paccayaInPaticca => 'これらの支で働く';

  @override
  String get paccayaEmpty => 'このフィルターに一致する縁はありません。';

  @override
  String get paccayaSearchHint => '縁を検索…';

  @override
  String get paccayaSourceNotice =>
      '典拠：Paṭṭhāna（阿毘達磨蔵 VII）および Visuddhimagga 第 XVII 章。Pa-Auk 文献には二十四縁の列挙が見当たらないため、訳語は上級確認待ちです。';

  @override
  String get paccayaSources => '典拠';

  @override
  String paccayaCount(Object count) {
    return '$count 縁';
  }

  @override
  String get relatedDhammas => 'Related dhammas';

  @override
  String get paccayaGroupRootObject => '根と所縁';

  @override
  String get paccayaGroupContinuity => '相続';

  @override
  String get paccayaGroupConascence => '俱生と依止';

  @override
  String get paccayaGroupTimeRelation => '生起順序';

  @override
  String get paccayaGroupKammaVipaka => '業と果';

  @override
  String get paccayaGroupGeneral => '一般';

  @override
  String get kiepPast => '過去生';

  @override
  String get kiepPresent => '今生';

  @override
  String get kiepFuture => '未来生';

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
  String get selected => '選択中';

  @override
  String get dimmedByConflict => '衝突のため淡色表示';

  @override
  String get matrixCornerSemantics =>
      'Matrix corner: rows are cittas and columns are cetasikas';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: citta $cittaId with cetasika $cetasikaId';
  }

  @override
  String get tapForDetails => 'タップして詳細';

  @override
  String get studyPath => '学習コース';

  @override
  String get bookmarksAndNotes => 'ブックマークとノート';

  @override
  String get overallProgress => '全体の進捗';

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
  String get learnTab => '学習';

  @override
  String get reviewTab => '復習';

  @override
  String get testTab => 'テスト';

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
    return '縁起 — $count';
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
    return '業「$name」（$pali）について何を覚えておくべきですか？';
  }

  @override
  String reviewPaticcaQuestion(Object name, Object pali) {
    return '縁起の支分「$name」（$pali）について何を覚えておくべきですか？';
  }

  @override
  String reviewRupaQuestion(Object name, Object pali) {
    return '色法「$name」（$pali）について何を覚えておくべきですか？';
  }

  @override
  String reviewVithiQuestion(Object name, Object pali) {
    return '心路過程「$name」（$pali）について何を覚えておくべきですか？';
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
  String get chooseLevel => 'レベルを選択';

  @override
  String quizLevelDescription(Object count) {
    return 'Each level generates up to $count questions from this module';
  }

  @override
  String get insufficientQuizData =>
      'This module does not have enough data to create questions.';

  @override
  String get explanation => '解説';

  @override
  String get nextQuestion => '次の問題';

  @override
  String get viewResults => '結果を見る';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total correct';
  }

  @override
  String get quizExcellent => 'Excellent! You have mastered this module.';

  @override
  String get quizTryAgain => 'Review the material and try again.';

  @override
  String get tryAgain => 'もう一度';

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
  String get advanced => '上級';

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
  String get contentFallbackNotice => 'この項目はまだ翻訳されていないため、英語の学習内容を表示しています。';

  @override
  String get listenAll => 'すべて再生';

  @override
  String get listeningQueue => '再生リスト';

  @override
  String get listenFromHere => 'ここから再生';

  @override
  String get nowPlaying => '再生中';

  @override
  String get repeatOff => 'リピートなし';

  @override
  String get repeatOne => 'このセクションをリピート';

  @override
  String get repeatAll => 'すべてリピート';

  @override
  String get listenAgain => 'もう一度聞く';

  @override
  String get playbackSpeed => '再生速度';

  @override
  String get resumeListening => '続きから再生';

  @override
  String get continueListening => 'Continue listening';

  @override
  String get sleepTimer => 'スリープタイマー';

  @override
  String get sleepTimerOff => 'オフ';

  @override
  String get minutesShort => '分';

  @override
  String get playAudio => '再生';

  @override
  String get pauseAudio => '一時停止';

  @override
  String get previousTrack => '前のセクション';
}
