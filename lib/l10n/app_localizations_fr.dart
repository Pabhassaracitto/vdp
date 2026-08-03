// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appName => 'AbhiDhamma';

  @override
  String get appTagline => 'Abhidhamma Piṭaka';

  @override
  String get initializing => 'Initialisation…';

  @override
  String get loadingDoctrineData =>
      'Chargement et validation des données du Dhamma…';

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
  String get navMatrix => 'Matrice';

  @override
  String get navStudy => 'Étude';

  @override
  String get navConditions => 'Coproduction conditionnée';

  @override
  String get navMindProcess => 'Processus mental';

  @override
  String get navSettings => 'Paramètres';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get delete => 'Supprimer';

  @override
  String get close => 'Fermer';

  @override
  String get start => 'Commencer';

  @override
  String get next => 'Suivant';

  @override
  String get done => 'Terminé';

  @override
  String get skip => 'Passer';

  @override
  String get apply => 'Appliquer';

  @override
  String get undo => 'Annuler';

  @override
  String get reset => 'Réinitialiser';

  @override
  String get all => 'Tout';

  @override
  String get hide => 'Masquer';

  @override
  String get learn => 'Apprendre';

  @override
  String get notes => 'Notes';

  @override
  String errorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get languageSection => 'Langues';

  @override
  String get interfaceLanguage => 'Langue de l’interface';

  @override
  String get interfaceLanguageSubtitle =>
      'Suivre la langue de l’appareil ou choisir manuellement';

  @override
  String get contentLanguage => 'Langue du contenu';

  @override
  String get contentLanguageSubtitle =>
      'Indépendante de la langue de l’interface';

  @override
  String get systemDefault => 'Langue du système';

  @override
  String get systemDefaultSubtitle =>
      'Utiliser la langue choisie sur cet appareil';

  @override
  String get languagePickerTitle => 'Language / Langue';

  @override
  String get languagePickerSearchHint => 'Rechercher par langue ou code';

  @override
  String get languageChangePreviewTitle => 'Changer la langue de l’interface ?';

  @override
  String languageChangePreviewBody(Object language) {
    return 'L’interface passera en $language. Le contenu ne changera pas.';
  }

  @override
  String languageChangedTo(Object language) {
    return 'Langue changée en $language';
  }

  @override
  String get holdGlobeToReset =>
      'Press and hold the globe for 3 seconds to restore the system language';

  @override
  String get restoredSystemLanguage => 'Langue du système restaurée';

  @override
  String get contentVietnamese => 'Vietnamien';

  @override
  String get contentEnglish => 'Anglais';

  @override
  String get translationReviewNotice =>
      'English Dhamma content is an international study translation. Pāḷi terms remain authoritative.';

  @override
  String get settingsAccessibility => 'Accessibilité';

  @override
  String get highContrastMode => 'Contraste élevé';

  @override
  String get highContrastSubtitle =>
      'Increase color contrast for people with low vision';

  @override
  String get screenReaderHints => 'Indications du lecteur d’écran';

  @override
  String get screenReaderHintsSubtitle =>
      'Provide more detail for TalkBack and VoiceOver';

  @override
  String get textSize => 'Taille du texte';

  @override
  String get textScale => 'Échelle du texte';

  @override
  String get studyProgress => 'Progression';

  @override
  String get unlockAllLessons => 'Déverrouiller toutes les leçons';

  @override
  String get unlockAllLessonsSubtitle =>
      'The guided path builds a strong foundation. Experienced learners can unlock every lesson.';

  @override
  String get resetProgress => 'Réinitialiser la progression';

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
  String get aboutApp => 'À propos';

  @override
  String get version => 'Version';

  @override
  String get sourceMaterial => 'Sources';

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
  String get matrixTitle => 'Matrice de l’Abhidhamma';

  @override
  String matrixSemantics(Object count) {
    return 'Abhidhamma Matrix showing $count cittas';
  }

  @override
  String get rotateScreen => 'Faire pivoter l’écran';

  @override
  String get rotationHint =>
      'If the screen does not rotate, enable Auto-rotate in device settings.';

  @override
  String get highContrast => 'Contraste élevé';

  @override
  String get help => 'Aide';

  @override
  String get searchCittaCetasika => 'Rechercher un citta ou cetasika…';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get citta => 'Citta';

  @override
  String get cetasika => 'Cetasika';

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
  String get kamma => 'Kamma';

  @override
  String get result => 'Résultat';

  @override
  String get conditionsTitle => 'Coproduction conditionnée';

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
  String get mindProcessTitle => 'Processus mental';

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
  String get studyPath => 'Parcours d’étude';

  @override
  String get bookmarksAndNotes => 'Favoris et notes';

  @override
  String get overallProgress => 'Progression globale';

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
  String get learnTab => 'Apprendre';

  @override
  String get reviewTab => 'Réviser';

  @override
  String get testTab => 'Test';

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
  String get chooseLevel => 'Choisir un niveau';

  @override
  String quizLevelDescription(Object count) {
    return 'Each level generates up to $count questions from this module';
  }

  @override
  String get insufficientQuizData =>
      'This module does not have enough data to create questions.';

  @override
  String get explanation => 'Explication';

  @override
  String get nextQuestion => 'Question suivante';

  @override
  String get viewResults => 'Voir les résultats';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total correct';
  }

  @override
  String get quizExcellent => 'Excellent! You have mastered this module.';

  @override
  String get quizTryAgain => 'Review the material and try again.';

  @override
  String get tryAgain => 'Réessayer';

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
  String get beginner => 'Débutant';

  @override
  String get beginnerDescription => 'Basic cetasika groups and feelings';

  @override
  String get intermediate => 'Intermédiaire';

  @override
  String get intermediateDescription => 'Includes cetasika conflicts';

  @override
  String get advanced => 'Avancé';

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
