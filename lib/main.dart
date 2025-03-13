import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/configs/routes/app_router.dart';
import 'core/configs/routes/pages_routes.dart';
import 'core/configs/theme/app_theme.dart';
import 'core/services/my_functions.dart';

Future<void> main() async {
  await MyFunctions.appSetup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: AppTheme.appTheme,
        initialRoute: PagesRoutes.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
