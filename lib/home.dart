import 'package:flutter/material.dart';
import 'package:translate/pages/utils/colors.dart';
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
  bool isDarkMode = false;

  final IconData _iconLight = Icons.wb_sunny;
  final IconData _iconDark = Icons.nights_stay;
  Color get navColor => isDarkMode ? darkColor : lightColor;

  final ThemeData _lightTheme =
      ThemeData(primarySwatch: lightColor, brightness: Brightness.light);

  final ThemeData _darkTheme =
      ThemeData(primarySwatch: darkColor, brightness: Brightness.dark);

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
        theme: isDarkMode ? _lightTheme : _darkTheme,
        home: Theme(
          data: isDarkMode ? _darkTheme : _lightTheme,
          child: Scaffold(
            bottomNavigationBar: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                color: navColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 15.0),
                  child: GNav(
                    backgroundColor: navColor,
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
              backgroundColor: isDarkMode ? darkColor : lightColor,
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
                          isDarkMode = !isDarkMode;
                        });
                      },
                      icon: Icon(!isDarkMode ? _iconDark : _iconLight),
                    ),
                  ),
                ),
              ],
            ),
            drawer: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: isDarkMode ? darkColor : lightColor,
              ),
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Text(
                        'Babel',
                        style: TextStyle(
                          fontFamily: 'Morgenwalsh',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4,
                          color: isDarkMode ? lightColor : darkColor,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.three_p_rounded,
                        color: isDarkMode ? lightColor : darkColor,
                      ),
                      title: Text('About',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? lightColor : darkColor,
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
                        color: isDarkMode ? lightColor : darkColor,
                      ),
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? lightColor : darkColor,
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
