// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/utils/colors.dart';

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

class TranslatedText extends ChangeNotifier {
  String _translatedText = '';

  String get translatedText => _translatedText;

  void setText(var text){
    _translatedText =  text;
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


  String receivedWords = '';

  List<Widget> containers = [];

  String get words => receivedWords;

  void setWords(String words) {
    receivedWords = words;
    notifyListeners();
  }



  Widget createContainer(String text, String translatedText) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 70.h,
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Color(0xffEEEEEE),
                fontFamily: 'gothic',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              translatedText,
              style: const TextStyle(
                color: Color(0xffEEEEEE),
                fontFamily: 'gothic',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addContainer(Widget container) {
    containers.insert(0, container);
    notifyListeners();
  }

  void removeContainer(int index) {
    containers.removeAt(index);
    notifyListeners();
  }
}
