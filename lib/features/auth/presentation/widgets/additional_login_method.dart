import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/theme/app_colors.dart';

class AdditionalLoginMethod extends StatelessWidget {
  AdditionalLoginMethod(
      {super.key,
      required this.iconPath,
      required this.methodName,
      this.onTap});

  final String iconPath, methodName;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {},
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
    );
  }
}
