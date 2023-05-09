import 'package:flutter/material.dart';
import 'pages/bottom_nav_pages/trans_language.dart';

class ModelLang extends ChangeNotifier {
  String displayText = '';

  //String defaultText = ListLanguage.langKey['en'];

  void setText(String text) {
    displayText = text;
    notifyListeners();
  }
}
