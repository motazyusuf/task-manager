import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/features/auth/presentation/manager/auth_bloc.dart';

import '../../../../core/configs/theme/text_theme.dart';
import '../../../../core/constants/assets.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/widgets/space.dart';
import '../widgets/additional_login_method.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  MyStrings.signIn.tr(),
                  style: MyTextStyle.onBackgroundBoldest40,
                ),
              ),
              verticalSpace(20),
              AdditionalLoginMethod(
                iconPath: MyAssets.googleIcon,
                methodName: MyStrings.continueWithGoogle.tr(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
