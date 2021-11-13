import 'package:flutter/material.dart';

Widget customText(
    {required String text,
    TextStyle? textStyle,
    TextAlign? textAlign,
    double top = 0.0,
    double left = 0.0,
    double right = 0.0,
    double bottom = 0.0}) {
  return Padding(
    padding:
        EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
    child: Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    ),
  );
}