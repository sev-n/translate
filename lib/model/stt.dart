// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class LanguagesStt extends ChangeNotifier {
  String localeName = 'English';
  String localeCode = 'en_US';

  String get langName => localeName;
  String get langCode => localeCode;

  void setLangName(String name) {
    localeName = name;
    notifyListeners();
  }

  void setLangCode(String code) {
    localeCode = code;
    notifyListeners();
  }
}

class TransLanguageStt extends ChangeNotifier {
  String _langName = 'Filipino';
  String _langCode = 'fil_PH';

  String get langName => _langName;
  String get langCode => _langCode;

  void setLangName(String name) {
    _langName = name;
    notifyListeners();
  }

  void setLangCode(String code) {
    _langCode = code;
    notifyListeners();
  }
}

class LanguagesSpokeStt extends ChangeNotifier {


}
