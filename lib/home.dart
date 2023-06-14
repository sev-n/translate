// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:translate/model/list_supported_lang.dart';
import 'package:translate/utils/colors.dart';
import 'pages/bottom_nav_pages/UI/speech.dart';
import 'pages/bottom_nav_pages/UI/default_page.dart';
import 'pages/bottom_nav_pages/UI/discover.dart';
import 'pages/bottom_nav_pages/UI/history.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //index
  int currentIndex = 0;
  stt.SpeechToText speech = stt.SpeechToText();
  List<stt.LocaleName> locales = [];
  bool speechEnabled = false;

  void updateIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> pages = [];

  TextStyle myTextStyle = const TextStyle(
    fontFamily: 'Space',
  );

  Future<void> getSupportedLanguages() async {
    await speech.initialize();
    List<stt.LocaleName> _locales = await speech.locales();
    setState(() {
      SttSupportedLanguages.supLanguanges = _locales;
    });

    for (var locale in locales) {
      debugPrint('Language: ${locale.name}, Locale Id: ${locale.localeId}');
    }
  }

  Future<void> initSpeech() async {
    bool success = await speech.initialize(
      onStatus: (String status) {
        if (status == 'done') {
          debugPrint("Status Done");
        }
      },
    );
    setState(() {
      speechEnabled = success;
    });
  }

  @override
  void initState() {
    super.initState();
    getSupportedLanguages();

    pages = [
      const DefaultPage(),
      Conversation(speech: speech, isInitialized: speechEnabled),
      const History(),
      const Favorite(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: false,
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          decoration: const BoxDecoration(
            color: darkColor,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: GNav(
              backgroundColor: darkColor,
              color: const Color(0xff131316),
              activeColor: Colors.white,
              gap: 20,
              textStyle: const TextStyle(
                fontFamily: 'Space',
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
              padding: const EdgeInsets.all(17),
              selectedIndex: currentIndex,
              onTabChange: (index) {
                updateIndex(index);
                debugPrint('Current Index: $currentIndex');
              },
              //padding: const EdgeInsets.all(16),
              tabs: const [
                GButton(
                  icon: Icons.home_outlined,
                  text: 'Home',
                  iconColor: Colors.white,
                  iconActiveColor: Colors.white,
                  rippleColor: Color(0xFF006A60),
                  backgroundColor: Color(0xFFff9190),
                ),
                GButton(
                  icon: Icons.mic_external_on_outlined,
                  text: 'Speech',
                  iconColor: Colors.white,
                  iconActiveColor: Colors.white,
                  rippleColor: Colors.amber,
                  backgroundColor: Colors.orange,
                ),
                GButton(
                  icon: Icons.history,
                  text: 'History',
                  iconColor: Colors.white,
                  iconActiveColor: Colors.white,
                  rippleColor: Colors.indigoAccent,
                  backgroundColor: Colors.indigoAccent,
                ),
                GButton(
                  icon: Icons.travel_explore_rounded,
                  text: 'Discover',
                  iconColor: Colors.white,
                  iconActiveColor: Colors.white,
                  rippleColor: Color(0xff35bbca),
                  backgroundColor: Color(0xff35bbca),
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: darkColor,
        //todo : use this section if we want to have a title on appbar
        elevation: 0,
        //todo : use this when you want to have a theme switcher
        // actions: [
        //   Padding(
        //     padding:
        //         const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
        //     child: Container(
        //       decoration: BoxDecoration(
        //         shape: BoxShape.rectangle,
        //         color: Colors.white70.withOpacity(0.1),
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //       child: IconButton(
        //         onPressed: () {
        //           setState(() {
        //             ThemeManager.isDarkMode = !ThemeManager.isDarkMode;
        //           });
        //         },
        //         icon: Icon(!ThemeManager.isDarkMode
        //             ? ThemeManager.iconDark
        //             : ThemeManager.iconLight),
        //       ),
        //     ),
        //   ),
        // ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
            //canvasColor: ThemeManager.isDarkMode ? darkColor : mcgpalette0,
            ),
        child: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const SafeArea(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Babel.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50), // Adjust the value as needed
                child: ListTile(
                  leading: const Icon(
                    Icons.three_p_rounded,
                    color: darkColor,
                  ),
                  title: const Text(
                    'About',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'GothicA1',
                      color: darkColor,
                    ),
                  ),
                  //selected: selectedPage == 1,
                  selectedTileColor: const Color(0xfffdfffc),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/about');
                  },
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.security,
                  color: darkColor,
                ),
                title: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'GothicA1',
                    color: darkColor,
                  ),
                ),
                //selected: selectedPage == 2,
                selectedTileColor: Colors.grey[400],
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/privacy');
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(child: pages[currentIndex]),
    );
  }
}
