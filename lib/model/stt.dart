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

  void setText(var text) {
    _translatedText = text;
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
      //padding: const EdgeInsets.all(12),
      height: 120.h,
      decoration: BoxDecoration(
        color: darkColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.volume_down_rounded),
                iconSize: 30,
                color: const Color(0xff35bbca),
                splashRadius: 5,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.info_outline_rounded),
                iconSize: 28,
                color: const Color(0xff35bbca),
                splashRadius: 5,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.h, left: 20.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: const Color(0xffEEEEEE),
                      fontFamily: 'gothic',
                      fontSize: 16.sp,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    translatedText,
                    style: TextStyle(
                      color: const Color(0xffEEEEEE),
                      fontFamily: 'gothic',
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
