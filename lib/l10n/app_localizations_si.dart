// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get appName => 'අභිධර්මය';

  @override
  String get appTagline => 'අභිධර්ම පිටකය';

  @override
  String get initializing => 'ආරම්භ වෙමින් පවතී…';

  @override
  String get loadingDoctrineData => 'ධර්ම දත්ත පූරණය වෙමින් පවතී…';

  @override
  String get loadingTakingLonger =>
      'ආරම්භය අපේක්ෂිත කාලයට වඩා වැඩි කාලයක් ගනී...';

  @override
  String get unknownError => 'නොදන්නා දෝෂයක්';

  @override
  String get dataError => 'දත්ත දෝෂයකි';

  @override
  String get invalidData => 'වලංගු නොවන දත්ත';

  @override
  String get invalidDataDescription =>
      'ධර්ම වලංගුකරණ නීති කඩවීමක් පද්ධතිය විසින් හඳුනාගෙන ඇත.';

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
    return 'දෝෂය: $message';
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
      'පද්ධති භාෂාව නැවත පිහිටුවීමට ලෝක ගෝලය තත්පර 3ක් ඔබාගෙන සිටින්න';

  @override
  String get restoredSystemLanguage => 'පද්ධති භාෂාව නැවත පිහිටුවන ලදී';

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
  String get screenReaderHints => 'තිර කියවනය සඳහා ඉඟි';

  @override
  String get screenReaderHintsSubtitle =>
      'TalkBack සහ VoiceOver සඳහා වැඩි විස්තර ලබා දෙන්න';

  @override
  String get textSize => 'අකුරු ප්‍රමාණය';

  @override
  String get textScale => 'පෙළ පරිමාණය';

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
  String get onboardingVisualTitle => 'පැහැදිලිව දකින්න';

  @override
  String get onboardingVisualSubtitle => 'සිත් × චෛතසික න්‍යාසය';

  @override
  String get onboardingVisualBody =>
      'සිත් 121ක් සහ චෛතසික 52ක් අන්තර්ක්‍රියාකාරී න්‍යාසයකින් අධ්‍යයනය කරන්න.';

  @override
  String get onboardingCausalityTitle => 'ගැඹුරින් තේරුම් ගන්න';

  @override
  String get onboardingCausalitySubtitle => 'පටිච්චසමුප්පාදය';

  @override
  String get onboardingCausalityBody =>
      'පටිච්චසමුප්පාද අංග 12 සහ කර්ම වර්ගීකරණයන් විමසා බලන්න.';

  @override
  String get onboardingExploreTitle => 'ස්වයං අධ්‍යයනය';

  @override
  String get onboardingExploreSubtitle => 'අනුක්‍රමික නොවන අධ්‍යයන මාර්ගය';

  @override
  String get onboardingExploreBody =>
      'පාඩම් මාලා 10ක් ඔස්සේ ඔබේ දැනුම වර්ධනය කරගන්න.';

  @override
  String get beginExploring => 'ගවේෂණය අරඹන්න';

  @override
  String get matrixTitle => 'අභිධම්ම න්‍යාසය';

  @override
  String matrixSemantics(Object count) {
    return '$countක් වූ සිත් පෙන්වන අභිධර්ම න්‍යාසය';
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
  String get clearSearch => 'සෙවීම හිස් කරන්න';

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
    return 'දත්ත අනතුරු ඇඟවීම් $count';
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
  String get matrixListenCittas => 'සියලු චිත්ත අසන්න';

  @override
  String get matrixListenCetasikas => 'සියලු චෛතසික අසන්න';

  @override
  String get matrixListenFromHint =>
      'මෙම අයිතමයෙන් ඇසීමට දිගුවට ඔබාගෙන සිටින්න';

  @override
  String get matrixListenHelpBody =>
      'චිත්ත පේළියක් හෝ චෛතසික තීරුවක් දිගුවට ඔබාගෙන සිටිමින් එම අයිතමයෙන් අසන්න. මුළු ලැයිස්තුවම ඇසීමට වගුවේ කොනේ හෙඩ්ෆෝන් නිරූපකය තට්ටු කරන්න.';

  @override
  String get understood => 'තේරුණා';

  @override
  String get dataWarningTitle => 'දත්ත අනතුරු ඇඟවීම';

  @override
  String get allFilters => 'සියල්ල';

  @override
  String get defilements => 'කෙලෙස් (Kilesa)';

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
  String get paccayaConditioningStates => 'පච්චය වන ධර්ම (paccaya-dhamma)';

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
  String get relatedDhammas => 'සම්බන්ධ ධර්ම';

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
  String get kammaTitle => 'කර්මය (Kamma)';

  @override
  String get mindProcessTitle => 'චිත්ත වීථිය';

  @override
  String get paliLabel => 'පාලි:';

  @override
  String get stopPronunciation => 'උච්චාරණය නවත්වන්න';

  @override
  String get listenPaliPronunciation => 'පාලි උච්චාරණයට සවන් දෙන්න';

  @override
  String get ttsUnavailable => 'මෙම උපාංගයේ කථන සංස්ලේෂණය සඳහා සහය නොදක්වයි.';

  @override
  String get dragHandleSemantics => 'ප්‍රමාණය වෙනස් කිරීමට අදින්න';

  @override
  String cittaNumber(Object number) {
    return 'සිත $number';
  }

  @override
  String get doctrine => 'ධර්ම විග්‍රහය';

  @override
  String get examples => 'උදාහරණ';

  @override
  String fixedCetasikasCount(Object count) {
    return 'නියත චෛතසික ($count)';
  }

  @override
  String variableCetasikasCount(Object count) {
    return 'අනියත චෛතසික ($count)';
  }

  @override
  String get personalNote => 'පෞද්ගලික සටහන';

  @override
  String get personalNoteHint => 'ඔබේ සටහන ඇතුළත් කරන්න…';

  @override
  String get wholesome => 'කුසල්';

  @override
  String get functional => 'ක්‍රියා';

  @override
  String get pleasantFeeling => 'කායික සුඛ වේදනාව';

  @override
  String get unpleasantFeeling => 'කායික දුක්ඛ වේදනාව';

  @override
  String get neutralFeeling => 'උපේක්ෂා වේදනාව';

  @override
  String get joyfulFeeling => 'සෝමනස්ස වේදනාව';

  @override
  String get alwaysAssociated => 'සැමවිටම යෙදෙන';

  @override
  String get mayBeAssociated => 'සමහරවිට යෙදෙන';

  @override
  String get fourfoldDefinition =>
      'චතුර්විධ ලක්ෂණ (ලක්ෂණ/රස/පච්චුපට්ඨාන/පදට්ඨාන)';

  @override
  String get characteristic => 'ලක්ෂණය (Lakkhaṇa)';

  @override
  String get functionLabel => 'කෘත්‍යය / රසය (Rasa)';

  @override
  String get manifestation => 'වැටහෙන ආකාරය (Paccupaṭṭhāna)';

  @override
  String get proximateCause => 'ආසන්න හේතුව (Padaṭṭhāna)';

  @override
  String get doctrinalConflicts => 'ධර්ම විරෝධතා';

  @override
  String rulesCount(Object count) {
    return 'නීති $count';
  }

  @override
  String get universalCetasikas => 'සබ්බචිත්තසාධාරණ 7';

  @override
  String get occasionalCetasikas => 'පකිණ්ණක 6';

  @override
  String get unwholesomeCetasikas => 'අකුසල් චෛතසික 14';

  @override
  String get beautifulCetasikas => 'ශෝභන චෛතසික 25';

  @override
  String rowCittaSemantics(Object displayIndex, Object name, Object order,
      Object group, Object feeling, Object action) {
    return 'සිත් පේළිය $displayIndex: $name; අංකය $order; කාණ්ඩය $group; වේදනාව $feeling. $action';
  }

  @override
  String cetasikaSemantics(
      Object name, Object pali, Object group, Object state) {
    return 'චෛතසිකය $name ($pali), කාණ්ඩය $group. $state විස්තර සඳහා තට්ටු කරන්න.';
  }

  @override
  String get selected => 'තෝරා ඇත';

  @override
  String get dimmedByConflict => 'ගැටුමක් නිසා මැකී පෙනේ';

  @override
  String get matrixCornerSemantics =>
      'න්‍යාස කොන: පේළි සිත් වන අතර තීරු චෛතසික වේ';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: සිත $cittaId චෛතසිකය $cetasikaId සමඟ';
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
    return 'සුරැකි අයිතම $count';
  }

  @override
  String get cittaTab => 'සිත්';

  @override
  String get cetasikaTab => 'චෛතසික';

  @override
  String get notesTab => 'සටහන්';

  @override
  String get noBookmarkedCittas => 'සුරැකි සිත් නැත';

  @override
  String get bookmarkCittaHint =>
      'පාඩමක් විවෘත කර සුරැකීමට බුක්මාක් අයිකනය තට්ටු කරන්න';

  @override
  String get loadingCittas => 'සිත් පූරණය වෙමින් පවතී…';

  @override
  String get noBookmarkedCetasikas => 'සුරැකි චෛතසික නැත';

  @override
  String get loadingCetasikas => 'චෛතසික පූරණය වෙමින් පවතී…';

  @override
  String get noNotes => 'තවම සටහන් නැත';

  @override
  String get addNoteHint =>
      'පෞද්ගලික සටහනක් එක් කිරීමට සංස්කරණ අයිකනය තට්ටු කරන්න';

  @override
  String get deleteNoteQuestion => 'සටහන මකන්නද?';

  @override
  String get deleteNoteWarning =>
      'මෙම සටහන ස්ථිරවම මකා දැමෙනු ඇත. ඔබට විශ්වාසද?';

  @override
  String get addNote => 'සටහනක් එක් කරන්න';

  @override
  String get removeBookmark => 'බුක්මාක් ඉවත් කරන්න';

  @override
  String get editNote => 'සටහන සංස්කරණය';

  @override
  String get deleteNote => 'සටහන මකන්න';

  @override
  String get noteUpdated => 'සටහන යාවත්කාලීන කරන ලදී';

  @override
  String get noteSaved => 'සටහන සුරකින ලදී';

  @override
  String get editNoteTitle => 'සටහන සංස්කරණය';

  @override
  String get addNoteTitle => 'සටහනක් එක් කරන්න';

  @override
  String get studyNoteHint => 'මෙම අයිතමය ගැන ඔබේ සටහන ලියන්න…';

  @override
  String charactersCount(Object current, Object maximum) {
    return 'අක්ෂර $current / $maximum';
  }

  @override
  String get update => 'යාවත්කාලීන කරන්න';

  @override
  String get saveNote => 'සටහන සුරකින්න';

  @override
  String studyProgressPercent(Object percent) {
    return 'අධ්‍යයන ප්‍රගතිය: $percent%';
  }

  @override
  String get modulesCompletedShort => 'සම්පූර්ණ කළ\nපාඩම්';

  @override
  String get recommendedNext => 'ඊළඟ නිර්දේශය';

  @override
  String get progressOverview => 'ප්‍රගති සමාලෝචනය';

  @override
  String get totalModules => 'මුළු පාඩම්';

  @override
  String get dueForReview => 'නැවත බැලීමට';

  @override
  String get learnTab => 'ඉගෙනීම';

  @override
  String get reviewTab => 'පුනරීක්ෂණය';

  @override
  String get testTab => 'පරීක්ෂණය';

  @override
  String get moduleHasNoData => 'මෙම පාඩමේ දත්ත නැත.';

  @override
  String cittasInModule(Object count) {
    return 'මෙම පාඩමේ ඇති සිත් — $count';
  }

  @override
  String cetasikasInModule(Object count) {
    return 'මෙම පාඩමේ ඇති චෛතසික — $count';
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
    return '“$name” ($pali) චෛතසිකයේ තේරුම කුමක්ද?';
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
    return 'කාණ්ඩය: $group';
  }

  @override
  String reviewCittaQuestion(Object name) {
    return '“$name” සිත අයත් වන්නේ කුමන භූමියට සහ වේදනාවටද?';
  }

  @override
  String cittaReviewAnswer(Object sphere, Object feeling, Object pali) {
    return 'භූමිය: $sphere\nවේදනාව: $feeling\nපාලි: $pali';
  }

  @override
  String get noReviewContent => 'මෙම පාඩමේ තවම පුනරීක්ෂණ අන්තර්ගතයක් නොමැත.';

  @override
  String reviewedCount(Object revealed, Object total) {
    return '$revealed / $total සමාලෝචනය කර ඇත';
  }

  @override
  String get reviewComplete =>
      'ඔබ සියලු අන්තර්ගත සමාලෝචනය කර ඇත. ප්‍රශ්නාවලියට මුහුණ දෙන්න.';

  @override
  String get tapToReveal => 'පිළිතුර බැලීමට තට්ටු කරන්න';

  @override
  String answerLabel(Object answer) {
    return 'පිළිතුර: $answer';
  }

  @override
  String get revealAnswer => 'පිළිතුර පෙන්වන්න';

  @override
  String moduleQuizTitle(Object module) {
    return 'ප්‍රශ්නාවලිය\n$module';
  }

  @override
  String moduleContentCount(Object count) {
    return 'මෙම පාඩමේ අයිතම $countක් ඇත';
  }

  @override
  String get quizMaximumDescription =>
      'මෙම පාඩම ආවරණය වන පරිදි බහුවරණ ප්‍රශ්න 10ක් දක්වා';

  @override
  String get startQuiz => 'ප්‍රශ්නාවලිය අරඹන්න';

  @override
  String cittasCount(Object count) {
    return 'සිත් $count';
  }

  @override
  String cetasikasCount(Object count) {
    return 'චෛතසික $count';
  }

  @override
  String noteForItem(Object name) {
    return 'සටහන: $name';
  }

  @override
  String get chooseLevel => 'මට්ටම තෝරන්න';

  @override
  String quizLevelDescription(Object count) {
    return 'සෑම මට්ටමක්ම ප්‍රශ්න $countක් ජනනය කරයි';
  }

  @override
  String get insufficientQuizData => 'ප්‍රශ්න සෑදීමට ප්‍රමාණවත් දත්ත නොමැත.';

  @override
  String get explanation => 'විස්තරය';

  @override
  String get nextQuestion => 'ඊළඟ ප්‍රශ්නය';

  @override
  String get viewResults => 'ප්‍රතිඵල බලන්න';

  @override
  String correctAnswers(Object score, Object total) {
    return 'නිවැරදි $score / $total';
  }

  @override
  String get quizExcellent => 'විශිෂ්ටයි! ඔබ මෙම පාඩම ප්‍රගුණ කර ඇත.';

  @override
  String get quizTryAgain => 'කරුණාකර නැවත උත්සාහ කරන්න.';

  @override
  String get tryAgain => 'නැවත උත්සාහ කරන්න';

  @override
  String quizInsufficientDataMessage(Object module) {
    return '“$module” පාඩම සඳහා දත්ත ප්‍රමාණවත් නොවේ.';
  }

  @override
  String get quizTypeCetasikaGroup => 'චෛතසික වර්ගීකරණය';

  @override
  String get quizTypeFeeling => 'වේදනා හඳුනාගැනීම';

  @override
  String get quizTypeConflict => 'ධර්ම විරෝධතා';

  @override
  String get quizTypeSphere => 'භූමිය';

  @override
  String get beginner => 'ආරම්භක';

  @override
  String get beginnerDescription => 'මූලික චෛතසික කාණ්ඩ සහ වේදනා';

  @override
  String get intermediate => 'මධ්‍යම';

  @override
  String get intermediateDescription => 'චෛතසික විරෝධතා ඇතුළත් වේ';

  @override
  String get advanced => 'උසස්';

  @override
  String get advancedDescription => 'සියලුම ප්‍රශ්න වර්ග ඇතුළත් වේ';

  @override
  String get trueLabel => 'සත්‍ය';

  @override
  String get falseLabel => 'අසත්‍ය';

  @override
  String get trueOrFalse => 'සත්‍යද අසත්‍යද?';

  @override
  String quizCetasikaGroupQuestion(Object name, Object pali) {
    return '“$name” ($pali) අයත් වන්නේ කුමන කාණ්ඩයටද?';
  }

  @override
  String quizCetasikaGroupExplanation(
      Object name, Object group, Object description) {
    return '“$name” $groupට අයත් වේ.\n$description';
  }

  @override
  String quizCetasikaClaim(Object name, Object pali, Object group) {
    return '“$name” ($pali) $groupට අයත් වේ. සත්‍යද අසත්‍යද?';
  }

  @override
  String quizCittaFeelingQuestion(Object name) {
    return '“$name” සිත සමඟ යෙදෙන වේදනාව කුමක්ද?';
  }

  @override
  String quizCittaFeelingExplanation(Object name, Object feeling) {
    return '“$name” සිතෙහි $feeling පවතී.';
  }

  @override
  String quizCittaFeelingClaim(Object name, Object feeling) {
    return '“$name” සිතෙහි $feeling පවතී. සත්‍යද අසත්‍යද?';
  }

  @override
  String get conflictNo => 'නැත — ඒවා එකිනෙකට විරුද්ධයි';

  @override
  String get conflictAlwaysYes => 'ඔව් — ඒවා සැමවිටම එකට යෙදේ';

  @override
  String get conflictSometimesYes => 'ඔව් — ඒවා සමහරවිට එකට යෙදේ';

  @override
  String quizConflictQuestion(Object first, Object second) {
    return '“$first” සහ “$second” එකම සිතක එකට යෙදිය හැකිද?';
  }

  @override
  String quizSphereQuestion(Object name) {
    return '“$name” සිත අයත් වන්නේ කුමන භූමියටද?';
  }

  @override
  String quizSphereExplanation(Object name, Object sphere) {
    return '“$name” $sphereට අයත් වේ.';
  }

  @override
  String quizSphereClaim(Object name, Object sphere) {
    return '“$name” සිත $sphereට අයත් වේ. සත්‍යද අසත්‍යද?';
  }

  @override
  String get phaseFoundation => 'අදියර 1 — පදනම';

  @override
  String get phaseCausality => 'අදියර 2 — හේතුඵල';

  @override
  String get phaseMastery => 'අදියර 3 — ප්‍රවීණත්වය';

  @override
  String get contentFallbackNotice =>
      'මෙම අයිතමය තවම පරිවර්තනය කර නැත; ඉංග්‍රීසි අධ්‍යයන පෙළ පෙන්වයි.';

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
  String get minutesShort => 'මිනිත්තු';

  @override
  String get playAudio => 'වාදනය කරන්න';

  @override
  String get pauseAudio => 'නවත්තන්න';

  @override
  String get previousTrack => 'කලින් කොටස';

  @override
  String get sleepTimer => 'නින්දේ කාලමානය';

  @override
  String get sleepTimerOff => 'අක්‍රියයි';

  @override
  String get sleepTimer15 => 'මිනිත්තු 15';

  @override
  String get sleepTimer30 => 'මිනිත්තු 30';

  @override
  String get sleepTimer60 => 'මිනිත්තු 60';

  @override
  String sleepTimerRemaining(Object minutes) {
    return 'නින්දේ කාලමානය: තව මිනිත්තු $minutesයි';
  }

  @override
  String get audioModelUnavailable => 'ස්නායුක හඬ නොමැත; උපාංග හඬ භාවිත කරයි';

  @override
  String get realDuration => 'කාලය';

  @override
  String get estimatedDuration => 'ඇස්තමේන්තුගත කාලය';

  @override
  String get continueListening => 'දිගටම සවන් දෙන්න';

  @override
  String get audioBackgroundLimit =>
      'පසුබිම් ශ්‍රව්‍ය ධාවනය ස්ථාපිත හඬ එන්ජිම මත රඳා පවතී';

  @override
  String get karaokeSettingsTitle => 'ශ්‍රවණය සහ උද්දීපනය';

  @override
  String get karaokeModeTitle => 'කැරෝකේ මාදිලිය';

  @override
  String get karaokeModeSubtitle => 'සවන් දෙන විට කියවන පෙළ උද්දීපනය කරන්න';

  @override
  String get karaokeLineHighlightTitle => 'වත්මන් පේළිය උද්දීපනය කරන්න';

  @override
  String get karaokeLineHighlightSubtitle => 'කියවන ඡේදය වර්ණවත් කරන්න';

  @override
  String get karaokeWordHighlightTitle => 'වචනයෙන් වචනය උද්දීපනය කරන්න';

  @override
  String get karaokeWordHighlightSubtitle =>
      'කියවන විට එක් එක් වචනය උද්දීපනය කරන්න';

  @override
  String get audioFloatingGoTo => 'දැනට වාදනය වන ස්ථානයට යන්න';

  @override
  String get audioFloatingHide => 'ප්ලේයරය සඟවන්න';

  @override
  String get audioFloatingRestore => 'ප්ලේයරය පෙන්වන්න';

  @override
  String get audioFloatingClose => 'ප්ලේයරය වසන්න';

  @override
  String get playModeTitle => 'ඇසීමේ ප්‍රකාරය';

  @override
  String get playModeOnce => 'මෙම අයිතමය පමණි';

  @override
  String get playModeSequence => 'අනුපිළිවෙලින් අසන්න';

  @override
  String get playModeOnceHint => 'වත්මන් අයිතමය අවසන් වූ පසු නවතී';

  @override
  String get playModeRepeatOneHint => 'වත්මන් අයිතමය නැවත නැවත අසයි';

  @override
  String get playModeSequenceHint => 'ඊළඟ අයිතම දිගටම අසයි, ලැයිස්තුව අවසානයේ නවතී';

  @override
  String get playModeRepeatAllHint => 'දිගටම අසා අවසානයේ මුලට නැවත යයි';

  @override
  String get audioBubbleExpand => 'වාදකය විහිදන්න';

  @override
  String get audioBubbleCollapse => 'වාදකය හකුළන්න';

  @override
  String get studyTreeExpandAll => 'සියල්ල විහිදන්න';

  @override
  String get studyTreeCollapseAll => 'සියල්ල හකුළන්න';
}
