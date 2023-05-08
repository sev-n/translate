import 'package:flutter/material.dart';

class ModelLang extends ChangeNotifier {
  String displayText = '';

  void setText(String text){
    displayText = text;
    notifyListeners();
  }

}