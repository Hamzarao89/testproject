import 'dart:ui';

import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final String initialText;
  final String endText;
  final double? fontSize;
  final Color? initialTextClr;
  final Color? endTextColor;
  final VoidCallback onPress;
  final MainAxisAlignment mainAxisAlign;
  CustomRichText(
      {Key? key,
      required this.initialText,
      required this.endText,
      this.initialTextClr,
      this.endTextColor,
      this.mainAxisAlign = MainAxisAlignment.center,
      required this.onPress,
      this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlign,
      children: [
        Text(
          initialText,
          style: TextStyle(color: initialTextClr),
        ),
        TextButton(
            onPressed: onPress,
            child: Text(
              endText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                  color: endTextColor),
            ))
      ],
    );
  }
}
