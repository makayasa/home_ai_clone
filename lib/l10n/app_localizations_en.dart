// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Homify AI';

  @override
  String get onboardingWelcomeTitle => 'Welcome to Homify AI';

  @override
  String get onboardingWelcomeSubtitle => 'Your Home, Powered by Intelligence.';

  @override
  String get onboardingInteriorTitle => 'Interior Design';

  @override
  String get onboardingInteriorSubtitle => 'Redesign your space instantly';

  @override
  String get onboardingLandscapeTitle => 'Landscape Design';

  @override
  String get onboardingLandscapeSubtitle => 'Refresh your garden with AI';

  @override
  String get ctaGetStarted => 'Get Started';

  @override
  String get ctaContinue => 'Continue';

  @override
  String get onboardingCompleted => 'Onboarding completed';
}
