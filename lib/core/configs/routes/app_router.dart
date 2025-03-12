import 'package:flutter/material.dart';
import 'package:task_manager/core/configs/routes/pages_routes.dart';
import 'package:task_manager/main_layout.dart';
import 'package:task_manager/on_boarding.dart';
import 'package:task_manager/splash.dart';

import '../../../features/auth/presentation/pages/login_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.splash:
        return MaterialPageRoute(
            builder: (context) => const SplashView(), settings: settings);
      case PagesRoutes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => OnBoarding(), settings: settings);
      case PagesRoutes.login:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(), settings: settings);
      case PagesRoutes.mainLayout:
        return MaterialPageRoute(
            builder: (context) => MainLayout(), settings: settings);

      default:
        return MaterialPageRoute(builder: (context) => const Placeholder()
            // builder: (context) => SplashView()
            );
    }
  }
}
