import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translate/model/model.dart';
import 'package:translate/pages/utils/animate.dart';
import 'package:translate/pages/utils/colors.dart';
import 'package:translator/translator.dart';
import '../../model.dart';
import 'trans_language.dart';

//final TextEditingController resultController = TextEditingController();

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  bool ifHasText = false;
  final GoogleTranslator translator = GoogleTranslator();
  final TextEditingController controller = TextEditingController();

  final StreamController<String> streamController =
      StreamController.broadcast();
  Stream<String> get stream => streamController.stream;

  @override
  void dispose() {
    controller.dispose();
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var languageCode = Provider.of<Model>(context, listen: false);

    return Container(
      color: const Color(0xff222831),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100.h, left: 10.w),
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
                            builder: (context) => const Languages()),
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
                              Consumer<Model>(builder: (context, data, child) {
                            return Text(
                              data.getLangName,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'Space',
                              ),
                            );
                          }),
                        ),
                        SizedBox(width: 16.0.w),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14.w, right: 10.w),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 35,
                    color: Colors.grey.shade300,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 3.w),
                  child: SizedBox(
                    width: 140.w,
                    child: ElevatedButton(
                      onPressed: () {
                        // Do something when the button is pressed
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
                            child: Text(
                              'English',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'Space',
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0.w),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 110.h),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //const SizedBox(height: 32.0),
                SizedBox(height: 70.0.h),
                Center(
                  child: SizedBox(
                    width: 340.w,
                    child: TextField(
                      // when triggered when user inserted a value or deleted text
                      onChanged: (text) {
                        setState(() {
                          ifHasText = true;
                          if (controller.text.isEmpty) {
                            ifHasText = false;
                          }
                        });
                        streamController.add(text);
                      },

                      controller: controller,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'gothic',
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        suffix: ifHasText
                            ? IconButton(
                                onPressed: () {
                                  controller.clear();
                                  setState(() {
                                    ifHasText = false;
                                  });
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  size: 20,
                                  color: Color(0xffEEEEEE),
                                ),
                              )
                            : null,
                        fillColor: const Color(0xff393E46),
                        filled: true,
                        hintStyle: TextStyle(
                          color: const Color(0xffEEEEEE),
                          fontSize: 18.sp,
                          fontFamily: 'gothic',
                        ),
                        hintText: "Enter you text here...",
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 10,
                        ),
                      ),
                      maxLines: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 360.h),
            child: Column(
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    width: 340.w,
                    height: 135.h,
                    decoration: BoxDecoration(
                      color: const Color(0xff393E46),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: StreamBuilder<String>(
                      stream: stream,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData ||
                            snapshot.data!.isEmpty ||
                            controller.text.isEmpty) {
                          return Text(
                            'Translation will appear here',
                            style: TextStyle(
                              color: const Color(0xffEEEEEE),
                              fontSize: 18.sp,
                              fontFamily: 'gothic',
                            ),
                          );
                        }

                        return FutureBuilder<Translation>(
                          future: translator.translate(snapshot.data!,
                              from: languageCode.getLangCode, to: 'en'),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return Text(
                                'Translating...',
                                style: TextStyle(
                                  color: accent,
                                  fontSize: 16.sp,
                                  fontFamily: 'gothic',
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }

                            if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            }

                            return SingleChildScrollView(
                              child: Text(
                                snapshot.data!.text,
                                style: TextStyle(
                                  color: accent,
                                  fontSize: 18.sp,
                                  fontFamily: 'gothic',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// Center(
//                   child: SizedBox(
//                     width: 340.w,
//                     //height: 150.h,
//                     child: TextField(
//                       readOnly: true,
//                       //controller: TextEditingController(text: "",),
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontFamily: 'Space',
//                       ),
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                         fillColor: const Color(0xff393E46),
//                         filled: true,
//                         hintStyle: const TextStyle(
//                           color: Color(0xffEEEEEE),
//                           fontSize: 18,
//                           fontFamily: 'Space',
//                         ),
//                         hintText: "Translation will appear here",
//                         contentPadding: const EdgeInsets.symmetric(
//                           vertical: 20,
//                           horizontal: 10,
//                         ),
//                       ),
//                       maxLines: 5,
//                     ),
//                   ),
//                 ),