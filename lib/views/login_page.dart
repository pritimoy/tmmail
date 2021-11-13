import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmmail/models/login_response.dart';
import 'package:tmmail/network/api_call.dart';
import 'package:tmmail/utils/constant.dart';
import 'package:tmmail/utils/custom_toast.dart';
import 'package:tmmail/views/widgets/custom_buttom.dart';
import 'package:tmmail/views/widgets/custom_rich_text.dart';
import 'package:tmmail/views/widgets/custom_text.dart';
import 'package:tmmail/views/widgets/custom_text_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailOrIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late LoginResponse loginResponse;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 60.0,
          ),
          const Center(
            child: Image(
              image: AssetImage('assets/tmlogo.png'),
              width: 80.0,
              height: 80.0,
              color: Colors.white,
            ),
          ),
          customText(text: kLogin, textStyle: kHeadingStyle),
          const SizedBox(
            height: 80.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.7,
            padding: const EdgeInsets.only(
                top: 50.0, left: 16.0, right: 16.0, bottom: 40.0),
            decoration: kRoundedBoxDecoration,
            child: Column(
              children: <Widget>[
                CustomTextInput(
                  textEditingController: emailOrIdController,
                  hintText: kMailAddress,
                  labelText: kMailLabel,
                  cornerRadius: 8.0,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    size: 20.0,
                    color: Colors.black45,
                  ),
                  isObscure: false,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                CustomTextInput(
                  textEditingController: passwordController,
                  hintText: kPassword,
                  labelText: kPasswordLabel,
                  cornerRadius: 8.0,
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 20.0,
                    color: Colors.black45,
                  ),
                  isObscure: false,
                ),
                CustomButton(
                  onTap: () async {
                    SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    if (emailOrIdController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      try {
                        Map loginData = {
                          'address': emailOrIdController.text,
                          'password': passwordController.text,
                        };
                        loginResponse = await login(data: loginData);
                        if (loginResponse.token.isNotEmpty) {
                          sharedPreferences.setString(
                              kToken, loginResponse.token);
                          showToast("Login Successfully", Colors.green);

                          Navigator.pushNamed(context, '/home');
                        }
                      } catch (e) {
                        throw Exception(e);
                      }
                    } else {
                      showToast("Please input all the field",
                          Colors.deepOrangeAccent);
                    }
                  },
                  buttonText: kLogin,
                  borderRadius: 20.0,
                  buttonColor: Colors.deepOrangeAccent,
                  buttonTextStyle: kButtonTextStyle,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomRichText(
                  onTap: () {
                    Navigator.pushNamed(context, '/registration');
                  },
                  mainText: kDoNotAccount,
                  secondText: kCreateAccount,
                  mainTextStyle: kInputTextStyle,
                  secondTextStyle: kRegistrationTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future login({Map? data}) => ApiCall().Login(data);
}

// class CustomRichText extends StatelessWidget {
//   const CustomRichText({
//     this.mainText,
//     this.secondText,
//     this.mainTextStyle,
//     this.secondTextStyle,
//     Key? key,
//
//   }) : super(key: key);
//
//   final String? mainText;
//   final String? secondText;
//   final TextStyle? mainTextStyle;
//   final TextStyle? secondTextStyle;
//
//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//         text:TextSpan(
//       text: mainText,
//       style: mainTextStyle,
//       children: <TextSpan> [
//         TextSpan(text: secondText, style: secondTextStyle)
//       ]
//     ));
//   }
// }

// class CustomTextInput extends StatelessWidget {
//   const CustomTextInput(
//       {Key? key,
//       this.textEditingController,
//       this.hintText,
//       this.labelText,
//       this.prefixIcon,
//       this.isObscure,
//       this.onChange,
//       required this.cornerRadius})
//       : super(key: key);
//
//   final TextEditingController? textEditingController;
//   final String? hintText;
//   final String? labelText;
//   final Icon? prefixIcon;
//   final bool? isObscure;
//   final Function? onChange;
//   final double? cornerRadius;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       style: kInputTextStyle,
//       decoration: InputDecoration(
//         hintText: hintText,
//         labelText: labelText,
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(cornerRadius!), gapPadding: 4.0),
//         contentPadding:
//             const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
//       ),
//     );
//   }
// }