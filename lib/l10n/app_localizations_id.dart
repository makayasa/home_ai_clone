// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Homify AI';

  @override
  String get onboardingWelcomeTitle => 'Selamat datang di Homify AI';

  @override
  String get onboardingWelcomeSubtitle =>
      'Rumah Anda, didukung oleh kecerdasan.';

  @override
  String get onboardingInteriorTitle => 'Desain Interior';

  @override
  String get onboardingInteriorSubtitle => 'Ubah ruang Anda seketika';

  @override
  String get onboardingLandscapeTitle => 'Desain Lanskap';

  @override
  String get onboardingLandscapeSubtitle => 'Segarkan taman Anda dengan AI';

  @override
  String get ctaGetStarted => 'Mulai';

  @override
  String get ctaContinue => 'Lanjut';

  @override
  String get onboardingCompleted => 'Onboarding selesai';
}
