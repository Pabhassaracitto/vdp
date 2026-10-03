// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get appName => 'AbhiDhamma';

  @override
  String get appTagline => 'Abhidhamma Piṭaka';

  @override
  String get initializing => 'စတင်နေသည်…';

  @override
  String get loadingDoctrineData => 'ဓမ္မဒေတာကို ဖွင့်ပြီး စစ်ဆေးနေသည်…';

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
  String get navMatrix => 'ဇယား';

  @override
  String get navStudy => 'လေ့လာရန်';

  @override
  String get navConditions => 'ပဋိစ္စသမုပ္ပါဒ်';

  @override
  String get navMindProcess => 'စိတ်အစဉ်';

  @override
  String get navSettings => 'ဆက်တင်များ';

  @override
  String get cancel => 'မလုပ်တော့';

  @override
  String get save => 'သိမ်းရန်';

  @override
  String get delete => 'ဖျက်ရန်';

  @override
  String get close => 'ပိတ်ရန်';

  @override
  String get start => 'စတင်ရန်';

  @override
  String get next => 'ရှေ့သို့';

  @override
  String get done => 'ပြီးပြီ';

  @override
  String get skip => 'ကျော်ရန်';

  @override
  String get apply => 'အသုံးပြုရန်';

  @override
  String get undo => 'ပြန်ပြင်ရန်';

  @override
  String get reset => 'ပြန်စရန်';

  @override
  String get all => 'အားလုံး';

  @override
  String get hide => 'ဖျောက်ရန်';

  @override
  String get learn => 'လေ့လာရန်';

  @override
  String get notes => 'မှတ်စုများ';

  @override
  String errorWithMessage(Object message) {
    return 'Error: $message';
  }

  @override
  String get languageSection => 'ဘာသာစကားများ';

  @override
  String get interfaceLanguage => 'မျက်နှာပြင်ဘာသာစကား';

  @override
  String get interfaceLanguageSubtitle =>
      'စက်၏ဘာသာစကားအတိုင်း သို့မဟုတ် ကိုယ်တိုင်ရွေးပါ';

  @override
  String get contentLanguage => 'သင်ခန်းစာဘာသာစကား';

  @override
  String get contentLanguageSubtitle =>
      'မျက်နှာပြင်ဘာသာစကားနှင့် သီးခြားဖြစ်သည်';

  @override
  String get systemDefault => 'စနစ်အတိုင်း';

  @override
  String get systemDefaultSubtitle => 'ဤစက်တွင် ရွေးထားသောဘာသာစကားကို သုံးပါ';

  @override
  String get languagePickerTitle => 'ဘာသာစကား';

  @override
  String get languagePickerSearchHint =>
      'ဘာသာစကားအမည် သို့မဟုတ် ကုဒ်ဖြင့်ရှာပါ';

  @override
  String get languageChangePreviewTitle => 'မျက်နှာပြင်ဘာသာစကား ပြောင်းမလား?';

  @override
  String languageChangePreviewBody(Object language) {
    return 'မျက်နှာပြင်ကို $language သို့ပြောင်းမည်။ သင်ခန်းစာမပြောင်းပါ။';
  }

  @override
  String languageChangedTo(Object language) {
    return 'ဘာသာစကားကို $language သို့ပြောင်းပြီး';
  }

  @override
  String get holdGlobeToReset =>
      'Press and hold the globe for 3 seconds to restore the system language';

  @override
  String get restoredSystemLanguage => 'စနစ်ဘာသာစကား ပြန်ထားပြီး';

  @override
  String get contentVietnamese => 'ဗီယက်နမ်ဘာသာ';

  @override
  String get contentEnglish => 'အင်္ဂလိပ်ဘာသာ';

  @override
  String get translationReviewNotice =>
      'ဤဘာသာစကားရှိ ဓမ္မအကြောင်းအရာသည် နိုင်ငံတကာ လေ့လာမှုဘာသာပြန်ဖြစ်သည်။ ပါဠိဝေါဟာရများသာ အာဏာတည်ပါသည်။';

  @override
  String get contentDraftNotice =>
      'ဤဘာသာပြန်သည် ဓမ္မစိစစ်မှု စောင့်ဆိုင်းနေသော မူကြမ်းဖြစ်သည်။ အားကိုးမီ ပါဠိနှင့် တိုက်ဆိုင်စစ်ဆေးပါ။';

  @override
  String get settingsAccessibility => 'အသုံးပြုရလွယ်ကူမှု';

  @override
  String get highContrastMode => 'အရောင်ကွာခြားမှုမြင့်';

  @override
  String get highContrastSubtitle =>
      'အမြင်အားနည်းသူများအတွက် အရောင်ကွာခြားမှုကို မြှင့်တင်ပါ';

  @override
  String get screenReaderHints => 'မျက်နှာပြင်ဖတ်စက် အကူအညီ';

  @override
  String get screenReaderHintsSubtitle =>
      'TalkBack နှင့် VoiceOver အတွက် အသေးစိတ်ပိုမိုပေးပါ';

  @override
  String get textSize => 'စာလုံးအရွယ်';

  @override
  String get textScale => 'စာလုံးအချိုး';

  @override
  String get studyProgress => 'လေ့လာမှုတိုးတက်မှု';

  @override
  String get unlockAllLessons => 'သင်ခန်းစာအားလုံးဖွင့်ရန်';

  @override
  String get unlockAllLessonsSubtitle =>
      'လမ်းညွှန်လေ့လာမှုသည် ခိုင်မာသောအခြေခံကို တည်ဆောက်ပေးသည်။ အတွေ့အကြုံရှိသူများသည် သင်ခန်းစာအားလုံးကို ဖွင့်နိုင်သည်။';

  @override
  String get resetProgress => 'တိုးတက်မှုကို ပြန်စရန်';

  @override
  String get resetProgressSubtitle => 'လေ့လာမှုဒေတာအားလုံးကို ဖျက်ပါ';

  @override
  String get showDataWarningAgain => 'ဒေတာသတိပေးချက်ကို ပြန်ပြပါ';

  @override
  String get showDataWarningAgainSubtitle =>
      'မက်ထရစ်သတိပေးဘားကို ပြန်ဖွင့်ပါ';

  @override
  String get dataWarningEnabled => 'ဒေတာသတိပေးချက် ဖွင့်ထားသည်';

  @override
  String get aboutApp => 'အက်ပ်အကြောင်း';

  @override
  String get version => 'ဗားရှင်း';

  @override
  String get sourceMaterial => 'ရင်းမြစ်အကြောင်းအရာ';

  @override
  String get sourceMaterialValue => 'မင်းမိလိန္ဒ A သင်ရိုး — အဘိဓမ္မာ';

  @override
  String get editorialPrinciples => 'တည်းဖြတ်မူအခြေခံများ';

  @override
  String get resetProgressQuestion => 'တိုးတက်မှုကို ပြန်စမလား?';

  @override
  String get resetProgressWarning =>
      'လေ့လာမှုတိုးတက်မှုနှင့် မေးခွန်းရမှတ်အားလုံး ဖျက်သွားမည်။ ဤလုပ်ဆောင်ချက်ကို ပြန်မပြင်နိုင်ပါ။';

  @override
  String get progressResetSuccess => 'လေ့လာမှုတိုးတက်မှုကို ပြန်စပြီးပြီ';

  @override
  String get unlockLessonsQuestion => 'သင်ခန်းစာအားလုံးကို ဖွင့်မလား?';

  @override
  String get unlockLessonsWarning =>
      'လမ်းညွှန်လေ့လာမှုသည် ခိုင်မာသောအဘိဓမ္မာအခြေခံတည်ဆောက်ရန် အကောင်းဆုံးနည်းလမ်းဖြစ်သည်။ ဤရွေးချယ်မှုသည် အတွေ့အကြုံရှိသူများအတွက် ဖြစ်သည်။';

  @override
  String get keepGuidedPath => 'လမ်းညွှန်လမ်းကြောင်းကို ထားပါ';

  @override
  String get unlock => 'ဖွင့်ပါ';

  @override
  String modulesCompleted(Object completed, Object total) {
    return 'မော်ဂျူး $completed / $total ပြီးစီး';
  }

  @override
  String mostRecentModule(Object module) {
    return 'နောက်ဆုံးမော်ဂျူး: $module';
  }

  @override
  String lastStudied(Object date) {
    return 'နောက်ဆုံးလေ့လာချိန်: $date';
  }

  @override
  String get today => 'ယနေ့';

  @override
  String get yesterday => 'မနေ့က';

  @override
  String daysAgo(Object count) {
    return 'လွန်ခဲ့သော $count ရက်';
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
  String get matrixTitle => 'အဘိဓမ္မာဇယား';

  @override
  String matrixSemantics(Object count) {
    return 'Abhidhamma Matrix showing $count cittas';
  }

  @override
  String get rotateScreen => 'မျက်နှာပြင်လှည့်ရန်';

  @override
  String get rotationHint =>
      'မျက်နှာပြင်မလှည့်ပါက စက်ဆက်တင်တွင် Auto-rotate ကို ဖွင့်ပါ။';

  @override
  String get highContrast => 'အရောင်ကွာခြားမှုမြင့်';

  @override
  String get help => 'အကူအညီ';

  @override
  String get searchCittaCetasika => 'စိတ် သို့မဟုတ် စေတသိက် ရှာပါ…';

  @override
  String get clearSearch => 'Clear search';

  @override
  String get citta => 'စိတ်';

  @override
  String get cetasika => 'စေတသိက်';

  @override
  String get unwholesome => 'အကုသိုလ်';

  @override
  String get rootless => 'အဟိတ်';

  @override
  String get senseSphereBeautiful => 'ကာမသောဘန';

  @override
  String get formSphere => 'ရူပဘုံ';

  @override
  String get formlessSphere => 'အရူပဘုံ';

  @override
  String get supramundane => 'လောကုတ္တရာ';

  @override
  String get legend => 'ရှင်းလင်းချက်:';

  @override
  String get associationAlways => 'အမြဲ';

  @override
  String get associationSometimes => 'တစ်ခါတစ်ရံ';

  @override
  String get associationNever => 'မရှိ';

  @override
  String dataWarningsCount(Object count) {
    return '$count data warnings';
  }

  @override
  String get matrixHelpTitle => 'ဇယားလမ်းညွှန်';

  @override
  String get howToRead => 'ဖတ်နည်း:';

  @override
  String get matrixHelpRead =>
      '• အတန်းများ: စိတ်\n• ကော်လံများ: စေတသိက်\n• ဆုံမှတ်များ: ဆက်နွယ်မှု';

  @override
  String get symbols => 'သင်္ကေတများ:';

  @override
  String get matrixHelpSymbols => '✦ = အမြဲပါဝင်\n◎ = တစ်ခါတစ်ရံပါဝင်\n✕ = မပါဝင်';

  @override
  String get tips => 'အကြံပြုချက်များ:';

  @override
  String get matrixHelpTips =>
      '• အသေးစိတ်အတွက် စိတ်ကို နှိပ်ပါ\n• ပဋိပက္ခအတွက် စေတသိက်ကို နှိပ်ပါ\n• မြင်ကွင်းကျဉ်းရန် စစ်ထုတ်ကိရိယာများ သုံးပါ\n• နေရာပိုရရန် မျက်နှာပြင်လှည့်ပါ';

  @override
  String get understood => 'နားလည်ပါပြီ';

  @override
  String get dataWarningTitle => 'Data warning';

  @override
  String get allFilters => 'အားလုံး';

  @override
  String get defilements => 'Defilements';

  @override
  String get kamma => 'ကံ';

  @override
  String get result => 'အကျိုး';

  @override
  String get conditionsTitle => 'ပဋိစ္စသမုပ္ပါဒ်';

  @override
  String get conditionDetails => 'ပဋိစ္စသမုပ္ပါဒ် အသေးစိတ်:';

  @override
  String get lastConditionDescription =>
      'ဤသည်မှာ ဤဘဝစက်ဝန်း၏ နောက်ဆုံးဝိပါက်အကြောင်းဆက်ဖြစ်ပြီး အကြောင်းအသစ် မစတင်ပါ။';

  @override
  String conditionLinkDescription(Object effect, Object explanation) {
    return '• အကြောင်း: $effect\n  ရှင်းလင်းချက်: $explanation';
  }

  @override
  String get conditionsTabLinks => 'အကြောင်းဆက် ၁၂ ပါး';

  @override
  String get conditionsTabPaccaya => 'ပဋ္ဌာန်းပစ္စည်း ၂၄ ပါး';

  @override
  String get paccayaTitle => 'ပဋ္ဌာန်းပစ္စည်း ၂၄ ပါး';

  @override
  String get paccayaIntro =>
      'Paccaya-saṅgaha-vibhāga ၏ အပိုင်း B — ဓမ္မများသည် တစ်ခုနှင့်တစ်ခု ဘယ်လိုအကြောင်းဖြစ်သည်ကို ဖော်ပြသည်။ အပိုင်း A သည် ပဋိစ္စသမုပ္ပါဒ် အကြောင်းဆက် ၁၂ ပါး ဖြစ်သည်။';

  @override
  String get paccayaDefinition => 'အဓိပ္ပါယ်';

  @override
  String get paccayaConditioningStates =>
      'အကြောင်းဖြစ်သော ဓမ္မများ (paccaya-dhamma)';

  @override
  String get paccayaConditionedStates => 'အကြောင်းခံ ဓမ္မများ (paccayuppanna)';

  @override
  String get paccayaSubdivisions => 'ခွဲခြားချက်များ';

  @override
  String get paccayaInPaticca => 'ဤအကြောင်းဆက်များတွင် အလုပ်လုပ်သည်';

  @override
  String get paccayaEmpty => 'ဤစစ်ထုတ်မှုနှင့် ကိုက်ညီသော ပစ္စည်းမရှိပါ။';

  @override
  String get paccayaSearchHint => 'ပစ္စည်း ရှာရန်…';

  @override
  String get paccayaSourceNotice =>
      'ရင်းမြစ်: Paṭṭhāna (Abhidhamma Piṭaka VII) နှင့် Visuddhimagga အခန်း XVII။ Pa-Auk စာတမ်းများတွင် ပစ္စည်း ၂၄ ပါးကို သီးခြားစာရင်းပြုထားခြင်း မတွေ့ရသေးပါ။ ဝေါဟာရများကို အကြီးတန်းသုံးသပ်ရန် လိုအပ်သည်။';

  @override
  String get paccayaSources => 'ရင်းမြစ်များ';

  @override
  String paccayaCount(Object count) {
    return 'ပစ္စည်း $count ပါး';
  }

  @override
  String get relatedDhammas => 'Related dhammas';

  @override
  String get paccayaGroupRootObject => 'ဟိတ်နှင့် အာရုံ';

  @override
  String get paccayaGroupContinuity => 'ဆက်လက်မှု';

  @override
  String get paccayaGroupConascence => 'အတူဖြစ်မှုနှင့် အထောက်အပံ့';

  @override
  String get paccayaGroupTimeRelation => 'ဖြစ်ပေါ်စဉ်';

  @override
  String get paccayaGroupKammaVipaka => 'ကမ္မနှင့် ဝိပါက်';

  @override
  String get paccayaGroupGeneral => 'အထွေထွေ';

  @override
  String get kiepPast => 'အတိတ်ဘဝ';

  @override
  String get kiepPresent => 'ယခုဘဝ';

  @override
  String get kiepFuture => 'အနာဂတ်ဘဝ';

  @override
  String get kammaTitle => 'Kamma';

  @override
  String get mindProcessTitle => 'စိတ်အစဉ်';

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
  String get selected => 'ရွေးထားသည်';

  @override
  String get dimmedByConflict => 'ပဋိပက္ခကြောင့် မှိန်ထားသည်';

  @override
  String get matrixCornerSemantics =>
      'Matrix corner: rows are cittas and columns are cetasikas';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: citta $cittaId with cetasika $cetasikaId';
  }

  @override
  String get tapForDetails => 'အသေးစိတ်အတွက် နှိပ်ပါ';

  @override
  String get studyPath => 'လေ့လာရေးလမ်းကြောင်း';

  @override
  String get bookmarksAndNotes => 'မှတ်သားချက်နှင့် မှတ်စု';

  @override
  String get overallProgress => 'စုစုပေါင်းတိုးတက်မှု';

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
  String get learnTab => 'လေ့လာ';

  @override
  String get reviewTab => 'ပြန်လည်လေ့လာ';

  @override
  String get testTab => 'စမ်းသပ်';

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
    return 'ကမ္မ — $count';
  }

  @override
  String paticcasInModule(Object count) {
    return 'ပဋိစ္စသမုပ္ပါဒ် — $count';
  }

  @override
  String rupasInModule(Object count) {
    return 'ရုပ် — $count';
  }

  @override
  String vithisInModule(Object count) {
    return 'စိတ်အစဉ် — $count';
  }

  @override
  String reviewCetasikaQuestion(Object name, Object pali) {
    return 'What does cetasika “$name” ($pali) mean?';
  }

  @override
  String reviewKammaQuestion(Object name, Object pali) {
    return 'ကမ္မ “$name” ($pali) အကြောင်း ဘာကို မှတ်သားရမလဲ။';
  }

  @override
  String reviewPaticcaQuestion(Object name, Object pali) {
    return 'ပဋိစ္စသမုပ္ပါဒ် အင်္ဂါ “$name” ($pali) အကြောင်း ဘာကို မှတ်သားရမလဲ။';
  }

  @override
  String reviewRupaQuestion(Object name, Object pali) {
    return 'ရုပ် “$name” ($pali) အကြောင်း ဘာကို မှတ်သားရမလဲ။';
  }

  @override
  String reviewVithiQuestion(Object name, Object pali) {
    return 'စိတ်အစဉ် “$name” ($pali) အကြောင်း ဘာကို မှတ်သားရမလဲ။';
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
  String get chooseLevel => 'အဆင့်ရွေးပါ';

  @override
  String quizLevelDescription(Object count) {
    return 'Each level generates up to $count questions from this module';
  }

  @override
  String get insufficientQuizData =>
      'This module does not have enough data to create questions.';

  @override
  String get explanation => 'ရှင်းလင်းချက်';

  @override
  String get nextQuestion => 'နောက်မေးခွန်း';

  @override
  String get viewResults => 'ရလဒ်ကြည့်ရန်';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total correct';
  }

  @override
  String get quizExcellent => 'Excellent! You have mastered this module.';

  @override
  String get quizTryAgain => 'Review the material and try again.';

  @override
  String get tryAgain => 'ထပ်ကြိုးစား';

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
  String get beginner => 'အခြေခံ';

  @override
  String get beginnerDescription => 'Basic cetasika groups and feelings';

  @override
  String get intermediate => 'အလယ်အလတ်';

  @override
  String get intermediateDescription => 'Includes cetasika conflicts';

  @override
  String get advanced => 'အဆင့်မြင့်';

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
  String get contentFallbackNotice => 'ဤအကြောင်းအရာကို မဘာသာပြန်ရသေးသဖြင့် အင်္ဂလိပ်စာကို ပြထားပါသည်။';

  @override
  String get listenAll => 'အားလုံး နားထောင်ရန်';

  @override
  String get listeningQueue => 'နားထောင်စရာ စာရင်း';

  @override
  String get listenFromHere => 'ဒီကနေ နားထောင်ရန်';

  @override
  String get nowPlaying => 'ဖွင့်နေသည်';

  @override
  String get repeatOff => 'ထပ်ဖွင့်ခြင်း ပိတ်ရန်';

  @override
  String get repeatOne => 'ဒီအပိုင်းကို ထပ်ဖွင့်ရန်';

  @override
  String get repeatAll => 'စာရင်းအားလုံး ထပ်ဖွင့်ရန်';

  @override
  String get listenAgain => 'နောက်တစ်ခေါက် နားထောင်ရန်';

  @override
  String get playbackSpeed => 'အမြန်နှုန်း';

  @override
  String get resumeListening => 'နားထောင်မှု ဆက်ရန်';

  @override
  String get continueListening => 'Continue listening';

  @override
  String get sleepTimer => 'အလိုအလျောက်ပိတ်ချိန်';

  @override
  String get sleepTimerOff => 'ပိတ်';

  @override
  String get minutesShort => 'မိနစ်';

  @override
  String get playAudio => 'ဖွင့်ရန်';

  @override
  String get pauseAudio => 'ခဏရပ်ရန်';

  @override
  String get previousTrack => 'အရင်အပိုင်း';

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
