import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../configs/theme/app_colors.dart';
import '../configs/theme/text_theme.dart';
import '../constants/strings.dart';
import '../widgets/space.dart';

abstract class MyFunctions {
  static void showSuccessSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.white), // Check icon
          SizedBox(width: 10.w),
          Expanded(
              child:
                  Text(message, style: const TextStyle(color: Colors.white))),
        ],
      ),
      backgroundColor: Colors.green,
      // Green background
      behavior: SnackBarBehavior.floating,
      // Floating style
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      margin: const EdgeInsets.all(16),
      // Margin from edges
      duration: const Duration(seconds: 5), // Duration of snackbar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showFailSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error, color: Colors.white), // Check icon
          SizedBox(width: 10.w),
          Expanded(child: Text(message, style: TextStyle(color: Colors.white))),
        ],
      ),
      backgroundColor: Colors.red,
      // Green background
      behavior: SnackBarBehavior.floating,
      // Floating style
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      margin: const EdgeInsets.all(16),
      // Margin from edges
      duration: const Duration(seconds: 5), // Duration of snackbar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    } else if (!RegExp(r'^\d{6,}$').hasMatch(value)) {
      return 'Password must be 6 digits or more';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? signInValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }

    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }
    return null;
  }

  static String getSignInErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'Invalid Email.';
      case 'invalid-credential':
        return 'Wrong Email or Password';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }

  static String passwordResetErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'Invalid Email.';
      case 'invalid-credential':
        return 'Wrong Email or Password';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }

  static String getSignUpErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return 'This email address is already in use by another account.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }

  static void showLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, // Prevents dismissing
        builder: (context) => const Center(
                child: CircularProgressIndicator(
              color: MyColors.primary,
            )));
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessageBottomSheet(BuildContext context, bool suggestion) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: MyColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          width: double.infinity,
          height: 200.h,
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                textAlign: TextAlign.center,
                suggestion ? MyStrings.goOut : MyStrings.doNotGoOut,
                style: MyTextStyle.onBackgroundBold32,
              ),
              verticalSpace(10),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  MyStrings.close,
                  style: MyTextStyle.onSecondBackgroundBold16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
