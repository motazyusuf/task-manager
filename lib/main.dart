import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_manager/core/services/notification.dart';
import 'package:task_manager/features/tasks/data/repositories/task_type_adapter.dart';

import 'core/configs/routes/app_router.dart';
import 'core/configs/routes/pages_routes.dart';
import 'core/configs/theme/app_theme.dart';
import 'core/services/bloc_observer.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await FirebaseApi().fcmNotifications();

  FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  Hive.registerAdapter(TaskTypeAdapter());
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

Future<void> _backgroundHandler(RemoteMessage message) async {
  Firebase.initializeApp();
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
        initialRoute: PagesRoutes.login,
        onGenerateRoute: AppRouter.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

