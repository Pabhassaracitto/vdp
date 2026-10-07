// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'अभिधम्म';

  @override
  String get appTagline => 'अभिधम्मपिटक';

  @override
  String get initializing => 'आरंभ हो रहा है…';

  @override
  String get loadingDoctrineData => 'धम्म डेटा लोड और मान्य किया जा रहा है…';

  @override
  String get loadingTakingLonger =>
      'प्रारंभ होने में अपेक्षा से अधिक समय लग रहा है। डेटा अनुकूलित किया जा रहा हो सकता है।';

  @override
  String get unknownError => 'अज्ञात त्रुटि';

  @override
  String get dataError => 'डेटा त्रुटि';

  @override
  String get invalidData => 'अमान्य डेटा';

  @override
  String get invalidDataDescription =>
      'सिस्टम ने धम्म सत्यापन नियमों का उल्लंघन पाया है। कृपया डेटा की समीक्षा के लिए संपर्क करें।';

  @override
  String get navMatrix => 'मैट्रिक्स';

  @override
  String get navStudy => 'अध्ययन';

  @override
  String get navConditions => 'प्रतीत्यसमुत्पाद';

  @override
  String get navMindProcess => 'चित्त प्रक्रिया';

  @override
  String get navSettings => 'सेटिंग्स';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get save => 'सहेजें';

  @override
  String get delete => 'हटाएँ';

  @override
  String get close => 'बंद करें';

  @override
  String get start => 'आरंभ';

  @override
  String get next => 'अगला';

  @override
  String get done => 'पूर्ण';

  @override
  String get skip => 'छोड़ें';

  @override
  String get apply => 'लागू करें';

  @override
  String get undo => 'पूर्ववत्';

  @override
  String get reset => 'रीसेट';

  @override
  String get all => 'सभी';

  @override
  String get hide => 'छिपाएँ';

  @override
  String get learn => 'सीखें';

  @override
  String get notes => 'नोट्स';

  @override
  String errorWithMessage(Object message) {
    return 'त्रुटि: $message';
  }

  @override
  String get languageSection => 'भाषाएँ';

  @override
  String get interfaceLanguage => 'इंटरफ़ेस भाषा';

  @override
  String get interfaceLanguageSubtitle =>
      'डिवाइस की भाषा अपनाएँ या स्वयं चुनें';

  @override
  String get contentLanguage => 'अध्ययन सामग्री की भाषा';

  @override
  String get contentLanguageSubtitle => 'इंटरफ़ेस भाषा से स्वतंत्र';

  @override
  String get systemDefault => 'सिस्टम डिफ़ॉल्ट';

  @override
  String get systemDefaultSubtitle => 'इस डिवाइस पर चुनी भाषा का उपयोग करें';

  @override
  String get languagePickerTitle => 'भाषा';

  @override
  String get languagePickerSearchHint => 'भाषा के नाम या कोड से खोजें';

  @override
  String get languageChangePreviewTitle => 'इंटरफ़ेस भाषा बदलें?';

  @override
  String languageChangePreviewBody(Object language) {
    return 'इंटरफ़ेस $language में बदल जाएगा। अध्ययन सामग्री नहीं बदलेगी।';
  }

  @override
  String languageChangedTo(Object language) {
    return 'भाषा $language में बदली गई';
  }

  @override
  String get holdGlobeToReset =>
      'सिस्टम भाषा पुनर्स्थापित करने के लिए ग्लोब को 3 सेकंड तक दबाकर रखें';

  @override
  String get restoredSystemLanguage => 'सिस्टम भाषा पुनर्स्थापित की गई';

  @override
  String get contentVietnamese => 'वियतनामी';

  @override
  String get contentEnglish => 'अंग्रेज़ी';

  @override
  String get translationReviewNotice =>
      'इस भाषा की धम्म सामग्री एक अंतरराष्ट्रीय अध्ययन अनुवाद है। पāḷि शब्द ही प्रामाणिक रहते हैं।';

  @override
  String get contentDraftNotice =>
      'यह अनुवाद अभी मसौदा है और सैद्धांतिक समीक्षा की प्रतीक्षा में है। भरोसा करने से पहले पāḷि से मिलान करें।';

  @override
  String get settingsAccessibility => 'सुलभता';

  @override
  String get highContrastMode => 'उच्च कंट्रास्ट मोड';

  @override
  String get highContrastSubtitle =>
      'कम दृष्टि वाले लोगों के लिए रंग-विरोध बढ़ाएँ';

  @override
  String get screenReaderHints => 'स्क्रीन रीडर संकेत';

  @override
  String get screenReaderHintsSubtitle =>
      'TalkBack और VoiceOver के लिए अधिक विवरण दें';

  @override
  String get textSize => 'अक्षर आकार';

  @override
  String get textScale => 'पाठ का आकार';

  @override
  String get studyProgress => 'अध्ययन प्रगति';

  @override
  String get unlockAllLessons => 'सभी पाठ खोलें';

  @override
  String get unlockAllLessonsSubtitle =>
      'निर्देशित मार्ग मजबूत आधार बनाता है। अनुभवी विद्यार्थी हर पाठ खोल सकते हैं।';

  @override
  String get resetProgress => 'प्रगति रीसेट करें';

  @override
  String get resetProgressSubtitle => 'सभी अध्ययन डेटा हटाएँ';

  @override
  String get showDataWarningAgain => 'डेटा चेतावनी फिर दिखाएँ';

  @override
  String get showDataWarningAgainSubtitle =>
      'मैट्रिक्स चेतावनी पट्टी पुनः दिखाएँ';

  @override
  String get dataWarningEnabled => 'डेटा चेतावनी चालू है';

  @override
  String get aboutApp => 'परिचय';

  @override
  String get version => 'संस्करण';

  @override
  String get sourceMaterial => 'स्रोत सामग्री';

  @override
  String get sourceMaterialValue => 'राजा मिलिंद A पाठ्यक्रम — अभिधम्म';

  @override
  String get editorialPrinciples => 'संपादकीय सिद्धांत';

  @override
  String get resetProgressQuestion => 'प्रगति रीसेट करें?';

  @override
  String get resetProgressWarning =>
      'सभी अध्ययन प्रगति और क्विज़ अंक हट जाएंगे। यह क्रिया वापस नहीं की जा सकती।';

  @override
  String get progressResetSuccess => 'अध्ययन प्रगति रीसेट हो गई';

  @override
  String get unlockLessonsQuestion => 'सभी पाठ खोलें?';

  @override
  String get unlockLessonsWarning =>
      'निर्देशित मार्ग ठोस अभिधम्म आधार बनाने का सर्वोत्तम तरीका है। यह विकल्प अनुभवी विद्यार्थियों के लिए है।';

  @override
  String get keepGuidedPath => 'निर्देशित मार्ग रखें';

  @override
  String get unlock => 'खोलें';

  @override
  String modulesCompleted(Object completed, Object total) {
    return '$completed / $total मॉड्यूल पूर्ण';
  }

  @override
  String mostRecentModule(Object module) {
    return 'सबसे हाल का मॉड्यूल: $module';
  }

  @override
  String lastStudied(Object date) {
    return 'अंतिम अध्ययन: $date';
  }

  @override
  String get today => 'आज';

  @override
  String get yesterday => 'कल';

  @override
  String daysAgo(Object count) {
    return '$count दिन पहले';
  }

  @override
  String get onboardingVisualTitle => 'स्पष्ट दर्शन';

  @override
  String get onboardingVisualSubtitle => 'चित्त × चेतसिक मैट्रिक्स';

  @override
  String get onboardingVisualBody =>
      '121 चित्त और 52 चेतसिकों को एक इंटरैक्टिव मैट्रिक्स में जानें। रंग, आकार और शब्द प्रत्येक संयोजन को सुगम बनाते हैं।';

  @override
  String get onboardingCausalityTitle => 'गहन बोध';

  @override
  String get onboardingCausalitySubtitle => 'प्रतीत्यसमुत्पाद';

  @override
  String get onboardingCausalityBody =>
      'प्रतीत्यसमुत्पाद के बारह अंगों और कर्म के वर्गीकरण को अंतर्संबंधित दृष्टिकोण से समझें।';

  @override
  String get onboardingExploreTitle => 'स्वयं खोजें';

  @override
  String get onboardingExploreSubtitle => 'गैर-रैखिक अध्ययन मार्ग';

  @override
  String get onboardingExploreBody =>
      'दस जुड़े हुए मॉड्यूल के माध्यम से अपना मार्ग चुनें। स्मरण, प्रश्नोत्तरी और पुनरावलोकन ज्ञान को स्थिर करते हैं।';

  @override
  String get beginExploring => 'अन्वेषण आरंभ करें';

  @override
  String get matrixTitle => 'अभिधम्म मैट्रिक्स';

  @override
  String matrixSemantics(Object count) {
    return 'अभिधम्म मैट्रिक्स $count चित्त दिखा रहा है';
  }

  @override
  String get rotateScreen => 'स्क्रीन घुमाएँ';

  @override
  String get rotationHint =>
      'यदि स्क्रीन नहीं घूमती है, तो डिवाइस सेटिंग्स में ऑटो-रोटेट चालू करें।';

  @override
  String get highContrast => 'उच्च कंट्रास्ट';

  @override
  String get help => 'सहायता';

  @override
  String get searchCittaCetasika => 'चित्त या चेतसिक खोजें…';

  @override
  String get clearSearch => 'खोज साफ़ करें';

  @override
  String get citta => 'चित्त';

  @override
  String get cetasika => 'चेतसिक';

  @override
  String get unwholesome => 'अकुशल';

  @override
  String get rootless => 'अहेतुक';

  @override
  String get senseSphereBeautiful => 'कामावचर शोभन';

  @override
  String get formSphere => 'रूपावचर';

  @override
  String get formlessSphere => 'अरूपावचर';

  @override
  String get supramundane => 'लोकुत्तर';

  @override
  String get legend => 'संकेत:';

  @override
  String get associationAlways => 'नियत';

  @override
  String get associationSometimes => 'अनियत';

  @override
  String get associationNever => 'अनुपस्थित';

  @override
  String dataWarningsCount(Object count) {
    return '$count डेटा चेतावनियाँ';
  }

  @override
  String get matrixHelpTitle => 'मैट्रिक्स मार्गदर्शिका';

  @override
  String get howToRead => 'कैसे पढ़ें:';

  @override
  String get matrixHelpRead =>
      '• पंक्तियाँ: चित्त\n• स्तंभ: चेतसिक\n• प्रतिच्छेद: संबंध';

  @override
  String get symbols => 'चिह्न:';

  @override
  String get matrixHelpSymbols => '✦ = नियत\n◎ = अनियत\n✕ = अनुपस्थित';

  @override
  String get tips => 'सुझाव:';

  @override
  String get matrixHelpTips =>
      '• विवरण के लिए चित्त पर टैप करें\n• संघर्ष देखने के लिए चेतसिक पर टैप करें\n• दृश्य सीमित करने के लिए फ़िल्टर प्रयोग करें\n• अधिक स्थान के लिए घुमाएँ';

  @override
  String get matrixListenCittas => 'सभी चित्त सुनें';

  @override
  String get matrixListenCetasikas => 'सभी चेतसिक सुनें';

  @override
  String get matrixListenFromHint => 'इस मद से सुनने के लिए देर तक दबाए रखें';

  @override
  String get matrixListenHelpBody =>
      'किसी चित्त पंक्ति या चेतसिक कॉलम को देर तक दबाकर उस मद से सुनें। पूरी सूची सुनने के लिए तालिका के कोने में हेडफ़ोन आइकन पर टैप करें।';

  @override
  String get understood => 'समझ गया';

  @override
  String get dataWarningTitle => 'डेटा चेतावनी';

  @override
  String get allFilters => 'सभी';

  @override
  String get defilements => 'क्लेश (Kilesa)';

  @override
  String get kamma => 'कम्म';

  @override
  String get result => 'विपाक';

  @override
  String get conditionsTitle => 'प्रतीत्यसमुत्पाद';

  @override
  String get conditionDetails => 'प्रतित्यसमुत्पाद विवरण:';

  @override
  String get lastConditionDescription =>
      'यह इस जीवन-चक्र की अंतिम विपाक कड़ी है और नई शर्त आरंभ नहीं करती।';

  @override
  String conditionLinkDescription(Object effect, Object explanation) {
    return '• शर्त: $effect\n  व्याख्या: $explanation';
  }

  @override
  String get conditionsTabLinks => '१२ कड़ियाँ';

  @override
  String get conditionsTabPaccaya => '२४ पच्चय';

  @override
  String get paccayaTitle => '२४ पच्चय संबंध (पट्ठान)';

  @override
  String get paccayaIntro =>
      'पच्चय-संगह-विभाग का भाग B: धम्म परस्पर कैसे शर्त बनते हैं। भाग A प्रतित्यसमुत्पाद की १२ कड़ियाँ है।';

  @override
  String get paccayaDefinition => 'परिभाषा';

  @override
  String get paccayaConditioningStates =>
      'शर्त देने वाले धर्म (paccaya-dhamma)';

  @override
  String get paccayaConditionedStates => 'शर्तित धर्म (paccayuppanna)';

  @override
  String get paccayaSubdivisions => 'उपविभाग';

  @override
  String get paccayaInPaticca => 'इन कड़ियों में कार्य करता है';

  @override
  String get paccayaEmpty => 'इस फ़िल्टर से कोई पच्चय नहीं मिला।';

  @override
  String get paccayaSearchHint => 'पच्चय खोजें…';

  @override
  String get paccayaSourceNotice =>
      'स्रोत: Paṭṭhāna (Abhidhamma Piṭaka VII) और Visuddhimagga अध्याय XVII। Pa-Auk ग्रंथों में २४ पच्चय की स्वतंत्र सूची नहीं मिली; शब्दावली वरिष्ठ समीक्षा में है।';

  @override
  String get paccayaSources => 'स्रोत';

  @override
  String paccayaCount(Object count) {
    return '$count पच्चय';
  }

  @override
  String get relatedDhammas => 'संबंधित धर्म';

  @override
  String get paccayaGroupRootObject => 'मूल और आलंबन';

  @override
  String get paccayaGroupContinuity => 'निरंतरता';

  @override
  String get paccayaGroupConascence => 'सहजात और सहारा';

  @override
  String get paccayaGroupTimeRelation => 'उदय क्रम';

  @override
  String get paccayaGroupKammaVipaka => 'कम्म और विपाक';

  @override
  String get paccayaGroupGeneral => 'सामान्य';

  @override
  String get kiepPast => 'पूर्व जीवन';

  @override
  String get kiepPresent => 'यह जीवन';

  @override
  String get kiepFuture => 'भावी जीवन';

  @override
  String get kammaTitle => 'कर्म (Kamma)';

  @override
  String get mindProcessTitle => 'चित्त प्रक्रिया';

  @override
  String get paliLabel => 'पाळि:';

  @override
  String get stopPronunciation => 'उच्चारण रोकें';

  @override
  String get listenPaliPronunciation => 'पाळि उच्चारण सुनें';

  @override
  String get ttsUnavailable => 'इस डिवाइस पर वाक् संश्लेषण समर्थित नहीं है।';

  @override
  String get dragHandleSemantics => 'आकार बदलने के लिए खींचें';

  @override
  String cittaNumber(Object number) {
    return 'चित्त $number';
  }

  @override
  String get doctrine => 'धम्म व्याख्या';

  @override
  String get examples => 'उदाहरण';

  @override
  String fixedCetasikasCount(Object count) {
    return 'अपरिवर्तनीय चेतसिक ($count)';
  }

  @override
  String variableCetasikasCount(Object count) {
    return 'परिवर्तनीय चेतसिक ($count)';
  }

  @override
  String get personalNote => 'व्यक्तिगत टिप्पणी';

  @override
  String get personalNoteHint => 'अपनी टिप्पणी दर्ज करें…';

  @override
  String get wholesome => 'कुशल';

  @override
  String get functional => 'क्रिया';

  @override
  String get pleasantFeeling => 'सुख वेदना (शारीरिक)';

  @override
  String get unpleasantFeeling => 'दुःख वेदना (शारीरिक)';

  @override
  String get neutralFeeling => 'उपेक्षा वेदना';

  @override
  String get joyfulFeeling => 'सोमनस्स वेदना (मानसिक)';

  @override
  String get alwaysAssociated => 'सदैव संयुक्त';

  @override
  String get mayBeAssociated => 'कदाचित संयुक्त';

  @override
  String get fourfoldDefinition =>
      'चतुर्विध लक्षण (लक्षण/कृत्य/उपस्थिति/पदट्ठान)';

  @override
  String get characteristic => 'लक्षण (Lakkhaṇa)';

  @override
  String get functionLabel => 'कृत्य / रस (Rasa)';

  @override
  String get manifestation => 'पच्चुपट्ठान (Paccupaṭṭhāna)';

  @override
  String get proximateCause => 'पदट्ठान / निकट कारण (Padaṭṭhāna)';

  @override
  String get doctrinalConflicts => 'सैद्धांतिक विरोध';

  @override
  String rulesCount(Object count) {
    return '$count नियम';
  }

  @override
  String get universalCetasikas => '7 सर्वचित्तसाधारण';

  @override
  String get occasionalCetasikas => '6 प्रकीर्णक';

  @override
  String get unwholesomeCetasikas => '14 अकुशल';

  @override
  String get beautifulCetasikas => '25 शोभन';

  @override
  String rowCittaSemantics(Object displayIndex, Object name, Object order,
      Object group, Object feeling, Object action) {
    return 'चित्त पंक्ति $displayIndex: $name; विहित संख्या $order; वर्ग $group; वेदना $feeling। $action';
  }

  @override
  String cetasikaSemantics(
      Object name, Object pali, Object group, Object state) {
    return 'चेतसिक $name ($pali), वर्ग $group। $state विवरण के लिए टैप करें।';
  }

  @override
  String get selected => 'चयनित';

  @override
  String get dimmedByConflict => 'संघर्ष के कारण धुंधला';

  @override
  String get matrixCornerSemantics =>
      'मैट्रिक्स कोना: पंक्तियाँ चित्त हैं और स्तंभ चेतसिक';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: चित्त $cittaId चेतसिक $cetasikaId के साथ';
  }

  @override
  String get tapForDetails => 'विवरण के लिए टैप करें';

  @override
  String get studyPath => 'अध्ययन पथ';

  @override
  String get bookmarksAndNotes => 'बुकमार्क और नोट्स';

  @override
  String get overallProgress => 'कुल प्रगति';

  @override
  String savedItemsCount(Object count) {
    return '$count सहेजे गए विषय';
  }

  @override
  String get cittaTab => 'चित्त';

  @override
  String get cetasikaTab => 'चेतसिक';

  @override
  String get notesTab => 'टिप्पणियाँ';

  @override
  String get noBookmarkedCittas => 'कोई बुकमार्क किया गया चित्त नहीं';

  @override
  String get bookmarkCittaHint =>
      'पाठ खोलें और सहेजने के लिए बुकमार्क आइकन पर टैप करें';

  @override
  String get loadingCittas => 'चित्त लोड हो रहे हैं…';

  @override
  String get noBookmarkedCetasikas => 'कोई बुकमार्क किया गया चेतसिक नहीं';

  @override
  String get loadingCetasikas => 'चेतसिक लोड हो रहे हैं…';

  @override
  String get noNotes => 'अभी तक कोई टिप्पणी नहीं';

  @override
  String get addNoteHint =>
      'व्यक्तिगत टिप्पणी जोड़ने के लिए पाठ में संपादन आइकन टैप करें';

  @override
  String get deleteNoteQuestion => 'टिप्पणी हटाएं?';

  @override
  String get deleteNoteWarning =>
      'यह टिप्पणी स्थायी रूप से हटा दी जाएगी। क्या आप सुनिश्चित हैं?';

  @override
  String get addNote => 'टिप्पणी जोड़ें';

  @override
  String get removeBookmark => 'बुकमार्क हटाएं';

  @override
  String get editNote => 'टिप्पणी संपादित करें';

  @override
  String get deleteNote => 'टिप्पणी हटाएं';

  @override
  String get noteUpdated => 'टिप्पणी अद्यतित की गई';

  @override
  String get noteSaved => 'टिप्पणी सहेजी गई';

  @override
  String get editNoteTitle => 'टिप्पणी संपादित करें';

  @override
  String get addNoteTitle => 'टिप्पणी जोड़ें';

  @override
  String get studyNoteHint =>
      'इस विषय पर अपनी टिप्पणी लिखें…\n\nउदाहरण: यह चित्त ध्यान के दौरान तब उत्पन्न होता है जब…';

  @override
  String charactersCount(Object current, Object maximum) {
    return '$current / $maximum वर्ण';
  }

  @override
  String get update => 'अद्यतन करें';

  @override
  String get saveNote => 'टिप्पणी सहेजें';

  @override
  String studyProgressPercent(Object percent) {
    return 'अध्ययन प्रगति: $percent%';
  }

  @override
  String get modulesCompletedShort => 'मॉड्यूल\nपूर्ण';

  @override
  String get recommendedNext => 'अनुशंसित अगला';

  @override
  String get progressOverview => 'प्रगति अवलोकन';

  @override
  String get totalModules => 'कुल मॉड्यूल';

  @override
  String get dueForReview => 'पुनरावलोकन हेतु';

  @override
  String get learnTab => 'सीखें';

  @override
  String get reviewTab => 'दोहराएँ';

  @override
  String get testTab => 'परीक्षा';

  @override
  String get moduleHasNoData =>
      'इस मॉड्यूल में चित्त/चेतसिक डेटा नहीं है। कृपया JSON डेटा जांचें।';

  @override
  String cittasInModule(Object count) {
    return 'इस मॉड्यूल में चित्त — $count';
  }

  @override
  String cetasikasInModule(Object count) {
    return 'इस मॉड्यूल में चेतसिक — $count';
  }

  @override
  String kammasInModule(Object count) {
    return 'कम्म — $count';
  }

  @override
  String paticcasInModule(Object count) {
    return 'प्रतीत्यसमुत्पाद — $count';
  }

  @override
  String rupasInModule(Object count) {
    return 'रूप — $count';
  }

  @override
  String vithisInModule(Object count) {
    return 'चित्त प्रक्रिया — $count';
  }

  @override
  String reviewCetasikaQuestion(Object name, Object pali) {
    return 'चेतसिक “$name” ($pali) का क्या अर्थ है?';
  }

  @override
  String reviewKammaQuestion(Object name, Object pali) {
    return 'कम्म “$name” ($pali) के बारे में क्या याद रखना चाहिए?';
  }

  @override
  String reviewPaticcaQuestion(Object name, Object pali) {
    return 'प्रतीत्यसमुत्पाद की कड़ी “$name” ($pali) के बारे में क्या याद रखना चाहिए?';
  }

  @override
  String reviewRupaQuestion(Object name, Object pali) {
    return 'रूप “$name” ($pali) के बारे में क्या याद रखना चाहिए?';
  }

  @override
  String reviewVithiQuestion(Object name, Object pali) {
    return 'चित्त प्रक्रिया “$name” ($pali) के बारे में क्या याद रखना चाहिए?';
  }

  @override
  String groupAnswer(Object group) {
    return 'वर्ग: $group';
  }

  @override
  String reviewCittaQuestion(Object name) {
    return 'चित्त “$name” किस भूमि और वेदना से युक्त है?';
  }

  @override
  String cittaReviewAnswer(Object sphere, Object feeling, Object pali) {
    return 'भूमि: $sphere\nवेदना: $feeling\nपाळि: $pali';
  }

  @override
  String get noReviewContent =>
      'इस मॉड्यूल में अभी कोई पुनरावलोकन सामग्री नहीं है। कृपया बाद में देखें।';

  @override
  String reviewedCount(Object revealed, Object total) {
    return '$revealed / $total पुनरावलोकित';
  }

  @override
  String get reviewComplete =>
      'आपने पूरी सामग्री का पुनरावलोकन कर लिया है। अपनी समझ जांचने के लिए प्रश्नोत्तरी करें।';

  @override
  String get tapToReveal => 'उत्तर देखने के लिए टैप करें';

  @override
  String answerLabel(Object answer) {
    return 'उत्तर: $answer';
  }

  @override
  String get revealAnswer => 'उत्तर प्रकट करें';

  @override
  String moduleQuizTitle(Object module) {
    return 'प्रश्नोत्तरी\n$module';
  }

  @override
  String moduleContentCount(Object count) {
    return 'इस मॉड्यूल में $count विषय';
  }

  @override
  String get quizMaximumDescription =>
      'इस मॉड्यूल को कवर करने वाले 10 बहुविकल्पीय प्रश्न';

  @override
  String get startQuiz => 'प्रश्नोत्तरी आरंभ करें';

  @override
  String cittasCount(Object count) {
    return '$count चित्त';
  }

  @override
  String cetasikasCount(Object count) {
    return '$count चेतसिक';
  }

  @override
  String noteForItem(Object name) {
    return 'टिप्पणी: $name';
  }

  @override
  String get chooseLevel => 'स्तर चुनें';

  @override
  String quizLevelDescription(Object count) {
    return 'प्रत्येक स्तर इस मॉड्यूल से अधिकतम $count प्रश्न उत्पन्न करता है';
  }

  @override
  String get insufficientQuizData =>
      'इस मॉड्यूल में प्रश्न बनाने के लिए पर्याप्त डेटा नहीं है।';

  @override
  String get explanation => 'व्याख्या';

  @override
  String get nextQuestion => 'अगला प्रश्न';

  @override
  String get viewResults => 'परिणाम देखें';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total सही';
  }

  @override
  String get quizExcellent =>
      'उत्कृष्ट! आपने इस मॉड्यूल में दक्षता प्राप्त कर ली है।';

  @override
  String get quizTryAgain => 'सामग्री की समीक्षा करें और पुनः प्रयास करें।';

  @override
  String get tryAgain => 'फिर प्रयास करें';

  @override
  String quizInsufficientDataMessage(Object module) {
    return 'मॉड्यूल “$module” में प्रश्न बनाने के लिए पर्याप्त डेटा नहीं है।';
  }

  @override
  String get quizTypeCetasikaGroup => 'चेतसिक वर्गीकरण';

  @override
  String get quizTypeFeeling => 'वेदना पहचान';

  @override
  String get quizTypeConflict => 'सैद्धांतिक विरोध';

  @override
  String get quizTypeSphere => 'भूमि / लोक';

  @override
  String get beginner => 'प्रारंभिक';

  @override
  String get beginnerDescription => 'मूल चेतसिक वर्ग और वेदनाएं';

  @override
  String get intermediate => 'मध्यम';

  @override
  String get intermediateDescription => 'चेतसिक विरोध नियम सम्मिलित';

  @override
  String get advanced => 'उन्नत';

  @override
  String get advancedDescription => 'सभी भूमियां और प्रश्न प्रकार सम्मिलित';

  @override
  String get trueLabel => 'सत्य';

  @override
  String get falseLabel => 'असत्य';

  @override
  String get trueOrFalse => 'सत्य या असत्य?';

  @override
  String quizCetasikaGroupQuestion(Object name, Object pali) {
    return '“$name” ($pali) किस वर्ग में आता है?';
  }

  @override
  String quizCetasikaGroupExplanation(
      Object name, Object group, Object description) {
    return '“$name” $group से संबंधित है।\n$description';
  }

  @override
  String quizCetasikaClaim(Object name, Object pali, Object group) {
    return '“$name” ($pali) $group से संबंधित है। सत्य या असत्य?';
  }

  @override
  String quizCittaFeelingQuestion(Object name) {
    return 'चित्त “$name” के साथ कौन सी वेदना होती है?';
  }

  @override
  String quizCittaFeelingExplanation(Object name, Object feeling) {
    return '“$name” में $feeling होती है।';
  }

  @override
  String quizCittaFeelingClaim(Object name, Object feeling) {
    return 'चित्त “$name” में $feeling होती है। सत्य या असत्य?';
  }

  @override
  String get conflictNo => 'नहीं — वे परस्पर विरोधी हैं';

  @override
  String get conflictAlwaysYes => 'हाँ — वे सदैव साथ उत्पन्न होते हैं';

  @override
  String get conflictSometimesYes => 'हाँ — वे कभी-कभी साथ उत्पन्न होते हैं';

  @override
  String quizConflictQuestion(Object first, Object second) {
    return 'क्या “$first” और “$second” एक ही चित्त में साथ उत्पन्न हो सकते हैं?';
  }

  @override
  String quizSphereQuestion(Object name) {
    return 'चित्त “$name” किस भूमि से संबंधित है?';
  }

  @override
  String quizSphereExplanation(Object name, Object sphere) {
    return '“$name” $sphere से संबंधित है।';
  }

  @override
  String quizSphereClaim(Object name, Object sphere) {
    return 'चित्त “$name” $sphere से संबंधित है। सत्य या असत्य?';
  }

  @override
  String get phaseFoundation => 'चरण 1 — आधार';

  @override
  String get phaseCausality => 'चरण 2 — कार्य-कारण';

  @override
  String get phaseMastery => 'चरण 3 — दक्षता';

  @override
  String get contentFallbackNotice =>
      'यह सामग्री अभी अनुवादित नहीं है; अंग्रेज़ी अध्ययन सामग्री दिखाई जा रही है।';

  @override
  String get listenAll => 'पूरा सुनें';

  @override
  String get listeningQueue => 'सुनने की सूची';

  @override
  String get listenFromHere => 'यहाँ से सुनें';

  @override
  String get nowPlaying => 'अभी चल रहा है';

  @override
  String get repeatOff => 'दोहराना बंद';

  @override
  String get repeatOne => 'इसी अनुभाग को दोहराएँ';

  @override
  String get repeatAll => 'पूरी सूची दोहराएँ';

  @override
  String get listenAgain => 'फिर से सुनें';

  @override
  String get playbackSpeed => 'गति';

  @override
  String get resumeListening => 'सुनना जारी रखें';

  @override
  String get minutesShort => 'मिनट';

  @override
  String get playAudio => 'चलाएँ';

  @override
  String get pauseAudio => 'रोकें';

  @override
  String get previousTrack => 'पिछला अनुभाग';

  @override
  String get sleepTimer => 'बंद करने का टाइमर';

  @override
  String get sleepTimerOff => 'बंद';

  @override
  String get sleepTimer15 => '15 मिनट';

  @override
  String get sleepTimer30 => '30 मिनट';

  @override
  String get sleepTimer60 => '60 मिनट';

  @override
  String sleepTimerRemaining(Object minutes) {
    return 'बंद होने में $minutes मिनट';
  }

  @override
  String get audioModelUnavailable =>
      'न्यूरल आवाज़ उपलब्ध नहीं है; डिवाइस की आवाज़ का उपयोग किया जा रहा है';

  @override
  String get realDuration => 'अवधि';

  @override
  String get estimatedDuration => 'अनुमानित अवधि';

  @override
  String get continueListening => 'सुनना जारी रखें';

  @override
  String get audioBackgroundLimit =>
      'पृष्ठभूमि ऑडियो स्थापित वॉइस इंजन पर निर्भर करता है';

  @override
  String get karaokeSettingsTitle => 'श्रवण और हाइलाइटिंग';

  @override
  String get karaokeModeTitle => 'कराओके मोड';

  @override
  String get karaokeModeSubtitle => 'सुनते समय पढ़े जा रहे पाठ को हाइलाइट करें';

  @override
  String get karaokeLineHighlightTitle => 'वर्तमान पंक्ति को हाइलाइट करें';

  @override
  String get karaokeLineHighlightSubtitle => 'पढ़े जा रहे अनुच्छेद को शेड करें';

  @override
  String get karaokeWordHighlightTitle => 'प्रत्येक शब्द को हाइलाइट करें';

  @override
  String get karaokeWordHighlightSubtitle =>
      'बोले जाने पर प्रत्येक शब्द को हाइलाइट करें';

  @override
  String get audioFloatingGoTo => 'चल रहे पाठ पर जाएं';

  @override
  String get audioFloatingHide => 'प्लेयर छिपाएं';

  @override
  String get audioFloatingRestore => 'प्लेयर दिखाएं';

  @override
  String get audioFloatingClose => 'प्लेयर बंद करें';

  @override
  String get playModeTitle => 'सुनने का मोड';

  @override
  String get playModeOnce => 'केवल यही मद';

  @override
  String get playModeSequence => 'क्रम से सुनें';

  @override
  String get playModeOnceHint => 'वर्तमान मद पूरी होने पर रुक जाएगा';

  @override
  String get playModeRepeatOneHint => 'वर्तमान मद को बार-बार दोहराएगा';

  @override
  String get playModeSequenceHint => 'अगली मदों को सुनता रहेगा, सूची के अंत में रुकेगा';

  @override
  String get playModeRepeatAllHint => 'सुनता रहेगा और अंत में शुरू से दोहराएगा';

  @override
  String get audioBubbleExpand => 'प्लेयर फैलाएं';

  @override
  String get audioBubbleCollapse => 'प्लेयर समेटें';

  @override
  String get studyTreeExpandAll => 'सभी फैलाएं';

  @override
  String get studyTreeCollapseAll => 'सभी समेटें';
}
