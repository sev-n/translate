import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Speak {
  static final FlutterTts flutterTts = FlutterTts();

  static speak(String text) async {
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    // TODO: need to implement flutterTts.setCompletionHandler
    if (!languages.contains(selectedLanguage)) {
      // Language not supported
      debugPrint("Selected language is not supported on this device");
      return;
    } else {
      flutterTts.setLanguage(selectedLanguage);
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }
  }
}
