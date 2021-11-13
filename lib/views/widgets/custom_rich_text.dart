import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    this.mainText,
    this.secondText,
    this.mainTextStyle,
    this.secondTextStyle,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String? mainText;
  final String? secondText;
  final TextStyle? mainTextStyle;
  final TextStyle? secondTextStyle;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: RichText(
          text: TextSpan(
              text: mainText,
              style: mainTextStyle,
              children: <TextSpan>[
            TextSpan(text: secondText, style: secondTextStyle)
          ])),
    );
  }
}