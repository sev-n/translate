import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate/model.dart';
import 'package:translate/model/list_supported_lang.dart';
import 'package:translate/model/model.dart';
import 'package:translate/pages/utils/colors.dart';
import 'package:translator/translator.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  @override
  Widget build(BuildContext context) {
    var onChange = Provider.of<Model>(context, listen: false);

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
                fontFamily: 'Space',
              ),
            ),
            //subtitle: Text(langCode),
            onTap: () {
              // Do something when the user taps on a language
              onChange.setText(langName);
              onChange.setLangCode(langCode);
              Navigator.pop(context);
              debugPrint('Language code - ${onChange.getLangName}');
              debugPrint('Language code - ${onChange.getLangCode}');
            },
          );
        },
      ),
    );
  }
}
