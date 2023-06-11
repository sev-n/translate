import 'package:flutter/material.dart';

class LanguagesStt extends ChangeNotifier {
  
  String localeName = '';
  String localeCode = '';

  String get langName => localeName;
  String get langCode => localeCode;

  void setLangName(String name){
    localeName = name;
    notifyListeners();
  }

  void setLangCode(String code){
    localeCode = code;
    notifyListeners();
  }

}