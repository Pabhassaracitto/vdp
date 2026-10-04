// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get appName => 'အဘိဓမ္မာ';

  @override
  String get appTagline => 'အဘိဓမ္မာပိဋကတ်';

  @override
  String get initializing => 'စတင်နေသည်…';

  @override
  String get loadingDoctrineData => 'တရားတော်အချက်အလက်များ တင်နေသည်…';

  @override
  String get loadingTakingLonger =>
      'စတင်ခြင်းသည် မျှော်လင့်ထားသည်ထက် ပိုကြာနေပါသည်...';

  @override
  String get unknownError => 'အမည်မသိ အမှား';

  @override
  String get dataError => 'ဒေတာ အမှား';

  @override
  String get invalidData => 'မမှန်ကန်သော ဒေတာ';

  @override
  String get invalidDataDescription =>
      'ဓမ္မ စစ်ဆေးမှု စည်းမျဉ်းများ ချိုးဖောက်မှုကို စနစ်က တွေ့ရှိထားသည်။';

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
    return 'အမှား: $message';
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
      'စနစ်သုံးဘာသာစကားသို့ ပြန်ထားရန် ကမ္ဘာလုံးပုံကို ၃ စက္ကန့် ဖိထားပါ';

  @override
  String get restoredSystemLanguage => 'စနစ်သုံးဘာသာစကားသို့ ပြန်ထားပြီးပါပြီ';

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
  String get screenReaderHints => 'စခရင်ဖတ်စနစ် အထောက်အကူများ';

  @override
  String get screenReaderHintsSubtitle =>
      'TalkBack နှင့် VoiceOver အတွက် အသေးစိတ်ပိုမိုပေးပါ';

  @override
  String get textSize => 'စာလုံးအရွယ်';

  @override
  String get textScale => 'စာလုံးအရွယ်အစား';

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
  String get showDataWarningAgainSubtitle => 'မက်ထရစ်သတိပေးဘားကို ပြန်ဖွင့်ပါ';

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
  String get onboardingVisualTitle => 'ရှင်းလင်းစွာ မြင်ပါ';

  @override
  String get onboardingVisualSubtitle => 'စိတ် × စေတသိက် ဇယား';

  @override
  String get onboardingVisualBody =>
      'စိတ် ၁၂၁ ပါးနှင့် စေတသိက် ၅၂ ပါးတို့၏ ယှဉ်တွဲပုံကို အပြန်အလှန်လေ့လာပါ။';

  @override
  String get onboardingCausalityTitle => 'နက်နဲစွာ နားလည်ပါ';

  @override
  String get onboardingCausalitySubtitle => 'ပဋိစ္စသမုပ္ပါဒ်';

  @override
  String get onboardingCausalityBody =>
      'ပဋိစ္စသမုပ္ပါဒ် အင်္ဂါ ၁၂ ပါးနှင့် ကံအမျိုးအစားများကို လေ့လာပါ။';

  @override
  String get onboardingExploreTitle => 'မိမိဘာသာ ရှာဖွေလေ့လာပါ';

  @override
  String get onboardingExploreSubtitle => 'လွတ်လပ်သော သင်ယူမှုလမ်းကြောင်း';

  @override
  String get onboardingExploreBody =>
      'သင်ခန်းစာ ၁၀ ခုမှတစ်ဆင့် မိမိစိတ်ကြိုက် လေ့လာသင်ယူနိုင်ပါသည်။';

  @override
  String get beginExploring => 'စတင်လေ့လာပါ';

  @override
  String get matrixTitle => 'အဘိဓမ္မာဇယား';

  @override
  String matrixSemantics(Object count) {
    return 'စိတ် $count ပါး ပြသထားသော အဘိဓမ္မာ ဇယား';
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
  String get clearSearch => 'ရှာဖွေမှု ရှင်းပါ';

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
    return 'ဒေတာသတိပေးချက် $count ခု';
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
  String get matrixHelpSymbols =>
      '✦ = အမြဲပါဝင်\n◎ = တစ်ခါတစ်ရံပါဝင်\n✕ = မပါဝင်';

  @override
  String get tips => 'အကြံပြုချက်များ:';

  @override
  String get matrixHelpTips =>
      '• အသေးစိတ်အတွက် စိတ်ကို နှိပ်ပါ\n• ပဋိပက္ခအတွက် စေတသိက်ကို နှိပ်ပါ\n• မြင်ကွင်းကျဉ်းရန် စစ်ထုတ်ကိရိယာများ သုံးပါ\n• နေရာပိုရရန် မျက်နှာပြင်လှည့်ပါ';

  @override
  String get matrixListenCittas => 'စိတ်အားလုံး နားထောင်ရန်';

  @override
  String get matrixListenCetasikas => 'စေတသိက်အားလုံး နားထောင်ရန်';

  @override
  String get matrixListenFromHint => 'ဤအရာမှ နားထောင်ရန် နှိပ်ဖိထားပါ';

  @override
  String get matrixListenHelpBody =>
      'စိတ် တစ်ကြောင်း သို့မဟုတ် စေတသိက် တစ်ခုကို နှိပ်ဖိထားခြင်းဖြင့် ထိုအရာမှ နားထောင်ပါ။ စာရင်းအားလုံး နားထောင်ရန် စားပွဲကွက် ထောင့်ရှိ နားကြပ်သင်္ကေတကို နှိပ်ပါ။';

  @override
  String get understood => 'နားလည်ပါပြီ';

  @override
  String get dataWarningTitle => 'ဒေတာ သတိပေးချက်';

  @override
  String get allFilters => 'အားလုံး';

  @override
  String get defilements => 'ကိလေသာ (Kilesa)';

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
  String get relatedDhammas => 'ဆက်စပ်တရားများ';

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
  String get kammaTitle => 'ကံ (Kamma)';

  @override
  String get mindProcessTitle => 'စိတ်အစဉ်';

  @override
  String get paliLabel => 'ပါဠိ:';

  @override
  String get stopPronunciation => 'အသံထွက် ရပ်ပါ';

  @override
  String get listenPaliPronunciation => 'ပါဠိ အသံထွက် နားထောင်ပါ';

  @override
  String get ttsUnavailable => 'ဤစက်ပစ္စည်းတွင် အသံထွက်စနစ် မရနိုင်ပါ။';

  @override
  String get dragHandleSemantics => 'အရွယ်အစားညှိရန် ဆွဲပါ';

  @override
  String cittaNumber(Object number) {
    return 'စိတ် $number';
  }

  @override
  String get doctrine => 'ဓမ္မ ရှင်းလင်းချက်';

  @override
  String get examples => 'ဥပမာများ';

  @override
  String fixedCetasikasCount(Object count) {
    return 'နိယတစေတသိက် ($count)';
  }

  @override
  String variableCetasikasCount(Object count) {
    return 'အနိယတစေတသိက် ($count)';
  }

  @override
  String get personalNote => 'ကိုယ်ပိုင်မှတ်စု';

  @override
  String get personalNoteHint => 'မှတ်စုရေးပါ…';

  @override
  String get wholesome => 'ကုသိုလ်';

  @override
  String get functional => 'ကြိယာ';

  @override
  String get pleasantFeeling => 'ကာယိက သုခဝေဒနာ';

  @override
  String get unpleasantFeeling => 'ကာယိက ဒုက္ခဝေဒနာ';

  @override
  String get neutralFeeling => 'ဥပေက္ခာဝေဒနာ';

  @override
  String get joyfulFeeling => 'သောမနဿဝေဒနာ';

  @override
  String get alwaysAssociated => 'အမြဲယှဉ်တွဲသော';

  @override
  String get mayBeAssociated => 'တစ်ခါတစ်ရံယှဉ်တွဲသော';

  @override
  String get fourfoldDefinition =>
      'လက္ခဏာဒိစတုက္က (လက္ခဏာ/ရသ/ပစ္စုပဋ္ဌာန်/ပဒဋ္ဌာန်)';

  @override
  String get characteristic => 'လက္ခဏာ (Lakkhaṇa)';

  @override
  String get functionLabel => 'ကိစ္စ / ရသ (Rasa)';

  @override
  String get manifestation => 'ပစ္စုပဋ္ဌာန် (Paccupaṭṭhāna)';

  @override
  String get proximateCause => 'ပဒဋ္ဌာန် (Padaṭṭhāna)';

  @override
  String get doctrinalConflicts => 'ဓမ္မဆန့်ကျင်မှု စည်းမျဉ်းများ';

  @override
  String rulesCount(Object count) {
    return 'စည်းမျဉ်း $count ခု';
  }

  @override
  String get universalCetasikas => 'သဗ္ဗစိတ္တသာဓာရဏ ၇';

  @override
  String get occasionalCetasikas => 'ပကိဏ်း ၆';

  @override
  String get unwholesomeCetasikas => 'အကုသိုလ်စေတသိက် ၁၄';

  @override
  String get beautifulCetasikas => 'သောဘဏစေတသိက် ၂၅';

  @override
  String rowCittaSemantics(Object displayIndex, Object name, Object order,
      Object group, Object feeling, Object action) {
    return 'စိတ်အစဉ် $displayIndex: $name; မူရင်းအမှတ် $order; အုပ်စု $group; ဝေဒနာ $feeling. $action';
  }

  @override
  String cetasikaSemantics(
      Object name, Object pali, Object group, Object state) {
    return 'စေတသိက် $name ($pali), အုပ်စု $group. $state အသေးစိတ်ကြည့်ရန် နှိပ်ပါ။';
  }

  @override
  String get selected => 'ရွေးထားသည်';

  @override
  String get dimmedByConflict => 'ပဋိပက္ခကြောင့် မှိန်ထားသည်';

  @override
  String get matrixCornerSemantics =>
      'ဇယားထောင့်: အလျားလိုက်သည် စိတ်ဖြစ်ပြီး ဒေါင်လိုက်သည် စေတသိက်ဖြစ်သည်';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: စိတ် $cittaId နှင့် စေတသိက် $cetasikaId';
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
    return 'သိမ်းဆည်းထားသော အရာ $count ခု';
  }

  @override
  String get cittaTab => 'စိတ်';

  @override
  String get cetasikaTab => 'စေတသိက်';

  @override
  String get notesTab => 'မှတ်စုများ';

  @override
  String get noBookmarkedCittas => 'မှတ်သားထားသော စိတ်မရှိပါ';

  @override
  String get bookmarkCittaHint =>
      'သိမ်းဆည်းရန် သင်ခန်းစာကိုဖွင့်ပြီး အမှတ်အသား အိုင်ကွန်ကို နှိပ်ပါ';

  @override
  String get loadingCittas => 'စိတ်အချက်အလက်များ တင်နေသည်…';

  @override
  String get noBookmarkedCetasikas => 'မှတ်သားထားသော စေတသိက်မရှိပါ';

  @override
  String get loadingCetasikas => 'စေတသိက်အချက်အလက်များ တင်နေသည်…';

  @override
  String get noNotes => 'မှတ်စု မရှိသေးပါ';

  @override
  String get addNoteHint =>
      'ကိုယ်ပိုင်မှတ်စု ရေးရန် ပြင်ဆင်ရန် အိုင်ကွန်ကို နှိပ်ပါ';

  @override
  String get deleteNoteQuestion => 'မှတ်စုကို ဖျက်မလား?';

  @override
  String get deleteNoteWarning =>
      'ဤမှတ်စုကို အပြီးအပိုင် ဖျက်ပါမည်။ သေချာပါသလား?';

  @override
  String get addNote => 'မှတ်စု ထည့်ပါ';

  @override
  String get removeBookmark => 'အမှတ်အသား ဖယ်ရှားပါ';

  @override
  String get editNote => 'မှတ်စု ပြင်ပါ';

  @override
  String get deleteNote => 'မှတ်စု ဖျက်ပါ';

  @override
  String get noteUpdated => 'မှတ်စု အသစ်ပြင်ပြီးပါပြီ';

  @override
  String get noteSaved => 'မှတ်စု သိမ်းဆည်းပြီးပါပြီ';

  @override
  String get editNoteTitle => 'မှတ်စု ပြင်ဆင်ရန်';

  @override
  String get addNoteTitle => 'မှတ်စု အသစ်ထည့်ရန်';

  @override
  String get studyNoteHint =>
      'ဤအကြောင်းအရာနှင့် ပတ်သက်၍ ကိုယ်ပိုင်မှတ်စု ရေးပါ…';

  @override
  String charactersCount(Object current, Object maximum) {
    return 'စာလုံးရေ $current / $maximum';
  }

  @override
  String get update => 'ပြင်ဆင်ပါ';

  @override
  String get saveNote => 'မှတ်စု သိမ်းပါ';

  @override
  String studyProgressPercent(Object percent) {
    return 'သင်ယူမှု တိုးတက်မှု: $percent%';
  }

  @override
  String get modulesCompletedShort => 'ပြီးစီးသော\nသင်ခန်းစာများ';

  @override
  String get recommendedNext => 'ဆက်လက်လေ့လာရန်';

  @override
  String get progressOverview => 'တိုးတက်မှု ခြုံငုံသုံးသပ်ချက်';

  @override
  String get totalModules => 'စုစုပေါင်း သင်ခန်းစာများ';

  @override
  String get dueForReview => 'ပြန်လည်လေ့ကျက်ရန်';

  @override
  String get learnTab => 'လေ့လာ';

  @override
  String get reviewTab => 'ပြန်လည်လေ့လာ';

  @override
  String get testTab => 'စမ်းသပ်';

  @override
  String get moduleHasNoData => 'ဤသင်ခန်းစာတွင် အချက်အလက် မရှိသေးပါ။';

  @override
  String cittasInModule(Object count) {
    return 'ဤသင်ခန်းစာပါ စိတ်များ — $count';
  }

  @override
  String cetasikasInModule(Object count) {
    return 'ဤသင်ခန်းစာပါ စေတသိက်များ — $count';
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
    return 'စေတသိက် “$name” ($pali) ၏ အဓိပ္ပာယ်မှာ အဘယ်နည်း?';
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
    return 'အုပ်စု: $group';
  }

  @override
  String reviewCittaQuestion(Object name) {
    return 'စိတ် “$name” သည် မည်သည့်ဘုံနှင့် မည်သည့်ဝေဒနာ ရှိသနည်း?';
  }

  @override
  String cittaReviewAnswer(Object sphere, Object feeling, Object pali) {
    return 'ဘုံ: $sphere\nဝေဒနာ: $feeling\nပါဠိ: $pali';
  }

  @override
  String get noReviewContent =>
      'ဤသင်ခန်းစာတွင် ပြန်လည်လေ့ကျက်ရန် အကြောင်းအရာ မရှိသေးပါ။';

  @override
  String reviewedCount(Object revealed, Object total) {
    return 'လေ့ကျက်ပြီး $revealed / $total';
  }

  @override
  String get reviewComplete =>
      'သင်ခန်းစာအားလုံး လေ့ကျက်ပြီးပါပြီ။ စမ်းသပ်စစ်ဆေးမှု ဖြေဆိုပါ။';

  @override
  String get tapToReveal => 'အဖြေကြည့်ရန် နှိပ်ပါ';

  @override
  String answerLabel(Object answer) {
    return 'အဖြေ: $answer';
  }

  @override
  String get revealAnswer => 'အဖြေ ပြပါ';

  @override
  String moduleQuizTitle(Object module) {
    return 'မေးခွန်းများ\n$module';
  }

  @override
  String moduleContentCount(Object count) {
    return 'ဤသင်ခန်းစာတွင် အကြောင်းအရာ $count ခု ပါဝင်ပါသည်';
  }

  @override
  String get quizMaximumDescription =>
      'ဤသင်ခန်းစာကို လွှမ်းခြုံသော ရွေးချယ်စရာ မေးခွန်း ၁၀ ခုအထိ';

  @override
  String get startQuiz => 'စစ်ဆေးမှု စတင်ပါ';

  @override
  String cittasCount(Object count) {
    return 'စိတ် $count ပါး';
  }

  @override
  String cetasikasCount(Object count) {
    return 'စေတသိက် $count ပါး';
  }

  @override
  String noteForItem(Object name) {
    return 'မှတ်စု: $name';
  }

  @override
  String get chooseLevel => 'အဆင့်ရွေးပါ';

  @override
  String quizLevelDescription(Object count) {
    return 'အဆင့်တစ်ခုစီသည် မေးခွန်း $count ခု ထုတ်ပေးပါသည်';
  }

  @override
  String get insufficientQuizData => 'မေးခွန်းထုတ်ရန် ဒေတာ မလုံလောက်ပါ။';

  @override
  String get explanation => 'ရှင်းလင်းချက်';

  @override
  String get nextQuestion => 'နောက်မေးခွန်း';

  @override
  String get viewResults => 'ရလဒ်ကြည့်ရန်';

  @override
  String correctAnswers(Object score, Object total) {
    return 'မှန်ကန်မှု $score / $total';
  }

  @override
  String get quizExcellent =>
      'ထူးချွန်ပါသည်! သင် ဤသင်ခန်းစာကို ကျွမ်းကျင်စွာ တတ်မြောက်သွားပါပြီ။';

  @override
  String get quizTryAgain => 'ပြန်လည်လေ့လာပြီး ထပ်မံကြိုးစားပါ။';

  @override
  String get tryAgain => 'ထပ်ကြိုးစား';

  @override
  String quizInsufficientDataMessage(Object module) {
    return '“$module” အတွက် မေးခွန်းထုတ်ရန် ဒေတာ မလုံလောက်ပါ။';
  }

  @override
  String get quizTypeCetasikaGroup => 'စေတသိက် ခွဲခြားခြင်း';

  @override
  String get quizTypeFeeling => 'ဝေဒနာ ခွဲခြားခြင်း';

  @override
  String get quizTypeConflict => 'ဓမ္မ ဆန့်ကျင်မှုများ';

  @override
  String get quizTypeSphere => 'ဘုံ အဆင့်အတန်း';

  @override
  String get beginner => 'အခြေခံ';

  @override
  String get beginnerDescription => 'အခြေခံ စေတသိက် အုပ်စုများနှင့် ဝေဒနာများ';

  @override
  String get intermediate => 'အလယ်အလတ်';

  @override
  String get intermediateDescription =>
      'စေတသိက် ဆန့်ကျင်မှု စည်းမျဉ်းများ ပါဝင်သည်';

  @override
  String get advanced => 'အဆင့်မြင့်';

  @override
  String get advancedDescription =>
      'ဘုံများနှင့် မေးခွန်းပုံစံ အားလုံး ပါဝင်သည်';

  @override
  String get trueLabel => 'မှန်';

  @override
  String get falseLabel => 'မှား';

  @override
  String get trueOrFalse => 'မှန် သို့မဟုတ် မှား?';

  @override
  String quizCetasikaGroupQuestion(Object name, Object pali) {
    return '“$name” ($pali) သည် မည်သည့်အုပ်စုတွင် ပါဝင်သနည်း?';
  }

  @override
  String quizCetasikaGroupExplanation(
      Object name, Object group, Object description) {
    return '“$name” သည် $group တွင် ပါဝင်သည်။\n$description';
  }

  @override
  String quizCetasikaClaim(Object name, Object pali, Object group) {
    return '“$name” ($pali) သည် $group တွင် ပါဝင်သည်။ မှန် သို့မဟုတ် မှား?';
  }

  @override
  String quizCittaFeelingQuestion(Object name) {
    return 'စိတ် “$name” တွင် မည်သည့်ဝေဒနာ ယှဉ်သနည်း?';
  }

  @override
  String quizCittaFeelingExplanation(Object name, Object feeling) {
    return '“$name” တွင် $feeling ယှဉ်သည်။';
  }

  @override
  String quizCittaFeelingClaim(Object name, Object feeling) {
    return 'စိတ် “$name” တွင် $feeling ယှဉ်သည်။ မှန် သို့မဟုတ် မှား?';
  }

  @override
  String get conflictNo => 'မဟုတ် — ဆန့်ကျင်ဘက်ဖြစ်သည်';

  @override
  String get conflictAlwaysYes => 'ဟုတ် — အမြဲ အတူယှဉ်တွဲဖြစ်သည်';

  @override
  String get conflictSometimesYes => 'ဟုတ် — တစ်ခါတစ်ရံ အတူယှဉ်တွဲဖြစ်သည်';

  @override
  String quizConflictQuestion(Object first, Object second) {
    return '“$first” နှင့် “$second” တို့ စိတ်တစ်ခုတည်းတွင် အတူတကွ ဖြစ်နိုင်သလား?';
  }

  @override
  String quizSphereQuestion(Object name) {
    return 'စိတ် “$name” သည် မည်သည့်ဘုံသို့ သက်ရောက်သနည်း?';
  }

  @override
  String quizSphereExplanation(Object name, Object sphere) {
    return '“$name” သည် $sphere ဘုံသို့ သက်ရောက်သည်။';
  }

  @override
  String quizSphereClaim(Object name, Object sphere) {
    return 'စိတ် “$name” သည် $sphere ဘုံသို့ သက်ရောက်သည်။ မှန် သို့မဟုတ် မှား?';
  }

  @override
  String get phaseFoundation => 'အဆင့် ၁ — အခြေခံ';

  @override
  String get phaseCausality => 'အဆင့် ၂ — အကြောင်းအကျိုး';

  @override
  String get phaseMastery => 'အဆင့် ၃ — ကျွမ်းကျင်မှု';

  @override
  String get contentFallbackNotice =>
      'ဤအကြောင်းအရာကို မဘာသာပြန်ရသေးသဖြင့် အင်္ဂလိပ်စာကို ပြထားပါသည်။';

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
  String get minutesShort => 'မိနစ်';

  @override
  String get playAudio => 'ဖွင့်ရန်';

  @override
  String get pauseAudio => 'ခဏရပ်ရန်';

  @override
  String get previousTrack => 'အရင်အပိုင်း';

  @override
  String get sleepTimer => 'အလိုအလျောက်ပိတ်ချိန်';

  @override
  String get sleepTimerOff => 'ပိတ်';

  @override
  String get sleepTimer15 => '၁၅ မိနစ်';

  @override
  String get sleepTimer30 => '၃၀ မိနစ်';

  @override
  String get sleepTimer60 => '၆၀ မိနစ်';

  @override
  String sleepTimerRemaining(Object minutes) {
    return 'ပိတ်ရန် $minutes မိနစ် ကျန်သည်';
  }

  @override
  String get audioModelUnavailable =>
      'အဆင့်မြင့်အသံ မရနိုင်သဖြင့် စက်၏အသံကို အသုံးပြုနေသည်';

  @override
  String get realDuration => 'ကြာချိန်';

  @override
  String get estimatedDuration => 'ခန့်မှန်းကြာချိန်';

  @override
  String get continueListening => 'ဆက်လက် နားထောင်ပါ';

  @override
  String get audioBackgroundLimit =>
      'နောက်ခံအသံဖွင့်ခြင်းသည် ထည့်သွင်းထားသော အသံအင်ဂျင်ပေါ်တွင် မူတည်ပါသည်';

  @override
  String get karaokeSettingsTitle => 'နားထောင်ခြင်းနှင့် စာသားအရောင်တင်ခြင်း';

  @override
  String get karaokeModeTitle => 'ကာရာအိုကေ မုဒ်';

  @override
  String get karaokeModeSubtitle =>
      'နားထောင်နေစဉ် ဖတ်နေသော စာသားကို အရောင်တင်ပါ';

  @override
  String get karaokeLineHighlightTitle => 'လက်ရှိစာကြောင်းကို အရောင်တင်ပါ';

  @override
  String get karaokeLineHighlightSubtitle => 'ဖတ်နေသော စာပိုဒ်ကို အရောင်ခြယ်ပါ';

  @override
  String get karaokeWordHighlightTitle => 'တစ်လုံးချင်း အရောင်တင်ပါ';

  @override
  String get karaokeWordHighlightSubtitle =>
      'ဖတ်ရွတ်သည့်အတိုင်း စကားလုံးတစ်လုံးချင်း အရောင်တင်ပါ';

  @override
  String get audioFloatingGoTo => 'ဖွင့်နေသောနေရာသို့ သွားပါ';

  @override
  String get audioFloatingHide => 'ဖွင့်စက်ကို ဝှက်ပါ';

  @override
  String get audioFloatingRestore => 'ဖွင့်စက်ကို ပြန်ပြပါ';

  @override
  String get audioFloatingClose => 'ဖွင့်စက်ကို ပိတ်ပါ';
}
