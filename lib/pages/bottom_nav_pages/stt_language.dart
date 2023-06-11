import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:translate/model/stt.dart';

// TODO: Experiment this, if satisfied then use this.

class Speech extends StatefulWidget {
  const Speech({super.key});

  @override
  State<Speech> createState() => SpeechState();
}

class SpeechState extends State<Speech> {
  late stt.SpeechToText speechToText;
  bool isListening = false;
  String text = 'Press the button to start speak!';
  double confidence = 1.0;
  String idLocale = '';

  @override
  void initState() {
    super.initState();
    speechToText = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confidence: ${(confidence * 100.0).toStringAsFixed(1)}%'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer<LanguagesStt>(
        builder: (context, data, child) {
          void listen() async {
            if (!isListening) {
              bool available = await speechToText.initialize(
                onStatus: (val) => debugPrint('onStatus: $val'),
                onError: (val) => debugPrint('onError: $val'),
              );
              if (available) {
                setState(() => isListening = true);
                speechToText.listen(
                  onResult: (val) => setState(
                    () {
                      text = val.recognizedWords;
                      // if (val.hasConfidenceRating && val.confidence > 0) {
                      //   confidence = val.confidence;
                      // }
                    },
                  ),
                  localeId: data.langCode,
                  listenMode: stt.ListenMode.dictation,
                );
              }
            } else {
              setState(() => isListening = false);
              speechToText.stop();
            }
          }

          return FloatingActionButton(
            onPressed: listen,
            child:
                Icon(!speechToText.isNotListening ? Icons.mic : Icons.mic_none),
          );
        },
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
              child: Text(text),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const Spt(),
                //   ),
                // );
              },
              child: const Text("Supported"),
            ),
          ],
        ),
      ),
    );
  }
}
