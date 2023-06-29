// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate/model/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconStateFood = {
  'kimchi': false,
  'bibimbap': false,
  'tteokbokki': false,
  'bulgogi': false,
  'jjigae': false,
  'jajangmyeon': false,
};

final key1 = GlobalKey();
final key2 = GlobalKey();
final key3 = GlobalKey();
final key4 = GlobalKey();
final key5 = GlobalKey();
final key6 = GlobalKey();
final key7 = GlobalKey();
final key8 = GlobalKey();
final key9 = GlobalKey();
final key10 = GlobalKey();

Map<String, GlobalKey> searchMapFoods = {
  'Kimchi': key1,
  'Bibimbap': key2,
  'Tteokbokki': key3,
  'Bulgogi': key4,
  'Jjigae': key5,
  'Jajangmyeon': key6,
};

class KFoods extends StatefulWidget {
  const KFoods({super.key});

  @override
  State<KFoods> createState() => _FoodsState();
}

class _FoodsState extends State<KFoods> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeakingCompleted = true;
        iconStateFood['kimchi'] = false;
      });
    });

    if (!languages.contains(selectedLanguage)) {
      // Language not supported
      debugPrint("Selected language is not supported on this device");
      return;
    } else {
      flutterTts.setLanguage(selectedLanguage);
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }
    setState(() {
      isSpeakingCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemsSearch(map: searchMapFoods)),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ],
            backgroundColor: accent,
            leading: const LeadingWidget(),
            expandedHeight: 250,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/Foods/FDC.png',
                fit: BoxFit.cover,
              ),
              titlePadding: EdgeInsets.only(top: 5.h, bottom: 10.h),
              title: Text(
                "F O O D S",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'gothic',
                  fontSize: 22.sp,
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            key: searchMapFoods['Kimchi'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 500.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.w),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            'assets/Foods/KIMCHI.jpg',
                            fit: BoxFit.cover,
                            width: 400.w,
                            height: 250.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kimchi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['kimchi'] = true;
                                });
                                speak('Kimchi');
                              },
                              icon: !iconStateFood['kimchi']!
                                  ? const Icon(
                                      Icons
                                          .volume_down_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Color(0xff35bbca),
                                    )
                                  : const Icon(
                                      Icons
                                          .volume_up_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Colors.indigoAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Kimchi/Kimchee is a traditional Korean side dish made from fermented cabbage, radish, or cucumber. It is often categorized by the main vegetable ingredient used to make it. Kimchi is a staple food in Korean cuisine",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: searchMapFoods['Bibimbap'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.w),
                        child: Image.asset(
                          'assets/Foods/BIBIMBAP.jpg',
                          fit: BoxFit.cover,
                          width: 400.w,
                          height: 220.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bibimbap',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['bibimbap'] = true;
                                });
                                speak('Bibimbap');
                              },
                              icon: !iconStateFood['bibimbap']!
                                  ? const Icon(
                                      Icons
                                          .volume_down_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Color(0xff35bbca),
                                    )
                                  : const Icon(
                                      Icons
                                          .volume_up_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Colors.indigoAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Bibimbap is probably one of the most well-known and beloved Korean dishes to many people. Even if people don't know anything about Korea, it's not too difficult to find people who had bibimbap sometime in their lives.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: searchMapFoods['Tteokbokki'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.w),
                        child: Image.asset(
                          'assets/Foods/TTEOKBOKKI.jpg',
                          fit: BoxFit.cover,
                          width: 400.w,
                          height: 220.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tteokbokki',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['tteokbokki'] = true;
                                });
                                speak('Tteokbokki');
                              },
                              icon: !iconStateFood['tteokbokki']!
                                  ? const Icon(
                                      Icons
                                          .volume_down_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Color(0xff35bbca),
                                    )
                                  : const Icon(
                                      Icons
                                          .volume_up_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Colors.indigoAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Tteokbokki is chewy rice cakes cooked in a red, spicy broth. It's a popular Korean street food. When I was a student coming home from school it was hard to resist the spicy rice cakes sold by vendors on the street! They would have big vats of tteokbokki and just keep stirring and stirring.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: searchMapFoods['Bulgogi'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.w),
                        child: Image.asset(
                          'assets/Foods/BULGOGI.jpg',
                          fit: BoxFit.cover,
                          width: 400.w,
                          height: 220.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bulgogi',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['bulgogi'] = true;
                                });
                                speak('Bulgogi');
                              },
                              icon: !iconStateFood['bulgogi']!
                                  ? const Icon(
                                      Icons
                                          .volume_down_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Color(0xff35bbca),
                                    )
                                  : const Icon(
                                      Icons
                                          .volume_up_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Colors.indigoAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Bulgogi means 'fire meat'. It is often made with tender parts of beef, pork or chicken. However, in general terms, unless spicified, bulgogi is made with beef. Undoubtedly it is one of the most well-known Korean tranditional foods and it has been around for thousands of years.  ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: searchMapFoods['Jjigae'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.w),
                        child: Image.asset(
                          'assets/Foods/JJIGAE.jpg',
                          fit: BoxFit.cover,
                          width: 400.w,
                          height: 220.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Jjigae',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['jjigae'] = true;
                                });
                                speak('Jjigae');
                              },
                              icon: !iconStateFood['jjigae']!
                                  ? const Icon(
                                      Icons
                                          .volume_down_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Color(0xff35bbca),
                                    )
                                  : const Icon(
                                      Icons
                                          .volume_up_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Colors.indigoAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Kimchi-jjigae or kimchi stew is one of the most-loved of all the stews in Korean cuisine. It's a warm, hearty, spicy, savory, delicious dish that pretty much everyone loves. As long as they can handle spicy food, I never met a person who didn't like kimchi-jjigae.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            key: searchMapFoods['Jajangmyeon'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 520.h,
                decoration: BoxDecoration(
                  color: const Color(0xff393E46),
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.w),
                        child: Image.asset(
                          'assets/Foods/JAJANGMYEON.jpg',
                          fit: BoxFit.cover,
                          width: 400.w,
                          height: 220.h,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Jajangmyeon',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateFood['jajangmyeon'] = true;
                                });
                                speak('Jajangmyeon');
                              },
                              icon: !iconStateFood['jajangmyeon']!
                                  ? const Icon(
                                      Icons
                                          .volume_down_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Color(0xff35bbca),
                                    )
                                  : const Icon(
                                      Icons
                                          .volume_up_rounded, // if clicked change color and icon
                                      size: 30,
                                      color: Colors.indigoAccent,
                                    ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: Text(
                          "Jjajangmyeon is everybody's favorite food. It's actually a very popular korean chinese dish, created by early Chinese immigrants in Korea, catering to Korea tastes. Tangsuyuk(sweet and souor pork) is another example.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
