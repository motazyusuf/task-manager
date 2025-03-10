import 'package:flutter/material.dart';
import 'package:task_manager/core/configs/routes/pages_routes.dart';

import '../../../features/auth/presentation/pages/login_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.splash:
        return MaterialPageRoute(
            builder: (context) => const Placeholder(), settings: settings);
      case PagesRoutes.login:
        return MaterialPageRoute(
            builder: (context) => LoginScreen(), settings: settings);

      default:
        return MaterialPageRoute(builder: (context) => const Placeholder()
            // builder: (context) => SplashView()
            );
    }
  }
}
