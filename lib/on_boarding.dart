import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_manager/core/configs/routes/pages_routes.dart';
import 'package:task_manager/core/configs/theme/text_theme.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Welcome to the App!",
                style: MyTextStyle.onBackgroundBold24,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Hive.box("settings").put('first_launch', false);
                Navigator.pushNamedAndRemoveUntil(
                    context, PagesRoutes.login, (_) => false);
              },
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
