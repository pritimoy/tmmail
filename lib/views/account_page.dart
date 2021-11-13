import 'package:flutter/material.dart';
import 'package:tmmail/utils/constant.dart';
import 'package:tmmail/views/widgets/custom_text.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: customText(text: "Coming soon", textStyle: kComingSoon)),
    );
  }
}