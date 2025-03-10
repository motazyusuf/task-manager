import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/configs/theme/text_theme.dart';

class AuthRichText extends StatelessWidget {
  AuthRichText(
      {super.key,
      required this.text,
      required this.clickableText,
      required this.goToRoute,
      this.textAlign});

  final String text, clickableText, goToRoute;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: TextSpan(
        text: text,
        style: MyTextStyle.onBackgroundRegular12,
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, goToRoute);
              },
            text: clickableText,
            style: MyTextStyle.onBackgroundBold12,
          ),
        ],
      ),
    );
  }
}
