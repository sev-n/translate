import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/model/list_supported_lang.dart';
import 'package:translate/model/model.dart';
import 'package:translate/utils/colors.dart';

class SourceLanguage extends StatefulWidget {
  const SourceLanguage({super.key});

  @override
  State<SourceLanguage> createState() => _SourceLanguage();
}

class _SourceLanguage extends State<SourceLanguage> {
  @override
  Widget build(BuildContext context) {
    var sourceLang = Provider.of<SourceLanguageModel>(context, listen: false);

    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: ListLanguage.langs.values.length,
        itemBuilder: (BuildContext context, int index) {
          String langCode = ListLanguage.langs.keys.elementAt(index);
          String langName = ListLanguage.langs.values.elementAt(index);
          return ListTile(
            title: Text(
              langName,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            subtitle: Text(
              langCode,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            onTap: () {
              // Do something when the user taps on a language
              sourceLang.setText(langName);
              sourceLang.setLangCode(langCode);
              Navigator.pop(context);
              debugPrint('Language code - ${sourceLang.getLangName}');
              debugPrint('Language code - ${sourceLang.getLangCode}');
            },
          );
        },
      ),
    );
  }
}

class LanguagesToTranslate extends StatefulWidget {
  const LanguagesToTranslate({super.key});

  @override
  State<LanguagesToTranslate> createState() => _LanguagesToTranslateState();
}

class _LanguagesToTranslateState extends State<LanguagesToTranslate> {
  @override
  Widget build(BuildContext context) {
    var translated =
        Provider.of<TranslatedLanguageModel>(context, listen: false);

    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: TranslateToLanguages.tLangs.values.length,
        itemBuilder: (BuildContext context, int index) {
          String langCode = TranslateToLanguages.tLangs.keys.elementAt(index);
          String langName = TranslateToLanguages.tLangs.values.elementAt(index);
          return ListTile(
            title: Text(
              langName,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            subtitle: Text(
              langCode,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            onTap: () {
              // Do something when the user taps on a language
              translated.setText(langName);
              translated.setLangCode(langCode);
              Navigator.pop(context);
              debugPrint('Language code - ${translated.getLangName}');
              debugPrint('Language code - ${translated.getLangCode}');
            },
          );
        },
      ),
    );
  }
}
