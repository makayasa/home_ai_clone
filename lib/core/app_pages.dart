import 'package:flutter/material.dart';
import 'package:home_ai_clone/core/app_routes.dart';
import 'package:home_ai_clone/features/onboarding/presentation/onboarding_page.dart';

import '../features/home/home_page.dart';

abstract final class AppPages {
  static const String initialRoute = AppRoutes.home;

  static final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    AppRoutes.onboarding: (BuildContext context) => const OnboardingPage(),
    AppRoutes.home: (BuildContext context) => const HomePage(),
  };
}
