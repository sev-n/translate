// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:translate/model/custom_leading.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/custom_search.dart';
import 'package:translate/utils/colors.dart';

bool isSpeakingCompleted = false;
bool iconChange = false;

Map<String, bool> iconStateLandscape = {
  'osmena': false,
  'kanlaon': false,
  'kabunian': false,
  'kitanglad': false,
  'dulang-dulang': false,
  'guiting-guiting': false,
  'halcon': false,
  'pinatubo': false,
  'pulag': false,
  'apo': false,
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

Map<String, GlobalKey> searchMapLandscapes = {
  'Osmena Peak': key1,
  'Mt. Kanlaon': key2,
  'Mt. Kabunian': key3,
  'Mt. Kitanglad': key4,
  'Mt. Dulang-dulang': key5,
  'Mt. Guiting-guiting': key6,
  'Mt. Halcon': key7,
  'Mt. Pinatubo': key8,
  'Mt. Pulag': key9,
  'Mt. Apo': key10
};

class KLandscapes extends StatefulWidget {
  const KLandscapes({super.key});

  @override
  State<KLandscapes> createState() => _LandscapesState();
}

class _LandscapesState extends State<KLandscapes> {
  speak(String text) async {
    final FlutterTts flutterTts = FlutterTts();
    String selectedLanguage = "fil-PH";
    List<dynamic> languages = await flutterTts.getLanguages;

    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeakingCompleted = true;
        iconStateLandscape['osmena'] = false;
        iconStateLandscape['kanlaon'] = false;
        iconStateLandscape['kabunian'] = false;
        iconStateLandscape['kitanglad'] = false;
        iconStateLandscape['dulang-dulang'] = false;
        iconStateLandscape['guiting-guiting'] = false;
        iconStateLandscape['halcon'] = false;
        iconStateLandscape['pinatubo'] = false;
        iconStateLandscape['pulag'] = false;
        iconStateLandscape['apo'] = false;
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
                        builder: (context) =>
                            ItemsSearch(map: searchMapLandscapes)),
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
                'assets/Landscape/landscape_bg.jpg',
                fit: BoxFit.cover,
              ),
              titlePadding: EdgeInsets.only(top: 5.h, bottom: 10.h),
              title: Text(
                "L A N D S C A P E S",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'gothic',
                  fontSize: 22.sp,
                ),
              ),
              centerTitle: true,
            ),
          ),
          //sliver items

          SliverToBoxAdapter(
            key: searchMapLandscapes['Osmena Peak'],
            child: Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Container(
                height: 581.h,
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
                            'assets/Landscape/osmena.jpg',
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
                              'Osmeña Peak',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  iconStateLandscape['osmena'] = true;
                                });
                                speak('Osmeña Peak');
                              },
                              icon: !iconStateLandscape['osmena']!
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
                          "Location: Cebu\n\n"
                          "Osmeña Peak, rising 1,013 meters above sea level, is regarded as Cebu's highest peak and a well-liked hiking destination in the Philippines due to its beautiful mountain vistas. It is situated in Dalaguete Municipality, often known as Cebu's Vegetable Basket. Rugged slopes that are evocative of the well-known Chocolate slopes in Bohol surround the rocky peak. ",
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
