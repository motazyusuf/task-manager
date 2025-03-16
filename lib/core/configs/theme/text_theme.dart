import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'myFontWeights.dart';

class MyTextStyle {
  MyTextStyle._();

  static TextStyle onBackgroundBoldest40 = TextStyle(
      fontSize: 40.sp,
      fontWeight: MyFontWeights.boldest,
      color: MyColors.onBackgroundText);
  static TextStyle onBackgroundBoldest20 = const TextStyle(
      fontWeight: MyFontWeights.boldest,
      color: MyColors.onBackgroundText,
      fontSize: 20);
  static TextStyle whiteBold40 = TextStyle(
      fontSize: 40.sp, fontWeight: MyFontWeights.bold, color: Colors.white);
  static TextStyle onSecondBackgroundBold150Stroked = TextStyle(
      fontSize: 150.sp,
      fontWeight: MyFontWeights.bold,
      color: Colors.white,
      shadows: const [
        Shadow(
            // bottomLeft
            offset: Offset(-1.5, -1.5),
            color: Colors.black),
        Shadow(
            // bottomRight
            offset: Offset(1.5, -1.5),
            color: Colors.black),
        Shadow(
            // topRight
            offset: Offset(1.5, 1.5),
            color: Colors.black),
        Shadow(
            // topLeft
            offset: Offset(-1.5, 1.5),
            color: Colors.black),
      ]);
  static TextStyle onSecondBackgroundBold40Stroked = TextStyle(
      fontSize: 40.sp,
      fontWeight: MyFontWeights.bold,
      color: Colors.white,
      shadows: const [
        Shadow(
            // bottomLeft
            offset: Offset(-1.5, -1.5),
            color: Colors.black),
        Shadow(
            // bottomRight
            offset: Offset(1.5, -1.5),
            color: Colors.black),
        Shadow(
            // topRight
            offset: Offset(1.5, 1.5),
            color: Colors.black),
        Shadow(
            // topLeft
            offset: Offset(-1.5, 1.5),
            color: Colors.black),
      ]);
  static TextStyle whiteExtraBold130Stroked = TextStyle(
    fontSize: 130.sp,
    fontWeight: MyFontWeights.extraBold,
    shadows: const [
      Shadow(
          // bottomLeft
          offset: Offset(-1.5, -1.5),
          color: Colors.black),
      Shadow(
          // bottomRight
          offset: Offset(1.5, -1.5),
          color: Colors.black),
      Shadow(
          // topRight
          offset: Offset(1.5, 1.5),
          color: Colors.black),
      Shadow(
          // topLeft
          offset: Offset(-1.5, 1.5),
          color: Colors.black),
    ],
  );
  static TextStyle whiteSemiBold25Stroked = TextStyle(
    fontSize: 25.sp,
    fontWeight: MyFontWeights.semiBold,
    shadows: const [
      Shadow(
          // bottomLeft
          offset: Offset(-1.5, -1.5),
          color: Colors.black),
      Shadow(
          // bottomRight
          offset: Offset(1.5, -1.5),
          color: Colors.black),
      Shadow(
          // topRight
          offset: Offset(1.5, 1.5),
          color: Colors.black),
      Shadow(
          // topLeft
          offset: Offset(-1.5, 1.5),
          color: Colors.black),
    ],
  );
  static TextStyle whiteSemiBold20Stroked = TextStyle(
      fontSize: 20.sp,
      fontWeight: MyFontWeights.boldest,
      shadows: const [
        Shadow(
            // bottomLeft
            offset: Offset(-1.5, -1.5),
            color: Colors.black),
        Shadow(
            // bottomRight
            offset: Offset(1.5, -1.5),
            color: Colors.black),
        Shadow(
            // topRight
            offset: Offset(1.5, 1.5),
            color: Colors.black),
        Shadow(
            // topLeft
            offset: Offset(-1.5, 1.5),
            color: Colors.black),
      ]);
  static TextStyle whiteSemiBold100Stroked = TextStyle(
      fontSize: 100.sp,
      fontWeight: MyFontWeights.semiBold,
      shadows: const [
        Shadow(
            // bottomLeft
            offset: Offset(-1.5, -1.5),
            color: Colors.black),
        Shadow(
            // bottomRight
            offset: Offset(1.5, -1.5),
            color: Colors.black),
        Shadow(
            // topRight
            offset: Offset(1.5, 1.5),
            color: Colors.black),
        Shadow(
            // topLeft
            offset: Offset(-1.5, 1.5),
            color: Colors.black),
      ]);
  static TextStyle onBackgroundRegular12 = TextStyle(
      fontSize: 12.sp,
      fontWeight: MyFontWeights.regular,
      color: MyColors.onBackgroundText);
  static TextStyle whiteRegular16 = TextStyle(
      fontSize: 16.sp, fontWeight: MyFontWeights.regular, color: Colors.white);
  static TextStyle onSecondBackgroundBold16 = TextStyle(
      fontSize: 16.sp,
      fontWeight: MyFontWeights.bold,
      color: MyColors.onSecondBackgroundText);
  static TextStyle onSecondBackgroundRegular16 = TextStyle(
      fontSize: 16.sp,
      fontWeight: MyFontWeights.regular,
      color: MyColors.onSecondBackgroundText);
  static TextStyle onSecondBackgroundRegular25 = TextStyle(
      fontSize: 25.sp,
      fontWeight: MyFontWeights.regular,
      color: MyColors.onSecondBackgroundText);
  static TextStyle whiteBold20 = TextStyle(
      fontSize: 20.sp, fontWeight: MyFontWeights.bold, color: Colors.white);
  static TextStyle onBackgroundBold24 = TextStyle(
      fontSize: 24.sp,
      fontWeight: MyFontWeights.bold,
      color: MyColors.onBackgroundText);
  static TextStyle onBackgroundBold32 = TextStyle(
      fontSize: 32.sp,
      fontWeight: MyFontWeights.bold,
      color: MyColors.onBackgroundText);
  static TextStyle onBackgroundBold12 = TextStyle(
      fontSize: 12.sp,
      fontWeight: MyFontWeights.bold,
      color: MyColors.onBackgroundText);
}
