import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translate/model/list_supported_lang.dart';
import 'package:translate/model/stt.dart';
import 'package:translate/model/swap_lang.dart';
import 'package:translate/pages/bottom_nav_pages/stt_language.dart';
import 'package:translate/utils/animate.dart';
import 'package:translate/utils/colors.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Conversation extends StatefulWidget {
  // final stt.SpeechToText speech;
  // final bool isInitialized;

  const Conversation({super.key});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  stt.SpeechToText speech = stt.SpeechToText();
  List<stt.LocaleName> locales = [];
  bool speechEnabled = false;
  bool isListening = false;
  String text = 'Press the button to start speak!';

  void stopListening() async {
    await speech.stop();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> initSpeech() async {
    bool success = await speech.initialize(
        onStatus: (String status) {
          if (status == 'done') {
            debugPrint("Status Done");
            stopListening();
          }
        },
        onError: (status) => debugPrint("$status"));
    // ignore: no_leading_underscores_for_local_identifiers
    List<stt.LocaleName> _locales = await speech.locales();
    setState(() {
      SttSupportedLanguages.supLanguanges = _locales;
    });

    setState(() {
      speechEnabled = success;
    });

    debugPrint('$speechEnabled');
  }

  @override
  void initState() {
    super.initState();
    initSpeech();
  }

  @override
  void dispose() {
    // Cancel any ongoing operations
    speech.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var swap = Provider.of<Swap>(context, listen: false);
    var textProvider = Provider.of<LanguagesSpokeStt>(context, listen: false);

    return Container(
      color: const Color(0xff222831),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h, left: 10.w),
            child: Row(
              children: [
                SizedBox(
                  width: 140.w,
                  child: ElevatedButton(
                    onPressed: () {
                      // Do something when the button is pressed
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => swap.touchState % 2 == 0
                              ? const ToLanguageStt()
                              : const SourceLanguageStt(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0.w, vertical: 14.0.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0.r),
                      ),
                      side: BorderSide.none,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child:
                              Consumer3<LanguagesStt, TransLanguageStt, Swap>(
                            builder: (context, langData, transData, swapData,
                                child) {
                              return Text(
                                swapData.touchState % 2 == 0
                                    ? transData.langName
                                    : langData.langName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: 'gothic',
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 16.0.w),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 10.w),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10.0.r),
                      splashColor: Colors.black.withOpacity(0.3),
                      onTap: () {},
                      child: RotateSwapButton(
                        childWidget: Icon(
                          Icons.swap_horizontal_circle_outlined,
                          size: 35,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: SizedBox(
                    width: 140.w,
                    child: ElevatedButton(
                      onPressed: () {
                        // Do something when the button is pressed
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => swap.touchState % 2 == 0
                                ? const SourceLanguageStt()
                                : const ToLanguageStt(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accent,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0.w, vertical: 14.0.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0.r),
                        ),
                        side: BorderSide.none,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child:
                                Consumer3<TransLanguageStt, LanguagesStt, Swap>(
                              builder: (context, transData, langData, swapData,
                                  child) {
                                return Text(
                                  swapData.touchState % 2 == 0
                                      ? langData.langName
                                      : transData.langName,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'gothic',
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 16.0.w),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
                // --------------------------------------------------------
              ],
            ),
          ),
          Center(
            child: Container(
              width: 340.w,
              height: 290.h,
              decoration: BoxDecoration(
                color: const Color(0xff393E46),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Consumer<LanguagesSpokeStt>(
                builder: (context, data, child) {
                  return ListView.builder(
                    itemCount: data.containers.length,
                    itemBuilder: (context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Dismissible(
                          key: UniqueKey(),
                          child: data.containers[index],
                          onDismissed: (DismissDirection direction) {
                            data.removeContainer(index);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: const Alignment(0, 1.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<LanguagesStt>(
                  builder: (context, data, child) {
                    void listen() async {
                      //if (speechEnabled) {
                      //setState(() => isListening = true);
                      await speech.listen(
                        onResult: (val) {
                          Widget add =
                              textProvider.createContainer(val.recognizedWords);
                          textProvider.addContainer(add);
                          debugPrint(textProvider.words);
                        },
                        localeId: data.langCode,
                        listenMode: stt.ListenMode.dictation,
                        partialResults: false,
                      );
                      setState(() {});
                      // } else {
                      //   setState(() => isListening = false);
                      //   //speech.stop();
                      // }
                    }

                    return AvatarGlow(
                      animate: speech.isListening,
                      glowColor: Colors.grey,
                      endRadius: 75.0,
                      duration: const Duration(milliseconds: 1000),
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      repeat: true,
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Button press logic
                            speech.isNotListening ? listen() : stopListening();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(16),
                            backgroundColor: accent,
                          ),
                          child: Icon(
                              speech.isListening ? Icons.mic : Icons.mic_none),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
