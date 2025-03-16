import 'package:flutter/material.dart';
import 'package:task_manager/core/configs/routes/pages_routes.dart';
import 'package:task_manager/single_screens/splash.dart';

import '../../../features/auth/presentation/pages/login_screen.dart';
import '../../../single_screens/main_layout.dart';
import '../../../single_screens/on_boarding.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.splash:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
      case PagesRoutes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoarding(), settings: settings);
      case PagesRoutes.login:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(), settings: settings);
      case PagesRoutes.mainLayout:
        return MaterialPageRoute(
            builder: (context) => const MainLayout(), settings: settings);
      default:
        return MaterialPageRoute(builder: (context) => const Placeholder()
            );
    }
  }
}
