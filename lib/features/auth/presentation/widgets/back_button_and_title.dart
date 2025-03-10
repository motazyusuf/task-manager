import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/configs/theme/app_colors.dart';
import '../../../../core/widgets/space.dart';

class BackButtonAndTitle extends StatelessWidget {
  BackButtonAndTitle({super.key, required this.title});

  final Text title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            height: 45.h,
            width: 45.w,
            decoration: BoxDecoration(
                color: MyColors.transparency,
                borderRadius: BorderRadius.circular(100)),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: MyColors.onBackgroundIcon,
            ),
          ),
        ),
        verticalSpace(20),
        title,
      ],
    );
  }
}
