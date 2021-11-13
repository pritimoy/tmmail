import 'package:flutter/material.dart';
import 'package:tmmail/utils/constant.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {Key? key,
      this.textEditingController,
      this.hintText,
      this.labelText,
      this.prefixIcon,
      this.isObscure,
      this.onChange,
      required this.cornerRadius})
      : super(key: key);

  final TextEditingController? textEditingController;
  final String? hintText;
  final String? labelText;
  final Icon? prefixIcon;
  final bool? isObscure;
  final Function? onChange;
  final double? cornerRadius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: kInputTextStyle,
      onChanged: onChange as void Function(String)?,
      controller: textEditingController,
      obscureText: isObscure!,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(cornerRadius!),
            gapPadding: 4.0),
        contentPadding:
            const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
      ),
    );
  }
}