import 'dart:io';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmmail/models/account.dart';
import 'dart:convert';

import 'package:tmmail/models/domains.dart';
import 'package:tmmail/models/email.dart';
import 'package:tmmail/models/login_response.dart';
import 'package:tmmail/utils/constant.dart';

class ApiCall {
  var baseUrl = 'https://api.mail.tm';
  var domain = '/domains';

  Future getDomain() async {
    final domainUrl = Uri.parse('$baseUrl/domains');
    final response = await get(domainUrl);
    if (response.statusCode == 200) {}
  }

  Future<Domain> getAllDomain() async {
    final domainUrl = Uri.parse('$baseUrl/domains');
    final responses = await get(domainUrl);
    if (responses.statusCode == 200) {
      return Domain.fromJson(json.decode(responses.body));
    } else {
      throw Exception("Error getting Users!");
    }
  }

  Future<Account> createAccount(Map? accountData) async {
    final accountUrl = Uri.parse('$baseUrl/accounts');
    final headers = {"Content-type": "application/json"};
    final accountResponse =
        await post(accountUrl, headers: headers, body: jsonEncode(accountData));

    if (accountResponse.statusCode == 201) {
      return Account.fromJson(json.decode(accountResponse.body));
    } else {
      throw Exception("Error getting Users!");
    }
  }

  Future<LoginResponse> Login(Map? accountData) async {
    final loginUrl = Uri.parse('$baseUrl/token');
    final headers = {"Content-type": "application/json"};
    final loginResponse =
        await post(loginUrl, headers: headers, body: jsonEncode(accountData));

    if (loginResponse.statusCode == 200) {
      return LoginResponse.fromJson(json.decode(loginResponse.body));
    } else {
      throw Exception("Error getting Users!");
    }
  }

  Stream<Email> getAllEmail() =>
      Stream.periodic(Duration(seconds: 20)).asyncMap((_) => getMail());

  Future<Email> getMail() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final mailUrl = Uri.parse('$baseUrl/messages');

    String savedToken = sharedPreferences.getString(kToken)!;

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $savedToken',
    };
    final mailResponse = await get(mailUrl, headers: headers);
    print(mailResponse.statusCode);

    if (mailResponse.statusCode == 200) {
      return Email.fromJson(json.decode(mailResponse.body));
    } else {
      throw Exception("Error getting Users!");
    }
  }

  // Future<Domain> getAllUsers() async {
  //
  //   final response = await get(Uri.parse(url));
  //   print("URL: ${Uri.encodeFull(url)}");
  //
  //   if (response.statusCode == 200) {
  //     print("Users data: ${response.body}");
  //     //return UserInfo.fromJson(json.decode(response.body));
  //     return Domain.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception("Error getting Users!");
  //   }
  // }

}