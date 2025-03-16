import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager/core/configs/routes/pages_routes.dart';
import 'package:task_manager/features/auth/presentation/manager/auth_bloc.dart';

import '../../../../core/configs/theme/app_colors.dart';
import '../../../../core/services/my_functions.dart';

class AdditionalLoginMethod extends StatelessWidget {
  const AdditionalLoginMethod(
      {super.key,
      required this.iconPath,
      required this.methodName,
      this.onTap});

  final String iconPath, methodName;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, PagesRoutes.mainLayout, (_) => false,
              arguments: state.user);
        } else if (state is SignInFail) {
          MyFunctions.showFailSnackbar(context, state.error);
        } else if (state is AuthInitial) {
          MyFunctions.showLoading(context);
        }
      },
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<AuthBloc>(context).add(SignInEvent());
        },
        child: ListTile(
          leading: Image.asset(iconPath),
          title: Center(
            child: Text(
              methodName,
              textAlign: TextAlign.center,
            ),
          ),
          tileColor: MyColors.secondBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
          minVerticalPadding: 15.h,
        ),
      ),
    );
  }
}
