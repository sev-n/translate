import 'package:flutter/material.dart';
import 'package:translate/pages/utils/colors.dart';
import 'color_model.dart';
import 'pages/bottom_nav_pages/speech.dart';
import 'pages/bottom_nav_pages/default_page.dart';
import 'pages/bottom_nav_pages/favorite.dart';
import 'pages/bottom_nav_pages/history.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //darkmode

  //index
  int currentIndex = 0;

  void updateIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> pages = [
    const DefaultPage(),
    const Conversation(),
    const History(),
    const Favorite(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.isDarkMode
            ? ThemeManager.lightTheme
            : ThemeManager.darkTheme,
        home: Theme(
          data: ThemeManager.isDarkMode
              ? ThemeManager.darkTheme
              : ThemeManager.lightTheme,
          child: Scaffold(
            bottomNavigationBar: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: ThemeManager.navColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  child: GNav(
                    backgroundColor: ThemeManager.navColor,
                    color: const Color(0xff131316),
                    activeColor: Colors.white,
                    gap: 20,
                    padding: const EdgeInsets.all(18),
                    selectedIndex: currentIndex,
                    onTabChange: (index) {
                      updateIndex(index);
                      debugPrint('Current Index: $currentIndex');
                    },
                    //padding: const EdgeInsets.all(16),
                    tabs: const [
                      GButton(
                        icon: Icons.home,
                        text: 'Home',
                        iconColor: Color(0xFF006A60),
                        iconActiveColor: Colors.white,
                        rippleColor: Color(0xFF006A60),
                        backgroundColor: Color(0xFF006A60),
                      ),
                      GButton(
                        icon: Icons.mic_rounded,
                        text: 'Speech',
                        iconColor: Colors.orange,
                        iconActiveColor: Colors.white,
                        rippleColor: Colors.amber,
                        backgroundColor: Colors.orange,
                      ),
                      GButton(
                        icon: Icons.history,
                        text: 'History',
                        iconColor: Colors.indigo,
                        iconActiveColor: Colors.white,
                        rippleColor: Colors.indigoAccent,
                        backgroundColor: Colors.indigoAccent,
                      ),
                      GButton(
                        icon: Icons.favorite,
                        text: 'Discover',
                        iconColor: Colors.pink,
                        iconActiveColor: Colors.white,
                        rippleColor: Colors.pinkAccent,
                        backgroundColor: Colors.pinkAccent,
                      )
                    ],
                  ),
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: ThemeManager.isDarkMode ? vbg : mcgpalette0,
              title: const Text(
                'Babel',
                style: TextStyle(
                  fontFamily: 'Morgenwalsh',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
              elevation: 0,
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white70.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          ThemeManager.isDarkMode = !ThemeManager.isDarkMode;
                        });
                      },
                      icon: Icon(!ThemeManager.isDarkMode
                          ? ThemeManager.iconDark
                          : ThemeManager.iconLight),
                    ),
                  ),
                ),
              ],
            ),
            drawer: Theme(
              data: Theme.of(context).copyWith(
                  //canvasColor: ThemeManager.isDarkMode ? vbg : mcgpalette0,
                  ),
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: ThemeManager.isDarkMode ? vbg : mcgpalette0,
                      ),
                      child: Text(
                        'Babel',
                        style: TextStyle(
                          fontFamily: 'Morgenwalsh',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          color:
                              ThemeManager.isDarkMode ? lightColor : darkColor,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.three_p_rounded,
                        color:
                            ThemeManager.isDarkMode ? Colors.black : darkColor,
                      ),
                      title: Text('About',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ThemeManager.isDarkMode
                                ? Colors.black
                                : darkColor,
                          )),
                      //selected: selectedPage == 1,
                      selectedTileColor: const Color(0xfffdfffc),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/about');
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.security,
                        color:
                            ThemeManager.isDarkMode ? Colors.black : darkColor,
                      ),
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ThemeManager.isDarkMode
                              ? Colors.black
                              : darkColor,
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
            body: pages[currentIndex],
          ),
        ));
  }
}

final dropdownFocusNode = FocusNode();

class ExampleDropdownButton extends StatefulWidget {
  const ExampleDropdownButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExampleDropdownButtonState createState() => _ExampleDropdownButtonState();
}

class _ExampleDropdownButtonState extends State<ExampleDropdownButton> {
  String selectedValue = 'en';

  final languages = {'English': 'en', 'Filipino': 'tagalog'};

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      focusNode: dropdownFocusNode,
      value: selectedValue,
      onChanged: (newValue) {
        setState(() {
          selectedValue = newValue!;
          debugPrint(selectedValue);
        });
      },
      focusColor: Colors.white,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.pushNamed(context, '/languages');
      },
      items: languages.entries.map((entry) {
        return DropdownMenuItem<String>(
          value: entry.value,
          child: Text(entry.key),
        );
      }).toList(),
      underline: const SizedBox.shrink(),
    );
  }
}
