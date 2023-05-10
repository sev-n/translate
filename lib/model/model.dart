
import 'package:flutter/material.dart';

class Model extends ChangeNotifier {

  String text = '';
  String langCode = '';

  void setText(String newText){
    text = newText;
    notifyListeners();
  }

  void setLangCode(String code){
    langCode = code;
    notifyListeners();
  }

  get getLangName => text;

  get getLangCode => langCode;
  
}

