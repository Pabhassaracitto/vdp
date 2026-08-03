import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_bo.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_km.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_lo.dart';
import 'app_localizations_mn.dart';
import 'app_localizations_mr.dart';
import 'app_localizations_my.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_si.dart';
import 'app_localizations_ta.dart';
import 'app_localizations_te.dart';
import 'app_localizations_th.dart';
import 'app_localizations_vi.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('bo'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('it'),
    Locale('ja'),
    Locale('km'),
    Locale('ko'),
    Locale('lo'),
    Locale('mn'),
    Locale('mr'),
    Locale('my'),
    Locale('pt'),
    Locale('ru'),
    Locale('si'),
    Locale('ta'),
    Locale('te'),
    Locale('th'),
    Locale('vi'),
    Locale('zh'),
    Locale('zh', 'TW')
  ];

  /// appName
  ///
  /// In en, this message translates to:
  /// **'AbhiDhamma'**
  String get appName;

  /// appTagline
  ///
  /// In en, this message translates to:
  /// **'Abhidhamma Piṭaka'**
  String get appTagline;

  /// initializing
  ///
  /// In en, this message translates to:
  /// **'Initializing…'**
  String get initializing;

  /// loadingDoctrineData
  ///
  /// In en, this message translates to:
  /// **'Loading and validating Dhamma data…'**
  String get loadingDoctrineData;

  /// loadingTakingLonger
  ///
  /// In en, this message translates to:
  /// **'Startup is taking longer than expected. Dhamma data may be being optimized for your device.'**
  String get loadingTakingLonger;

  /// unknownError
  ///
  /// In en, this message translates to:
  /// **'Unknown error'**
  String get unknownError;

  /// dataError
  ///
  /// In en, this message translates to:
  /// **'Data error'**
  String get dataError;

  /// invalidData
  ///
  /// In en, this message translates to:
  /// **'Invalid data'**
  String get invalidData;

  /// invalidDataDescription
  ///
  /// In en, this message translates to:
  /// **'The system detected a violation of the Dhamma validation rules. Please contact the editorial team to review the data.'**
  String get invalidDataDescription;

  /// navMatrix
  ///
  /// In en, this message translates to:
  /// **'Matrix'**
  String get navMatrix;

  /// navStudy
  ///
  /// In en, this message translates to:
  /// **'Study'**
  String get navStudy;

  /// navConditions
  ///
  /// In en, this message translates to:
  /// **'Conditions'**
  String get navConditions;

  /// navMindProcess
  ///
  /// In en, this message translates to:
  /// **'Mind Process'**
  String get navMindProcess;

  /// navSettings
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// cancel
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// save
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// delete
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// close
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// start
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// next
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// done
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// skip
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// apply
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// undo
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// reset
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// all
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// hide
  ///
  /// In en, this message translates to:
  /// **'Hide'**
  String get hide;

  /// learn
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learn;

  /// notes
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// errorWithMessage
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String errorWithMessage(Object message);

  /// languageSection
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languageSection;

  /// interfaceLanguage
  ///
  /// In en, this message translates to:
  /// **'Interface language'**
  String get interfaceLanguage;

  /// interfaceLanguageSubtitle
  ///
  /// In en, this message translates to:
  /// **'Follow the device language or choose manually'**
  String get interfaceLanguageSubtitle;

  /// contentLanguage
  ///
  /// In en, this message translates to:
  /// **'Learning content language'**
  String get contentLanguage;

  /// contentLanguageSubtitle
  ///
  /// In en, this message translates to:
  /// **'Independent from the interface language'**
  String get contentLanguageSubtitle;

  /// systemDefault
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemDefault;

  /// systemDefaultSubtitle
  ///
  /// In en, this message translates to:
  /// **'Use the language selected on this device'**
  String get systemDefaultSubtitle;

  /// languagePickerTitle
  ///
  /// In en, this message translates to:
  /// **'Language / Ngôn ngữ'**
  String get languagePickerTitle;

  /// languagePickerSearchHint
  ///
  /// In en, this message translates to:
  /// **'Search by language name or code'**
  String get languagePickerSearchHint;

  /// languageChangePreviewTitle
  ///
  /// In en, this message translates to:
  /// **'Change interface language?'**
  String get languageChangePreviewTitle;

  /// languageChangePreviewBody
  ///
  /// In en, this message translates to:
  /// **'The interface will change to {language}. Learning content remains unchanged.'**
  String languageChangePreviewBody(Object language);

  /// languageChangedTo
  ///
  /// In en, this message translates to:
  /// **'Language changed to {language}'**
  String languageChangedTo(Object language);

  /// holdGlobeToReset
  ///
  /// In en, this message translates to:
  /// **'Press and hold the globe for 3 seconds to restore the system language'**
  String get holdGlobeToReset;

  /// restoredSystemLanguage
  ///
  /// In en, this message translates to:
  /// **'Restored the system language'**
  String get restoredSystemLanguage;

  /// contentVietnamese
  ///
  /// In en, this message translates to:
  /// **'Vietnamese'**
  String get contentVietnamese;

  /// contentEnglish
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get contentEnglish;

  /// translationReviewNotice
  ///
  /// In en, this message translates to:
  /// **'English Dhamma content is an international study translation. Pāḷi terms remain authoritative.'**
  String get translationReviewNotice;

  /// settingsAccessibility
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get settingsAccessibility;

  /// highContrastMode
  ///
  /// In en, this message translates to:
  /// **'High contrast mode'**
  String get highContrastMode;

  /// highContrastSubtitle
  ///
  /// In en, this message translates to:
  /// **'Increase color contrast for people with low vision'**
  String get highContrastSubtitle;

  /// screenReaderHints
  ///
  /// In en, this message translates to:
  /// **'Screen reader hints'**
  String get screenReaderHints;

  /// screenReaderHintsSubtitle
  ///
  /// In en, this message translates to:
  /// **'Provide more detail for TalkBack and VoiceOver'**
  String get screenReaderHintsSubtitle;

  /// textSize
  ///
  /// In en, this message translates to:
  /// **'Text size'**
  String get textSize;

  /// textScale
  ///
  /// In en, this message translates to:
  /// **'Text scale'**
  String get textScale;

  /// studyProgress
  ///
  /// In en, this message translates to:
  /// **'Study progress'**
  String get studyProgress;

  /// unlockAllLessons
  ///
  /// In en, this message translates to:
  /// **'Unlock all lessons'**
  String get unlockAllLessons;

  /// unlockAllLessonsSubtitle
  ///
  /// In en, this message translates to:
  /// **'The guided path builds a strong foundation. Experienced learners can unlock every lesson.'**
  String get unlockAllLessonsSubtitle;

  /// resetProgress
  ///
  /// In en, this message translates to:
  /// **'Reset progress'**
  String get resetProgress;

  /// resetProgressSubtitle
  ///
  /// In en, this message translates to:
  /// **'Delete all study data'**
  String get resetProgressSubtitle;

  /// showDataWarningAgain
  ///
  /// In en, this message translates to:
  /// **'Show data warning again'**
  String get showDataWarningAgain;

  /// showDataWarningAgainSubtitle
  ///
  /// In en, this message translates to:
  /// **'Restore the Matrix warning banner'**
  String get showDataWarningAgainSubtitle;

  /// dataWarningEnabled
  ///
  /// In en, this message translates to:
  /// **'Data warning enabled'**
  String get dataWarningEnabled;

  /// aboutApp
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutApp;

  /// version
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// sourceMaterial
  ///
  /// In en, this message translates to:
  /// **'Source material'**
  String get sourceMaterial;

  /// sourceMaterialValue
  ///
  /// In en, this message translates to:
  /// **'King Milanda A curriculum — Abhidhamma'**
  String get sourceMaterialValue;

  /// editorialPrinciples
  ///
  /// In en, this message translates to:
  /// **'Editorial principles'**
  String get editorialPrinciples;

  /// resetProgressQuestion
  ///
  /// In en, this message translates to:
  /// **'Reset progress?'**
  String get resetProgressQuestion;

  /// resetProgressWarning
  ///
  /// In en, this message translates to:
  /// **'All study progress and quiz scores will be deleted. This action cannot be undone.'**
  String get resetProgressWarning;

  /// progressResetSuccess
  ///
  /// In en, this message translates to:
  /// **'Study progress reset'**
  String get progressResetSuccess;

  /// unlockLessonsQuestion
  ///
  /// In en, this message translates to:
  /// **'Unlock all lessons?'**
  String get unlockLessonsQuestion;

  /// unlockLessonsWarning
  ///
  /// In en, this message translates to:
  /// **'The guided path is the most effective way to build a sound Abhidhamma foundation. This option is intended for experienced learners.'**
  String get unlockLessonsWarning;

  /// keepGuidedPath
  ///
  /// In en, this message translates to:
  /// **'Keep guided path'**
  String get keepGuidedPath;

  /// unlock
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get unlock;

  /// modulesCompleted
  ///
  /// In en, this message translates to:
  /// **'{completed} / {total} modules completed'**
  String modulesCompleted(Object completed, Object total);

  /// mostRecentModule
  ///
  /// In en, this message translates to:
  /// **'Most recent module: {module}'**
  String mostRecentModule(Object module);

  /// lastStudied
  ///
  /// In en, this message translates to:
  /// **'Last studied: {date}'**
  String lastStudied(Object date);

  /// today
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// yesterday
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// daysAgo
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String daysAgo(Object count);

  /// onboardingVisualTitle
  ///
  /// In en, this message translates to:
  /// **'See Clearly'**
  String get onboardingVisualTitle;

  /// onboardingVisualSubtitle
  ///
  /// In en, this message translates to:
  /// **'Citta × Cetasika Matrix'**
  String get onboardingVisualSubtitle;

  /// onboardingVisualBody
  ///
  /// In en, this message translates to:
  /// **'Explore 121 cittas and 52 cetasikas in an interactive matrix. Color, shape, and text encode every association accessibly.'**
  String get onboardingVisualBody;

  /// onboardingCausalityTitle
  ///
  /// In en, this message translates to:
  /// **'Understand Deeply'**
  String get onboardingCausalityTitle;

  /// onboardingCausalitySubtitle
  ///
  /// In en, this message translates to:
  /// **'Dependent Origination'**
  String get onboardingCausalitySubtitle;

  /// onboardingCausalityBody
  ///
  /// In en, this message translates to:
  /// **'Explore the twelve links of dependent origination and classifications of kamma through connected learning views.'**
  String get onboardingCausalityBody;

  /// onboardingExploreTitle
  ///
  /// In en, this message translates to:
  /// **'Discover for Yourself'**
  String get onboardingExploreTitle;

  /// onboardingExploreSubtitle
  ///
  /// In en, this message translates to:
  /// **'A Non-linear Study Path'**
  String get onboardingExploreSubtitle;

  /// onboardingExploreBody
  ///
  /// In en, this message translates to:
  /// **'Choose your path through ten connected modules. Active recall, quizzes, and review help knowledge endure.'**
  String get onboardingExploreBody;

  /// beginExploring
  ///
  /// In en, this message translates to:
  /// **'Begin exploring'**
  String get beginExploring;

  /// matrixTitle
  ///
  /// In en, this message translates to:
  /// **'Abhidhamma Matrix'**
  String get matrixTitle;

  /// matrixSemantics
  ///
  /// In en, this message translates to:
  /// **'Abhidhamma Matrix showing {count} cittas'**
  String matrixSemantics(Object count);

  /// rotateScreen
  ///
  /// In en, this message translates to:
  /// **'Rotate screen'**
  String get rotateScreen;

  /// rotationHint
  ///
  /// In en, this message translates to:
  /// **'If the screen does not rotate, enable Auto-rotate in device settings.'**
  String get rotationHint;

  /// highContrast
  ///
  /// In en, this message translates to:
  /// **'High contrast'**
  String get highContrast;

  /// help
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help;

  /// searchCittaCetasika
  ///
  /// In en, this message translates to:
  /// **'Search citta or cetasika…'**
  String get searchCittaCetasika;

  /// clearSearch
  ///
  /// In en, this message translates to:
  /// **'Clear search'**
  String get clearSearch;

  /// citta
  ///
  /// In en, this message translates to:
  /// **'Citta'**
  String get citta;

  /// cetasika
  ///
  /// In en, this message translates to:
  /// **'Cetasika'**
  String get cetasika;

  /// unwholesome
  ///
  /// In en, this message translates to:
  /// **'Unwholesome'**
  String get unwholesome;

  /// rootless
  ///
  /// In en, this message translates to:
  /// **'Rootless'**
  String get rootless;

  /// senseSphereBeautiful
  ///
  /// In en, this message translates to:
  /// **'Sense-sphere beautiful'**
  String get senseSphereBeautiful;

  /// formSphere
  ///
  /// In en, this message translates to:
  /// **'Form sphere'**
  String get formSphere;

  /// formlessSphere
  ///
  /// In en, this message translates to:
  /// **'Formless sphere'**
  String get formlessSphere;

  /// supramundane
  ///
  /// In en, this message translates to:
  /// **'Supramundane'**
  String get supramundane;

  /// legend
  ///
  /// In en, this message translates to:
  /// **'Legend:'**
  String get legend;

  /// associationAlways
  ///
  /// In en, this message translates to:
  /// **'Invariable'**
  String get associationAlways;

  /// associationSometimes
  ///
  /// In en, this message translates to:
  /// **'Variable'**
  String get associationSometimes;

  /// associationNever
  ///
  /// In en, this message translates to:
  /// **'Absent'**
  String get associationNever;

  /// dataWarningsCount
  ///
  /// In en, this message translates to:
  /// **'{count} data warnings'**
  String dataWarningsCount(Object count);

  /// matrixHelpTitle
  ///
  /// In en, this message translates to:
  /// **'Matrix guide'**
  String get matrixHelpTitle;

  /// howToRead
  ///
  /// In en, this message translates to:
  /// **'How to read:'**
  String get howToRead;

  /// matrixHelpRead
  ///
  /// In en, this message translates to:
  /// **'• Rows: Citta\n• Columns: Cetasika\n• Intersections: association'**
  String get matrixHelpRead;

  /// symbols
  ///
  /// In en, this message translates to:
  /// **'Symbols:'**
  String get symbols;

  /// matrixHelpSymbols
  ///
  /// In en, this message translates to:
  /// **'✦ = Invariable\n◎ = Variable\n✕ = Absent'**
  String get matrixHelpSymbols;

  /// tips
  ///
  /// In en, this message translates to:
  /// **'Tips:'**
  String get tips;

  /// matrixHelpTips
  ///
  /// In en, this message translates to:
  /// **'• Tap a citta for details\n• Tap a cetasika for conflicts\n• Use filters to narrow the view\n• Rotate for more space'**
  String get matrixHelpTips;

  /// understood
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get understood;

  /// dataWarningTitle
  ///
  /// In en, this message translates to:
  /// **'Data warning'**
  String get dataWarningTitle;

  /// allFilters
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allFilters;

  /// defilements
  ///
  /// In en, this message translates to:
  /// **'Defilements'**
  String get defilements;

  /// kamma
  ///
  /// In en, this message translates to:
  /// **'Kamma'**
  String get kamma;

  /// result
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result;

  /// conditionsTitle
  ///
  /// In en, this message translates to:
  /// **'Dependent Origination'**
  String get conditionsTitle;

  /// conditionDetails
  ///
  /// In en, this message translates to:
  /// **'Dependent-origination details:'**
  String get conditionDetails;

  /// lastConditionDescription
  ///
  /// In en, this message translates to:
  /// **'This is the final resultant link in this life-cycle and starts no new condition.'**
  String get lastConditionDescription;

  /// conditionLinkDescription
  ///
  /// In en, this message translates to:
  /// **'• Conditions: {effect}\n  Explanation: {explanation}'**
  String conditionLinkDescription(Object effect, Object explanation);

  /// kammaTitle
  ///
  /// In en, this message translates to:
  /// **'Kamma'**
  String get kammaTitle;

  /// mindProcessTitle
  ///
  /// In en, this message translates to:
  /// **'Mind Process'**
  String get mindProcessTitle;

  /// paliLabel
  ///
  /// In en, this message translates to:
  /// **'Pāḷi:'**
  String get paliLabel;

  /// stopPronunciation
  ///
  /// In en, this message translates to:
  /// **'Stop pronunciation'**
  String get stopPronunciation;

  /// listenPaliPronunciation
  ///
  /// In en, this message translates to:
  /// **'Listen to Pāḷi pronunciation'**
  String get listenPaliPronunciation;

  /// ttsUnavailable
  ///
  /// In en, this message translates to:
  /// **'Speech synthesis is not supported on this device.'**
  String get ttsUnavailable;

  /// dragHandleSemantics
  ///
  /// In en, this message translates to:
  /// **'Drag to resize'**
  String get dragHandleSemantics;

  /// cittaNumber
  ///
  /// In en, this message translates to:
  /// **'Citta {number}'**
  String cittaNumber(Object number);

  /// doctrine
  ///
  /// In en, this message translates to:
  /// **'Dhamma explanation'**
  String get doctrine;

  /// examples
  ///
  /// In en, this message translates to:
  /// **'Examples'**
  String get examples;

  /// fixedCetasikasCount
  ///
  /// In en, this message translates to:
  /// **'Invariable cetasikas ({count})'**
  String fixedCetasikasCount(Object count);

  /// variableCetasikasCount
  ///
  /// In en, this message translates to:
  /// **'Variable cetasikas ({count})'**
  String variableCetasikasCount(Object count);

  /// personalNote
  ///
  /// In en, this message translates to:
  /// **'Personal note'**
  String get personalNote;

  /// personalNoteHint
  ///
  /// In en, this message translates to:
  /// **'Enter your note…'**
  String get personalNoteHint;

  /// wholesome
  ///
  /// In en, this message translates to:
  /// **'Wholesome'**
  String get wholesome;

  /// functional
  ///
  /// In en, this message translates to:
  /// **'Functional'**
  String get functional;

  /// pleasantFeeling
  ///
  /// In en, this message translates to:
  /// **'Pleasant bodily feeling'**
  String get pleasantFeeling;

  /// unpleasantFeeling
  ///
  /// In en, this message translates to:
  /// **'Painful bodily feeling'**
  String get unpleasantFeeling;

  /// neutralFeeling
  ///
  /// In en, this message translates to:
  /// **'Equanimous feeling'**
  String get neutralFeeling;

  /// joyfulFeeling
  ///
  /// In en, this message translates to:
  /// **'Joyful feeling'**
  String get joyfulFeeling;

  /// alwaysAssociated
  ///
  /// In en, this message translates to:
  /// **'Always associated'**
  String get alwaysAssociated;

  /// mayBeAssociated
  ///
  /// In en, this message translates to:
  /// **'May be associated'**
  String get mayBeAssociated;

  /// fourfoldDefinition
  ///
  /// In en, this message translates to:
  /// **'Fourfold definition'**
  String get fourfoldDefinition;

  /// characteristic
  ///
  /// In en, this message translates to:
  /// **'Characteristic'**
  String get characteristic;

  /// functionLabel
  ///
  /// In en, this message translates to:
  /// **'Function'**
  String get functionLabel;

  /// manifestation
  ///
  /// In en, this message translates to:
  /// **'Manifestation'**
  String get manifestation;

  /// proximateCause
  ///
  /// In en, this message translates to:
  /// **'Proximate cause'**
  String get proximateCause;

  /// doctrinalConflicts
  ///
  /// In en, this message translates to:
  /// **'Doctrinal conflicts'**
  String get doctrinalConflicts;

  /// rulesCount
  ///
  /// In en, this message translates to:
  /// **'{count} rules'**
  String rulesCount(Object count);

  /// universalCetasikas
  ///
  /// In en, this message translates to:
  /// **'7 universals'**
  String get universalCetasikas;

  /// occasionalCetasikas
  ///
  /// In en, this message translates to:
  /// **'6 occasionals'**
  String get occasionalCetasikas;

  /// unwholesomeCetasikas
  ///
  /// In en, this message translates to:
  /// **'14 unwholesome'**
  String get unwholesomeCetasikas;

  /// beautifulCetasikas
  ///
  /// In en, this message translates to:
  /// **'25 beautiful'**
  String get beautifulCetasikas;

  /// rowCittaSemantics
  ///
  /// In en, this message translates to:
  /// **'Citta row {displayIndex}: {name}; canonical number {order}; group {group}; feeling {feeling}. {action}'**
  String rowCittaSemantics(Object displayIndex, Object name, Object order,
      Object group, Object feeling, Object action);

  /// cetasikaSemantics
  ///
  /// In en, this message translates to:
  /// **'Cetasika {name} ({pali}), group {group}. {state} Tap for details.'**
  String cetasikaSemantics(
      Object name, Object pali, Object group, Object state);

  /// selected
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get selected;

  /// dimmedByConflict
  ///
  /// In en, this message translates to:
  /// **'Dimmed because of a conflict'**
  String get dimmedByConflict;

  /// matrixCornerSemantics
  ///
  /// In en, this message translates to:
  /// **'Matrix corner: rows are cittas and columns are cetasikas'**
  String get matrixCornerSemantics;

  /// associationSemantics
  ///
  /// In en, this message translates to:
  /// **'{association}: citta {cittaId} with cetasika {cetasikaId}'**
  String associationSemantics(
      Object association, Object cittaId, Object cetasikaId);

  /// tapForDetails
  ///
  /// In en, this message translates to:
  /// **'Tap for details'**
  String get tapForDetails;

  /// studyPath
  ///
  /// In en, this message translates to:
  /// **'Study Path'**
  String get studyPath;

  /// bookmarksAndNotes
  ///
  /// In en, this message translates to:
  /// **'Bookmarks & Notes'**
  String get bookmarksAndNotes;

  /// overallProgress
  ///
  /// In en, this message translates to:
  /// **'Overall progress'**
  String get overallProgress;

  /// savedItemsCount
  ///
  /// In en, this message translates to:
  /// **'{count} saved items'**
  String savedItemsCount(Object count);

  /// cittaTab
  ///
  /// In en, this message translates to:
  /// **'Cittas'**
  String get cittaTab;

  /// cetasikaTab
  ///
  /// In en, this message translates to:
  /// **'Cetasikas'**
  String get cetasikaTab;

  /// notesTab
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notesTab;

  /// noBookmarkedCittas
  ///
  /// In en, this message translates to:
  /// **'No bookmarked cittas'**
  String get noBookmarkedCittas;

  /// bookmarkCittaHint
  ///
  /// In en, this message translates to:
  /// **'Open a lesson and tap the bookmark icon to save one'**
  String get bookmarkCittaHint;

  /// loadingCittas
  ///
  /// In en, this message translates to:
  /// **'Loading cittas…'**
  String get loadingCittas;

  /// noBookmarkedCetasikas
  ///
  /// In en, this message translates to:
  /// **'No bookmarked cetasikas'**
  String get noBookmarkedCetasikas;

  /// loadingCetasikas
  ///
  /// In en, this message translates to:
  /// **'Loading cetasikas…'**
  String get loadingCetasikas;

  /// noNotes
  ///
  /// In en, this message translates to:
  /// **'No notes yet'**
  String get noNotes;

  /// addNoteHint
  ///
  /// In en, this message translates to:
  /// **'Tap the edit icon in a lesson to add a personal note'**
  String get addNoteHint;

  /// deleteNoteQuestion
  ///
  /// In en, this message translates to:
  /// **'Delete note?'**
  String get deleteNoteQuestion;

  /// deleteNoteWarning
  ///
  /// In en, this message translates to:
  /// **'This note will be permanently deleted. Are you sure?'**
  String get deleteNoteWarning;

  /// addNote
  ///
  /// In en, this message translates to:
  /// **'Add note'**
  String get addNote;

  /// removeBookmark
  ///
  /// In en, this message translates to:
  /// **'Remove bookmark'**
  String get removeBookmark;

  /// editNote
  ///
  /// In en, this message translates to:
  /// **'Edit note'**
  String get editNote;

  /// deleteNote
  ///
  /// In en, this message translates to:
  /// **'Delete note'**
  String get deleteNote;

  /// noteUpdated
  ///
  /// In en, this message translates to:
  /// **'Note updated'**
  String get noteUpdated;

  /// noteSaved
  ///
  /// In en, this message translates to:
  /// **'Note saved'**
  String get noteSaved;

  /// editNoteTitle
  ///
  /// In en, this message translates to:
  /// **'Edit note'**
  String get editNoteTitle;

  /// addNoteTitle
  ///
  /// In en, this message translates to:
  /// **'Add note'**
  String get addNoteTitle;

  /// studyNoteHint
  ///
  /// In en, this message translates to:
  /// **'Write your note about this item…\n\nExample: this citta appears during meditation when…'**
  String get studyNoteHint;

  /// charactersCount
  ///
  /// In en, this message translates to:
  /// **'{current} / {maximum} characters'**
  String charactersCount(Object current, Object maximum);

  /// update
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// saveNote
  ///
  /// In en, this message translates to:
  /// **'Save note'**
  String get saveNote;

  /// studyProgressPercent
  ///
  /// In en, this message translates to:
  /// **'Study progress: {percent}%'**
  String studyProgressPercent(Object percent);

  /// modulesCompletedShort
  ///
  /// In en, this message translates to:
  /// **'Modules\ncompleted'**
  String get modulesCompletedShort;

  /// recommendedNext
  ///
  /// In en, this message translates to:
  /// **'Recommended next'**
  String get recommendedNext;

  /// progressOverview
  ///
  /// In en, this message translates to:
  /// **'Progress overview'**
  String get progressOverview;

  /// totalModules
  ///
  /// In en, this message translates to:
  /// **'Total modules'**
  String get totalModules;

  /// dueForReview
  ///
  /// In en, this message translates to:
  /// **'Due for review'**
  String get dueForReview;

  /// learnTab
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learnTab;

  /// reviewTab
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get reviewTab;

  /// testTab
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get testTab;

  /// moduleHasNoData
  ///
  /// In en, this message translates to:
  /// **'This module has no citta/cetasika data. Please check the JSON data.'**
  String get moduleHasNoData;

  /// cittasInModule
  ///
  /// In en, this message translates to:
  /// **'Cittas in this module — {count}'**
  String cittasInModule(Object count);

  /// cetasikasInModule
  ///
  /// In en, this message translates to:
  /// **'Cetasikas in this module — {count}'**
  String cetasikasInModule(Object count);

  /// reviewCetasikaQuestion
  ///
  /// In en, this message translates to:
  /// **'What does cetasika “{name}” ({pali}) mean?'**
  String reviewCetasikaQuestion(Object name, Object pali);

  /// groupAnswer
  ///
  /// In en, this message translates to:
  /// **'Group: {group}'**
  String groupAnswer(Object group);

  /// reviewCittaQuestion
  ///
  /// In en, this message translates to:
  /// **'Which group and feeling does citta “{name}” have?'**
  String reviewCittaQuestion(Object name);

  /// cittaReviewAnswer
  ///
  /// In en, this message translates to:
  /// **'Sphere: {sphere}\nFeeling: {feeling}\nPāḷi: {pali}'**
  String cittaReviewAnswer(Object sphere, Object feeling, Object pali);

  /// noReviewContent
  ///
  /// In en, this message translates to:
  /// **'This module has no review content yet. Please come back later.'**
  String get noReviewContent;

  /// reviewedCount
  ///
  /// In en, this message translates to:
  /// **'{revealed} / {total} reviewed'**
  String reviewedCount(Object revealed, Object total);

  /// reviewComplete
  ///
  /// In en, this message translates to:
  /// **'You reviewed all the content. Take the quiz to check your understanding.'**
  String get reviewComplete;

  /// tapToReveal
  ///
  /// In en, this message translates to:
  /// **'Tap to reveal the answer'**
  String get tapToReveal;

  /// answerLabel
  ///
  /// In en, this message translates to:
  /// **'Answer: {answer}'**
  String answerLabel(Object answer);

  /// revealAnswer
  ///
  /// In en, this message translates to:
  /// **'Reveal answer'**
  String get revealAnswer;

  /// moduleQuizTitle
  ///
  /// In en, this message translates to:
  /// **'Quiz\n{module}'**
  String moduleQuizTitle(Object module);

  /// moduleContentCount
  ///
  /// In en, this message translates to:
  /// **'{count} items in this module'**
  String moduleContentCount(Object count);

  /// quizMaximumDescription
  ///
  /// In en, this message translates to:
  /// **'Up to 10 multiple-choice questions covering this module'**
  String get quizMaximumDescription;

  /// startQuiz
  ///
  /// In en, this message translates to:
  /// **'Start quiz'**
  String get startQuiz;

  /// cittasCount
  ///
  /// In en, this message translates to:
  /// **'{count} cittas'**
  String cittasCount(Object count);

  /// cetasikasCount
  ///
  /// In en, this message translates to:
  /// **'{count} cetasikas'**
  String cetasikasCount(Object count);

  /// noteForItem
  ///
  /// In en, this message translates to:
  /// **'Note: {name}'**
  String noteForItem(Object name);

  /// chooseLevel
  ///
  /// In en, this message translates to:
  /// **'Choose a level'**
  String get chooseLevel;

  /// quizLevelDescription
  ///
  /// In en, this message translates to:
  /// **'Each level generates up to {count} questions from this module'**
  String quizLevelDescription(Object count);

  /// insufficientQuizData
  ///
  /// In en, this message translates to:
  /// **'This module does not have enough data to create questions.'**
  String get insufficientQuizData;

  /// explanation
  ///
  /// In en, this message translates to:
  /// **'Explanation'**
  String get explanation;

  /// nextQuestion
  ///
  /// In en, this message translates to:
  /// **'Next question'**
  String get nextQuestion;

  /// viewResults
  ///
  /// In en, this message translates to:
  /// **'View results'**
  String get viewResults;

  /// correctAnswers
  ///
  /// In en, this message translates to:
  /// **'{score} / {total} correct'**
  String correctAnswers(Object score, Object total);

  /// quizExcellent
  ///
  /// In en, this message translates to:
  /// **'Excellent! You have mastered this module.'**
  String get quizExcellent;

  /// quizTryAgain
  ///
  /// In en, this message translates to:
  /// **'Review the material and try again.'**
  String get quizTryAgain;

  /// tryAgain
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// quizInsufficientDataMessage
  ///
  /// In en, this message translates to:
  /// **'Module “{module}” does not have enough data to create questions.'**
  String quizInsufficientDataMessage(Object module);

  /// quizTypeCetasikaGroup
  ///
  /// In en, this message translates to:
  /// **'Cetasika classification'**
  String get quizTypeCetasikaGroup;

  /// quizTypeFeeling
  ///
  /// In en, this message translates to:
  /// **'Feeling recognition'**
  String get quizTypeFeeling;

  /// quizTypeConflict
  ///
  /// In en, this message translates to:
  /// **'Doctrinal conflict'**
  String get quizTypeConflict;

  /// quizTypeSphere
  ///
  /// In en, this message translates to:
  /// **'Sphere'**
  String get quizTypeSphere;

  /// beginner
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// beginnerDescription
  ///
  /// In en, this message translates to:
  /// **'Basic cetasika groups and feelings'**
  String get beginnerDescription;

  /// intermediate
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get intermediate;

  /// intermediateDescription
  ///
  /// In en, this message translates to:
  /// **'Includes cetasika conflicts'**
  String get intermediateDescription;

  /// advanced
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get advanced;

  /// advancedDescription
  ///
  /// In en, this message translates to:
  /// **'Includes spheres and all question types'**
  String get advancedDescription;

  /// trueLabel
  ///
  /// In en, this message translates to:
  /// **'True'**
  String get trueLabel;

  /// falseLabel
  ///
  /// In en, this message translates to:
  /// **'False'**
  String get falseLabel;

  /// trueOrFalse
  ///
  /// In en, this message translates to:
  /// **'True or false?'**
  String get trueOrFalse;

  /// quizCetasikaGroupQuestion
  ///
  /// In en, this message translates to:
  /// **'Which group contains “{name}” ({pali})?'**
  String quizCetasikaGroupQuestion(Object name, Object pali);

  /// quizCetasikaGroupExplanation
  ///
  /// In en, this message translates to:
  /// **'“{name}” belongs to {group}.\n{description}'**
  String quizCetasikaGroupExplanation(
      Object name, Object group, Object description);

  /// quizCetasikaClaim
  ///
  /// In en, this message translates to:
  /// **'“{name}” ({pali}) belongs to {group}. True or false?'**
  String quizCetasikaClaim(Object name, Object pali, Object group);

  /// quizCittaFeelingQuestion
  ///
  /// In en, this message translates to:
  /// **'What feeling accompanies citta “{name}”?'**
  String quizCittaFeelingQuestion(Object name);

  /// quizCittaFeelingExplanation
  ///
  /// In en, this message translates to:
  /// **'“{name}” has {feeling}.'**
  String quizCittaFeelingExplanation(Object name, Object feeling);

  /// quizCittaFeelingClaim
  ///
  /// In en, this message translates to:
  /// **'Citta “{name}” has {feeling}. True or false?'**
  String quizCittaFeelingClaim(Object name, Object feeling);

  /// conflictNo
  ///
  /// In en, this message translates to:
  /// **'No — they conflict'**
  String get conflictNo;

  /// conflictAlwaysYes
  ///
  /// In en, this message translates to:
  /// **'Yes — they always arise together'**
  String get conflictAlwaysYes;

  /// conflictSometimesYes
  ///
  /// In en, this message translates to:
  /// **'Yes — they sometimes arise together'**
  String get conflictSometimesYes;

  /// quizConflictQuestion
  ///
  /// In en, this message translates to:
  /// **'Can “{first}” and “{second}” arise together in one citta?'**
  String quizConflictQuestion(Object first, Object second);

  /// quizSphereQuestion
  ///
  /// In en, this message translates to:
  /// **'To which sphere does citta “{name}” belong?'**
  String quizSphereQuestion(Object name);

  /// quizSphereExplanation
  ///
  /// In en, this message translates to:
  /// **'“{name}” belongs to {sphere}.'**
  String quizSphereExplanation(Object name, Object sphere);

  /// quizSphereClaim
  ///
  /// In en, this message translates to:
  /// **'Citta “{name}” belongs to {sphere}. True or false?'**
  String quizSphereClaim(Object name, Object sphere);

  /// phaseFoundation
  ///
  /// In en, this message translates to:
  /// **'Phase 1 — Foundation'**
  String get phaseFoundation;

  /// phaseCausality
  ///
  /// In en, this message translates to:
  /// **'Phase 2 — Causality'**
  String get phaseCausality;

  /// phaseMastery
  ///
  /// In en, this message translates to:
  /// **'Phase 3 — Mastery'**
  String get phaseMastery;

  /// contentFallbackNotice
  ///
  /// In en, this message translates to:
  /// **'This item is not translated yet; showing the English study text.'**
  String get contentFallbackNotice;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'bn',
        'bo',
        'de',
        'en',
        'es',
        'fr',
        'hi',
        'id',
        'it',
        'ja',
        'km',
        'ko',
        'lo',
        'mn',
        'mr',
        'my',
        'pt',
        'ru',
        'si',
        'ta',
        'te',
        'th',
        'vi',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'TW':
            return AppLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'bo':
      return AppLocalizationsBo();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'km':
      return AppLocalizationsKm();
    case 'ko':
      return AppLocalizationsKo();
    case 'lo':
      return AppLocalizationsLo();
    case 'mn':
      return AppLocalizationsMn();
    case 'mr':
      return AppLocalizationsMr();
    case 'my':
      return AppLocalizationsMy();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'si':
      return AppLocalizationsSi();
    case 'ta':
      return AppLocalizationsTa();
    case 'te':
      return AppLocalizationsTe();
    case 'th':
      return AppLocalizationsTh();
    case 'vi':
      return AppLocalizationsVi();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
