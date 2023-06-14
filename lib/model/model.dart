
import 'package:flutter/material.dart';

class SourceLanguageModel extends ChangeNotifier {
  //String langCode = ListLanguage.langs.keys.;
  String text = 'English';
  String langCode = 'en';


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

class TranslatedLanguageModel extends ChangeNotifier {

  String language = 'Filipino (Tagalog)';
  String languageCode = 'tl';

    void setText(String newText){
    language = newText;
    notifyListeners();
  }

  void setLangCode(String code){
    languageCode = code;
    notifyListeners();
  }

  get getLangName => language;

  get getLangCode => languageCode;
  

}

