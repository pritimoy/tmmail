import 'package:flutter/material.dart';

class ProviderState with ChangeNotifier {
  int totalNumber = 0;
  void totalMessage(int totalMail) {
    totalNumber = totalMail;
    notifyListeners();
  }
}