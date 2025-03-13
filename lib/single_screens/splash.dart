import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:task_manager/core/constants/assets.dart';

import '../core/configs/routes/pages_routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    final bool firstLaunch =
        Hive.box("settings").get('first_launch', defaultValue: true);

    Timer(const Duration(seconds: 4), () {
      firstLaunch
          ? Navigator.pushReplacementNamed(context, PagesRoutes.onBoarding)
          : FirebaseAuth.instance.currentUser != null
              ? Navigator.pushReplacementNamed(context, PagesRoutes.mainLayout)
              : Navigator.pushReplacementNamed(context, PagesRoutes.login);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image.asset(height: 150.h, width: 150.w, MyAssets.logo)),
    );
  }
}
