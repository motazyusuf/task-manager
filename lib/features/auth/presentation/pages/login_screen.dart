import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/constants/constants.dart';

import '../../../../core/configs/theme/text_theme.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/services/my_functions.dart';
import '../../../../core/widgets/space.dart';
import '../../data/repositories/auth_repository.dart';
import '../widgets/additional_login_method.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 115.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  MyStrings.signIn,
                  style: MyTextStyle.onBackgroundBoldest40,
                ),
                verticalSpace(20),
                TextFormField(
                  validator: MyFunctions.signInValidator,
                  style: MyTextStyle.onBackgroundBoldest20,
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: MyStrings.emailAddress,
                  ),
                ),
                verticalSpace(20),
                TextFormField(
                  validator: MyFunctions.signInValidator,
                  style: MyTextStyle.onBackgroundBoldest20,
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: MyStrings.password,
                  ),
                ),
                verticalSpace(20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(minimumSize: Size(100, 50.h)),
                  child: const Text(
                    MyStrings.signIn,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                verticalSpace(20),
                AdditionalLoginMethod(
                  iconPath: MyAssets.googleIcon,
                  methodName: "Continue With Google",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
