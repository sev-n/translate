import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
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
  bool isListening = false;
  String text = 'Press the button to start speak!';

  @override
  Widget build(BuildContext context) {
    var swap = Provider.of<Swap>(context, listen: false);

    return Container(
      color: const Color(0xff222831),
      child: Stack(
        children: [
          // Text(
          //   "${widget.isInitialized}",
          //   style: const TextStyle(color: Colors.white),
          // ),
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
          Align(
            alignment: const Alignment(0, 0.80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<LanguagesStt>(
                  builder: (context, data, child) {
                    // void listen() async {
                    //   if (widget.isInitialized) {
                    //     setState(() => isListening = true);
                    //     widget.speech.listen(
                    //       onResult: (val) => setState(
                    //         () {
                    //           text = val.recognizedWords;
                    //           // if (val.hasConfidenceRating && val.confidence > 0) {
                    //           //   confidence = val.confidence;
                    //           // }
                    //         },
                    //       ),
                    //       localeId: data.langCode,
                    //       listenMode: stt.ListenMode.dictation,
                    //     );
                    //   } else {
                    //     setState(() => isListening = false);
                    //     widget.speech.stop();
                    //   }
                    // }

                    return AvatarGlow(
                      animate: false,
                      glowColor: Colors.grey,
                      endRadius: 75.0,
                      duration: const Duration(milliseconds: 1000),
                      repeatPauseDuration: const Duration(milliseconds: 100),
                      repeat: false,
                      child: Container(
                        width: 65,
                        height: 65,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Button press logic
                            //listen();
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 10,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(16),
                            backgroundColor: accent,
                          ),
                          child: const Icon(Icons.mic_none),
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
