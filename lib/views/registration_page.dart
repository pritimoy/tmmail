import 'package:flutter/material.dart';
import 'package:tmmail/models/account.dart';
import 'package:tmmail/models/domains.dart';
import 'package:tmmail/network/api_call.dart';
import 'package:tmmail/utils/constant.dart';
import 'package:tmmail/utils/custom_toast.dart';

import 'package:tmmail/views/widgets/custom_buttom.dart';
import 'package:tmmail/views/widgets/custom_rich_text.dart';
import 'package:tmmail/views/widgets/custom_text.dart';
import 'package:tmmail/views/widgets/custom_text_input.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  Future<Domain>? domain;
  @override
  void initState() {
    super.initState();
    domain = getDomain();

    // print(res);
  }

  late String dropdownValue;
  final TextEditingController emailOrIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late Account accountRes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        resizeToAvoidBottomInset: false,
        body: FutureBuilder<Domain>(
          future: domain,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<HydraMember> domainList;
              List<String> domainNameList = <String>[];
              domainList = snapshot.data!.hydraMember;
              for (var i = 0; i < domainList.length; i++) {
                domainNameList.add(domainList[i].domain);
              }
              print(domainNameList);

              return Column(
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
                  customText(text: kRegistration, textStyle: kHeadingStyle),
                  const SizedBox(
                    height: 80.0,
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height / 1.7,
                    padding: const EdgeInsets.only(
                        top: 50.0, left: 16.0, right: 16.0, bottom: 40.0),
                    decoration: kRoundedBoxDecoration,
                    child: Column(
                      children: <Widget>[
                        InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 2.0),
                            labelText: "Choose a Domain",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: domainNameList[0],
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.black45),
                              underline: Container(
                                height: 2,
                                color: Colors.black87,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: domainNameList
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        CustomTextInput(
                          textEditingController: emailOrIdController,
                          hintText: kMailAddress,
                          labelText: kChooseUser,
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
                          labelText: kPasswordChoose,
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
                            if (emailOrIdController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty &&
                                dropdownValue.isNotEmpty) {
                              try {
                                Map accountData = {
                                  'address': emailOrIdController.text +
                                      "@" +
                                      dropdownValue,
                                  'password': passwordController.text,
                                };

                                accountRes =
                                    await createAccount(data: accountData);
                                showToast(
                                    "Registration Successfully", Colors.green);

                                Navigator.pushNamed(context, '/login');
                              } catch (e) {
                                print("Error! " + e.toString());
                              }
                            } else {
                              showToast("Please input all field",
                                  Colors.deepOrangeAccent);
                            }
                          },
                          buttonText: kCreateAccount,
                          borderRadius: 20.0,
                          buttonColor: Colors.deepOrangeAccent,
                          buttonTextStyle: kButtonTextStyle,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CustomRichText(
                          onTap: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          mainText: kHaveAccount,
                          secondText: kLogin,
                          mainTextStyle: kInputTextStyle,
                          secondTextStyle: kRegistrationTextStyle,
                        ),
                      ],
                    ),
                  )
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  Future<Domain> getDomain() => ApiCall().getAllDomain();
  Future createAccount({Map? data}) => ApiCall().createAccount(data);
}