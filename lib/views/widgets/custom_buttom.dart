import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      this.onTap,
      required this.buttonText,
      this.buttonTextStyle,
      this.buttonColor,
      this.borderRadius,
      this.buttonWidth})
      : super(key: key);

  final Function? onTap;
  final String? buttonText;
  final TextStyle? buttonTextStyle;
  final Color? buttonColor;
  final double? borderRadius;
  final double? buttonWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 46.0, right: 30.0),
      child: GestureDetector(
        onTap: onTap as void Function()?,
        child: Center(
          child: Container(
            width: buttonWidth,
            padding: EdgeInsets.all(13.0),
            decoration: BoxDecoration(
                color: buttonColor,
                //   gradient: const LinearGradient(colors: <Color>[
                //     Color(0xFF1479FF),
                //     Color(0xFF00C4D8),
                //   ]),
                borderRadius: BorderRadius.circular(borderRadius!)),
            child: Center(
              child: Text(
                buttonText!,
                style: buttonTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}