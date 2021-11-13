import 'package:flutter/material.dart';
import 'package:tmmail/views/account_page.dart';
import 'package:tmmail/views/all_mail_page.dart';
import 'package:tmmail/views/home_page.dart';

const String kLogin = 'Login';
const String kRegistration = 'Registration';
const String kMailLabel = "Please enter your email";
const String kMailAddress = "Email address";
const String kChooseUser = "Please choose a username";
const String kDoNotAccount = "Don't have an Account? ";
const String kHaveAccount = "Have you an Account? ";
const String kCreateAccount = "Create an Account";
const String kPassword = "Enter Password";
const String kPasswordLabel = "Please enter your password";
const String kPasswordChoose = "Please set a password";
const String kToken = 'Token';

const kHeadingStyle = TextStyle(
  color: Colors.white,
  fontSize: 22.0,
  height: 1.0,
  fontWeight: FontWeight.w800,
);

const kComingSoon= TextStyle(
  color: Colors.deepOrangeAccent,
  fontSize: 22.0,
  height: 1.0,
  fontWeight: FontWeight.w800,
);

const kButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18.0,
  height: 1.0,
  fontWeight: FontWeight.w800,
);

const kInputTextStyle = TextStyle(
  color: Colors.black87,
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
  height: 1.2,
);
const kName = TextStyle(
  color: Colors.black87,
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  height: 1.3,
);
const kMail = TextStyle(
  color: Colors.black54,
  fontSize: 12.0,
  fontWeight: FontWeight.normal,
  height: 1.0,
);
const kSubject = TextStyle(
  color: Colors.black87,
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  height: 1.2,
);
const kIntro = TextStyle(
  color: Colors.black54,
  fontSize: 14.0,
  fontWeight: FontWeight.normal,
  height: 1.2,
);

const kRegistrationTextStyle = TextStyle(
  color: Colors.orangeAccent,
  fontSize: 16.0,
  fontWeight: FontWeight.w800,
  height: 1.2,
);

const kRoundedBoxDecoration = BoxDecoration(
    shape: BoxShape.rectangle,
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ));

const List<Widget> pageList = <Widget>[
  AllMailPage(),
  AccountPage(),
];