// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appName => 'AbhiDhamma';

  @override
  String get appTagline => 'Abhidhamma Piṭaka';

  @override
  String get initializing => 'आरंभ हो रहा है…';

  @override
  String get loadingDoctrineData => 'धम्म डेटा लोड और सत्यापित हो रहा है…';

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
    return 'Error: $message';
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
      'Press and hold the globe for 3 seconds to restore the system language';

  @override
  String get restoredSystemLanguage => 'सिस्टम भाषा बहाल की गई';

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
  String get textScale => 'अक्षर माप';

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
  String get matrixTitle => 'अभिधम्म मैट्रिक्स';

  @override
  String matrixSemantics(Object count) {
    return 'Abhidhamma Matrix showing $count cittas';
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
  String get clearSearch => 'Clear search';

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
    return '$count data warnings';
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
  String get understood => 'समझ गया';

  @override
  String get dataWarningTitle => 'Data warning';

  @override
  String get allFilters => 'सभी';

  @override
  String get defilements => 'Defilements';

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
  String get relatedDhammas => 'Related dhammas';

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
  String get kammaTitle => 'Kamma';

  @override
  String get mindProcessTitle => 'चित्त प्रक्रिया';

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
  String get selected => 'चयनित';

  @override
  String get dimmedByConflict => 'संघर्ष के कारण धुंधला';

  @override
  String get matrixCornerSemantics =>
      'Matrix corner: rows are cittas and columns are cetasikas';

  @override
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId) {
    return '$association: citta $cittaId with cetasika $cetasikaId';
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
  String get learnTab => 'सीखें';

  @override
  String get reviewTab => 'दोहराएँ';

  @override
  String get testTab => 'परीक्षा';

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
    return 'What does cetasika “$name” ($pali) mean?';
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
  String get chooseLevel => 'स्तर चुनें';

  @override
  String quizLevelDescription(Object count) {
    return 'Each level generates up to $count questions from this module';
  }

  @override
  String get insufficientQuizData =>
      'This module does not have enough data to create questions.';

  @override
  String get explanation => 'व्याख्या';

  @override
  String get nextQuestion => 'अगला प्रश्न';

  @override
  String get viewResults => 'परिणाम देखें';

  @override
  String correctAnswers(Object score, Object total) {
    return '$score / $total correct';
  }

  @override
  String get quizExcellent => 'Excellent! You have mastered this module.';

  @override
  String get quizTryAgain => 'Review the material and try again.';

  @override
  String get tryAgain => 'फिर प्रयास करें';

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
  String get beginner => 'प्रारंभिक';

  @override
  String get beginnerDescription => 'Basic cetasika groups and feelings';

  @override
  String get intermediate => 'मध्यम';

  @override
  String get intermediateDescription => 'Includes cetasika conflicts';

  @override
  String get advanced => 'उन्नत';

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
  String get contentFallbackNotice => 'यह सामग्री अभी अनुवादित नहीं है; अंग्रेज़ी अध्ययन सामग्री दिखाई जा रही है।';

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
  String get continueListening => 'Continue listening';

  @override
  String get sleepTimer => 'बंद करने का टाइमर';

  @override
  String get sleepTimerOff => 'बंद';

  @override
  String get minutesShort => 'मिनट';

  @override
  String get playAudio => 'चलाएँ';

  @override
  String get pauseAudio => 'रोकें';

  @override
  String get previousTrack => 'पिछला अनुभाग';
}
