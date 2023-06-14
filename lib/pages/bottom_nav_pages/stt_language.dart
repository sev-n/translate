import 'package:flutter/material.dart';
import 'package:translate/model/list_supported_lang.dart';
import 'package:translate/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:translate/model/stt.dart';

// TODO: Experiment this, if satisfied then use this.

// class Speech extends StatefulWidget {
//   const Speech({super.key});

//   @override
//   State<Speech> createState() => SpeechState();
// }

// class SpeechState extends State<Speech> {
//   late stt.SpeechToText speechToText = stt.SpeechToText();
//   bool isListening = false;
//   String text = 'Press the button to start speak!';
//   double confidence = 1.0;
//   String idLocale = '';
//   bool speechEnabled = false;
//   List<stt.LocaleName> _locales = [];

//   void initSpeech() async {
//     speechEnabled = await speechToText.initialize(
//       onStatus: (String status) {
//         if (status == 'done') {
//           debugPrint("Status Done");
//         }
//       },
//     );
//     setState(() {});
//   }

//    Future<void> getSupportedLanguages() async {
//     List<stt.LocaleName> locales = await speechToText.locales();
//     setState(() {
//       _locales = locales;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     initSpeech();
//     getSupportedLanguages();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Confidence: ${(confidence * 100.0).toStringAsFixed(1)}%'),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: Consumer<LanguagesStt>(
//         builder: (context, data, child) {
//           void listen() async {
//             if (speechEnabled) {
//               setState(() => isListening = true);
//               speechToText.listen(
//                 onResult: (val) => setState(
//                   () {
//                     text = val.recognizedWords;
//                   },
//                 ),
//                 localeId: data.langCode,
//                 listenMode: stt.ListenMode.dictation,
//               );
//             } else {
//               setState(() => isListening = false);
//               speechToText.stop();
//             }
//           }

//           return FloatingActionButton(
//             onPressed: listen,
//             child:
//                 Icon(!speechToText.isNotListening ? Icons.mic : Icons.mic_none),
//           );
//         },
//       ),
//       body: SingleChildScrollView(
//         reverse: true,
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
//               child: Text(text),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => const Spt(),
//                 //   ),
//                 // );
//               },
//               child: const Text("Supported"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SourceLanguageStt extends StatefulWidget {
  const SourceLanguageStt({super.key});

  @override
  State<SourceLanguageStt> createState() => _SourceLanguageSttState();
}

class _SourceLanguageSttState extends State<SourceLanguageStt> {

  @override
  Widget build(BuildContext context) {
    var langStt = Provider.of<LanguagesStt>(context, listen: false);

    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: SttSupportedLanguages.supLanguanges.length,
        itemBuilder: (BuildContext context, int index) {
          String localeName = SttSupportedLanguages.supLanguanges[index].name;
          String localeCode = SttSupportedLanguages.supLanguanges[index].localeId;
          return ListTile(
            title: Text(
              localeName,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            subtitle: Text(
              localeCode,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'gothic',
              ),
            ),
            onTap: () {
              // Do something when the user taps on a language
              langStt.setLangName(localeName);
              langStt.setLangCode(localeCode);
              debugPrint('Selected language name: ${langStt.langName}');
              debugPrint('Seclected language code: ${langStt.langCode}');
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}

class ToLanguageStt extends StatefulWidget {
  const ToLanguageStt({super.key});

  @override
  State<ToLanguageStt> createState() => _ToLanguageSttState();
}

class _ToLanguageSttState extends State<ToLanguageStt> {
  @override
  Widget build(BuildContext context) {
    var stt = Provider.of<TransLanguageStt>(context, listen: false);
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: TranslateToLanguagesStt.sttLangs.length,
        itemBuilder: (BuildContext context, int index) {
          String langCode =
              TranslateToLanguagesStt.sttLangs.keys.elementAt(index);
          String langName =
              TranslateToLanguagesStt.sttLangs.values.elementAt(index);
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
              stt.setLangName(langName);
              stt.setLangCode(langCode);
              // debugPrint('Selected language name: ${langStt.langName}');
              // debugPrint('Seclected language code: ${langStt.langCode}');
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
