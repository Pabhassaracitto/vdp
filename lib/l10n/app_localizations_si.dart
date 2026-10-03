// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get appName => 'AbhiDhamma';

  @override
  String get appTagline => 'Abhidhamma Piṭaka';

  @override
  String get initializing => 'ආරම්භ කරමින්…';

  @override
  String get loadingDoctrineData => 'ධම්ම දත්ත පූරණය හා පරීක්ෂා කරමින්…';

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
  String get navMatrix => 'න්‍යාසය';

  @override
  String get navStudy => 'අධ්‍යයනය';

  @override
  String get navConditions => 'පටිච්චසමුප්පාදය';

  @override
  String get navMindProcess => 'චිත්ත වීථිය';

  @override
  String get navSettings => 'සැකසුම්';

  @override
  String get cancel => 'අවලංගු';

  @override
  String get save => 'සුරකින්න';

  @override
  String get delete => 'මකන්න';

  @override
  String get close => 'වසන්න';

  @override
  String get start => 'අරඹන්න';

  @override
  String get next => 'ඊළඟ';

  @override
  String get done => 'අවසන්';

  @override
  String get skip => 'මඟ හරින්න';

  @override
  String get apply => 'යොදන්න';

  @override
  String get undo => 'පෙර තත්ත්වයට';

  @override
  String get reset => 'යළි සකසන්න';

  @override
  String get all => 'සියල්ල';

  @override
  String get hide => 'සඟවන්න';

  @override
  String get learn => 'ඉගෙන ගන්න';

  @override
  String get notes => 'සටහන්';

  @override
  String errorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get languageSection => 'භාෂා';

  @override
  String get interfaceLanguage => 'අතුරුමුහුණත් භාෂාව';

  @override
  String get interfaceLanguageSubtitle => 'උපාංග භාෂාව අනුගමනය කරන්න හෝ තෝරන්න';

  @override
  String get contentLanguage => 'ඉගෙනුම් අන්තර්ගත භාෂාව';

  @override
  String get contentLanguageSubtitle => 'අතුරුමුහුණත් භාෂාවෙන් ස්වාධීනයි';

  @override
  String get systemDefault => 'පද්ධති පෙරනිමිය';

  @override
  String get systemDefaultSubtitle => 'මෙම උපාංගයේ තෝරා ඇති භාෂාව භාවිත කරන්න';

  @override
  String get languagePickerTitle => 'භාෂාව';

  @override
  String get languagePickerSearchHint => 'භාෂාවේ නම හෝ කේතය සොයන්න';

  @override
  String get languageChangePreviewTitle => 'අතුරුමුහුණත් භාෂාව වෙනස් කරන්නද?';

  @override
  String languageChangePreviewBody(Object language) {
    return 'අතුරුමුහුණත $language වෙත මාරු වේ. ඉගෙනුම් අන්තර්ගතය නොවෙනස් වේ.';
  }

  @override
  String languageChangedTo(Object language) {
    return 'භාෂාව $language වෙත මාරු විය';
  }

  @override
  String get holdGlobeToReset =>
      'Press and hold the globe for 3 seconds to restore the system language';

  @override
  String get restoredSystemLanguage => 'පද්ධති භාෂාව ප්‍රතිස්ථාපනය විය';

  @override
  String get contentVietnamese => 'වියට්නාම්';

  @override
  String get contentEnglish => 'ඉංග්‍රීසි';

  @override
  String get translationReviewNotice =>
      'මෙම භාෂාවේ ධම්ම අන්තර්ගතය ජාත්‍යන්තර අධ්‍යයන පරිවර්තනයකි. පාළි යෙදුම් ප්‍රමාණික ලෙස පවතී.';

  @override
  String get contentDraftNotice =>
      'මෙම පරිවර්තනය ධර්ම සමාලෝචනය බලාපොරොත්තුවෙන් සිටින කෙටුම්පතකි. විශ්වාස කිරීමට පෙර පාළි සමඟ පරීක්ෂා කරන්න.';

  @override
  String get settingsAccessibility => 'ප්‍රවේශ්‍යතාව';

  @override
  String get highContrastMode => 'ඉහළ ප්‍රතිවිරුද්ධතාව';

  @override
  String get highContrastSubtitle =>
      'අඩු දැක්මක් ඇති පුද්ගලයන් සඳහා වර්ණ ප්‍රතිවිරෝධතාව වැඩි කරන්න';

  @override
  String get screenReaderHints => 'තිර කියවීම් ඉඟි';

  @override
  String get screenReaderHintsSubtitle =>
      'TalkBack සහ VoiceOver සඳහා වැඩි විස්තර ලබා දෙන්න';

  @override
  String get textSize => 'අකුරු ප්‍රමාණය';

  @override
  String get textScale => 'අකුරු පරිමාණය';

  @override
  String get studyProgress => 'අධ්‍යයන ප්‍රගතිය';

  @override
  String get unlockAllLessons => 'සියලු පාඩම් විවෘත කරන්න';

  @override
  String get unlockAllLessonsSubtitle =>
      'මාර්ගෝපදේශිත මාර්ගය ශක්තිමත් පදනමක් ගොඩනගයි. පළපුරුදු ඉගෙනුම්කරුවන්ට සියලු පාඩම් විවෘත කළ හැක.';

  @override
  String get resetProgress => 'ප්‍රගතිය යළි සකසන්න';

  @override
  String get resetProgressSubtitle => 'සියලු අධ්‍යයන දත්ත මකන්න';

  @override
  String get showDataWarningAgain => 'දත්ත අනතුරු ඇඟවීම නැවත පෙන්වන්න';

  @override
  String get showDataWarningAgainSubtitle =>
      'න්‍යාස අනතුරු ඇඟවීම් පටිය නැවත පෙන්වන්න';

  @override
  String get dataWarningEnabled => 'දත්ත අනතුරු ඇඟවීම සක්‍රීයයි';

  @override
  String get aboutApp => 'යෙදුම ගැන';

  @override
  String get version => 'අනුවාදය';

  @override
  String get sourceMaterial => 'මූලාශ්‍ර ද්‍රව්‍ය';

  @override
  String get sourceMaterialValue => 'මිලින්ද රජු A පාඨමාලාව — අභිධම්ම';

  @override
  String get editorialPrinciples => 'සංස්කරණ මූලධර්ම';

  @override
  String get resetProgressQuestion => 'ප්‍රගතිය නැවත සකසන්නද?';

  @override
  String get resetProgressWarning =>
      'සියලු අධ්‍යයන ප්‍රගතිය සහ ප්‍රශ්න ලකුණු මකනු ලැබේ. මෙය ආපසු හැරවිය නොහැක.';

  @override
  String get progressResetSuccess => 'අධ්‍යයන ප්‍රගතිය නැවත සකසා ඇත';

  @override
  String get unlockLessonsQuestion => 'සියලු පාඩම් විවෘත කරන්නද?';

  @override
  String get unlockLessonsWarning =>
      'මාර්ගෝපදේශිත මාර්ගය ශක්තිමත් අභිධම්ම පදනමක් ගොඩනැගීමට හොඳම ක්‍රමයයි. මෙම විකල්පය පළපුරුදු ඉගෙනුම්කරුවන් සඳහාය.';

  @override
  String get keepGuidedPath => 'මාර්ගෝපදේශිත මාර්ගය තබාගන්න';

  @override
  String get unlock => 'විවෘත කරන්න';

  @override
  String modulesCompleted(Object completed, Object total) {
    return 'මොඩියුල $completed / $total සම්පූර්ණයි';
  }

  @override
  String mostRecentModule(Object module) {
    return 'මෑතම මොඩියුලය: $module';
  }

  @override
  String lastStudied(Object date) {
    return 'අවසන් වරට අධ්‍යයනය කළේ: $date';
  }

  @override
  String get today => 'අද';

  @override
  String get yesterday => 'ඊයේ';

  @override
  String daysAgo(Object count) {
    return 'දින $countකට පෙර';
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
  String get matrixTitle => 'අභිධම්ම න්‍යාසය';

  @override
  String matrixSemantics(Object count) {
    return 'Abhidhamma Matrix showing $count cittas';
  }

  @override
  String get rotateScreen => 'තිරය කරකවන්න';

  @override
  String get rotationHint =>
      'තිරය නොහැරේ නම්, උපාංග සැකසුම්වල Auto-rotate සක්‍රීය කරන්න.';

  @override
  String get highContrast => 'ඉහළ ප්‍රතිවිරුද්ධතාව';

  @override
  String get help => 'උදව්';

  @override
  String get searchCittaCetasika => 'චිත්ත හෝ චෛතසික සොයන්න…';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get citta => 'චිත්ත';

  @override
  String get cetasika => 'චෛතසික';

  @override
  String get unwholesome => 'අකුසල';

  @override
  String get rootless => 'අහේතුක';

  @override
  String get senseSphereBeautiful => 'කාමාවචර සෝභන';

  @override
  String get formSphere => 'රූපාවචර';

  @override
  String get formlessSphere => 'අරූපාවචර';

  @override
  String get supramundane => 'ලෝකෝත්තර';

  @override
  String get legend => 'පැහැදිලි කිරීම:';

  @override
  String get associationAlways => 'නියත';

  @override
  String get associationSometimes => 'අනියත';

  @override
  String get associationNever => 'නොමැත';

  @override
  String dataWarningsCount(Object count) {
    return '$count data warnings';
  }

  @override
  String get matrixHelpTitle => 'න්‍යාස මාර්ගෝපදේශය';

  @override
  String get howToRead => 'කියවන්නේ මෙසේය:';

  @override
  String get matrixHelpRead =>
      '• පේළි: චිත්ත\n• තීරු: චෛතසික\n• හමුවීම්: සම්බන්ධය';

  @override
  String get symbols => 'සංකේත:';

  @override
  String get matrixHelpSymbols => '✦ = නියත\n◎ = අනියත\n✕ = නොමැත';

  @override
  String get tips => 'උපදෙස්:';

  @override
  String get matrixHelpTips =>
      '• විස්තර සඳහා චිත්තයක් තට්ටු කරන්න\n• ගැටුම් සඳහා චෛතසිකයක් තට්ටු කරන්න\n• දසුන සීමා කිරීමට පෙරහන් භාවිත කරන්න\n• වැඩි ඉඩ සඳහා හැරවන්න';

  @override
  String get understood => 'තේරුණා';

  @override
  String get dataWarningTitle => 'Data warning';

  @override
  String get allFilters => 'සියල්ල';

  @override
  String get defilements => 'Defilements';

  @override
  String get kamma => 'කම්ම';

  @override
  String get result => 'විපාක';

  @override
  String get conditionsTitle => 'පටිච්චසමුප්පාදය';

  @override
  String get conditionDetails => 'පටිච්චසමුප්පාද විස්තර:';

  @override
  String get lastConditionDescription =>
      'මෙය මෙම ජීවන චක්‍රයේ අවසාන විපාක අංගය වන අතර නව පච්චයක් ආරම්භ නොකරයි.';

  @override
  String conditionLinkDescription(Object effect, Object explanation) {
    return '• පච්චය: $effect\n  විස්තරය: $explanation';
  }

  @override
  String get conditionsTabLinks => 'පටිච්චසමුප්පාද අංග 12';

  @override
  String get conditionsTabPaccaya => 'පච්චය 24';

  @override
  String get paccayaTitle => 'පච්චය 24 (පට්ඨාන)';

  @override
  String get paccayaIntro =>
      'Paccaya-saṅgaha-vibhāga හි B කොටස: ධර්ම එකිනෙක කෙසේ පච්චය වේද. A කොටස පටිච්චසමුප්පාද අංග 12 යි.';

  @override
  String get paccayaDefinition => 'අර්ථ දැක්වීම';

  @override
  String get paccayaConditioningStates =>
      'පච්චය වන ධර්ම (paccaya-dhamma)';

  @override
  String get paccayaConditionedStates => 'පච්චයුප්පන්න ධර්ම (paccayuppanna)';

  @override
  String get paccayaSubdivisions => 'උප කොටස්';

  @override
  String get paccayaInPaticca => 'මෙම අංගවල ක්‍රියා කරයි';

  @override
  String get paccayaEmpty => 'මෙම පෙරහනට ගැලපෙන පච්චයක් නොමැත.';

  @override
  String get paccayaSearchHint => 'පච්චයක් සොයන්න…';

  @override
  String get paccayaSourceNotice =>
      'මූලාශ්‍ර: Paṭṭhāna (Abhidhamma Piṭaka VII) සහ Visuddhimagga XVII පරිච්ඡේදය. Pa-Auk ලේඛනවල පච්චය 24 වෙනම ලැයිස්තුවක් හමු නොවීය; පද තවම ජ්‍යෙෂ්ඨ සමාලෝචනයට යටත්ය.';

  @override
  String get paccayaSources => 'මූලාශ්‍ර';

  @override
  String paccayaCount(Object count) {
    return 'පච්චය $count';
  }

  @override
  String get relatedDhammas => 'Related dhammas';

  @override
  String get paccayaGroupRootObject => 'මූලය හා ආරම්මණය';

  @override
  String get paccayaGroupContinuity => 'අඛණ්ඩතාව';

  @override
  String get paccayaGroupConascence => 'සහජාත හා උපකාර';

  @override
  String get paccayaGroupTimeRelation => 'උදාවන අනුපිළිවෙල';

  @override
  String get paccayaGroupKammaVipaka => 'කම්ම හා විපාක';

  @override
  String get paccayaGroupGeneral => 'සාමාන්‍ය';

  @override
  String get kiepPast => 'අතීත භවය';

  @override
  String get kiepPresent => 'මෙම භවය';

  @override
  String get kiepFuture => 'අනාගත භවය';

  @override
  String get kammaTitle => 'Kamma';

  @override
  String get mindProcessTitle => 'චිත්ත වීථිය';

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
  String get selected => 'තෝරා ඇත';

  @override
  String get dimmedByConflict => 'ගැටුමක් නිසා මැකී පෙනේ';

  @override
  String get matrixCornerSemantics =>
      'Matrix corner: rows are cittas and columns are cetasikas';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: citta $cittaId with cetasika $cetasikaId';
  }

  @override
  String get tapForDetails => 'විස්තර සඳහා තට්ටු කරන්න';

  @override
  String get studyPath => 'අධ්‍යයන මාර්ගය';

  @override
  String get bookmarksAndNotes => 'පිටු සලකුණු හා සටහන්';

  @override
  String get overallProgress => 'සමස්ත ප්‍රගතිය';

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
  String get learnTab => 'ඉගෙනීම';

  @override
  String get reviewTab => 'පුනරීක්ෂණය';

  @override
  String get testTab => 'පරීක්ෂණය';

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
    return 'කම්ම — $count';
  }

  @override
  String paticcasInModule(Object count) {
    return 'පටිච්චසමුප්පාදය — $count';
  }

  @override
  String rupasInModule(Object count) {
    return 'රූප — $count';
  }

  @override
  String vithisInModule(Object count) {
    return 'චිත්ත වීථිය — $count';
  }

  @override
  String reviewCetasikaQuestion(Object name, Object pali) {
    return 'What does cetasika “$name” ($pali) mean?';
  }

  @override
  String reviewKammaQuestion(Object name, Object pali) {
    return 'කම්ම “$name” ($pali) ගැන මතක තබා ගත යුත්තේ කුමක්ද?';
  }

  @override
  String reviewPaticcaQuestion(Object name, Object pali) {
    return 'පටිච්චසමුප්පාද අංගය “$name” ($pali) ගැන මතක තබා ගත යුත්තේ කුමක්ද?';
  }

  @override
  String reviewRupaQuestion(Object name, Object pali) {
    return 'රූපය “$name” ($pali) ගැන මතක තබා ගත යුත්තේ කුමක්ද?';
  }

  @override
  String reviewVithiQuestion(Object name, Object pali) {
    return 'චිත්ත වීථිය “$name” ($pali) ගැන මතක තබා ගත යුත්තේ කුමක්ද?';
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
  String get chooseLevel => 'මට්ටම තෝරන්න';

  @override
  String quizLevelDescription(Object count) {
    return 'Each level generates up to $count questions from this module';
  }

  @override
  String get insufficientQuizData =>
      'This module does not have enough data to create questions.';

  @override
  String get explanation => 'විස්තරය';

  @override
  String get nextQuestion => 'ඊළඟ ප්‍රශ්නය';

  @override
  String get viewResults => 'ප්‍රතිඵල බලන්න';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total correct';
  }

  @override
  String get quizExcellent => 'Excellent! You have mastered this module.';

  @override
  String get quizTryAgain => 'Review the material and try again.';

  @override
  String get tryAgain => 'නැවත උත්සාහ කරන්න';

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
  String get beginner => 'ආරම්භක';

  @override
  String get beginnerDescription => 'Basic cetasika groups and feelings';

  @override
  String get intermediate => 'මධ්‍යම';

  @override
  String get intermediateDescription => 'Includes cetasika conflicts';

  @override
  String get advanced => 'උසස්';

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
  String get contentFallbackNotice => 'මෙම අයිතමය තවම පරිවර්තනය කර නැත; ඉංග්‍රීසි අධ්‍යයන පෙළ පෙන්වයි.';

  @override
  String get listenAll => 'සියල්ල අසන්න';

  @override
  String get listeningQueue => 'ඇසීමේ ලැයිස්තුව';

  @override
  String get listenFromHere => 'මෙතැනින් අසන්න';

  @override
  String get nowPlaying => 'දැන් වාදනය වේ';

  @override
  String get repeatOff => 'නැවත නැවත නැත';

  @override
  String get repeatOne => 'මෙම කොටස නැවත නැවත';

  @override
  String get repeatAll => 'සියල්ල නැවත නැවත';

  @override
  String get listenAgain => 'නැවත අසන්න';

  @override
  String get playbackSpeed => 'වේගය';

  @override
  String get resumeListening => 'ඇසීම දිගටම';

  @override
  String get continueListening => 'Continue listening';

  @override
  String get sleepTimer => 'නින්දේ කාලමානය';

  @override
  String get sleepTimerOff => 'අක්‍රියයි';

  @override
  String get minutesShort => 'මිනිත්තු';

  @override
  String get playAudio => 'වාදනය කරන්න';

  @override
  String get pauseAudio => 'නවත්තන්න';

  @override
  String get previousTrack => 'කලින් කොටස';

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
