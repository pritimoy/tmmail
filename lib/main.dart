import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmmail/provider/provider_state.dart';
import 'package:tmmail/views/account_page.dart';
import 'package:tmmail/views/all_mail_page.dart';
import 'package:tmmail/views/home_page.dart';
import 'package:tmmail/views/login_page.dart';
import 'package:tmmail/views/registration_page.dart';

void main() {
  runApp(TmMail());
}

class TmMail extends StatelessWidget {
  // const TmMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderState>(
      create: (context) => ProviderState(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.deepOrangeAccent,
          focusColor: Colors.deepOrangeAccent,
        ),
        home: const LoginPage(),
        //debug banner hide
        debugShowCheckedModeBanner: false,
        routes: {
          '/login': (context) => const LoginPage(),
          '/registration': (context) => const RegistrationPage(),
          '/home': (context) => const HomePage(),
          '/mail': (context) => const AllMailPage(),
          '/account': (context) => const AccountPage(),
        },
      ),
    );
  }
}