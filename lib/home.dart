import 'package:flutter/material.dart';
import 'package:translate/colors.dart';
import 'pages/bottom_nav_pages/conversation.dart';
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
    return Scaffold(
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: dark,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
              child: GNav(
                backgroundColor: const Color(0xff131316),
                color: const Color(0xff131316),
                activeColor: Colors.white,
                gap: 20,
                padding: const EdgeInsets.all(18),
                tabBackgroundColor: Colors.grey.shade900,
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
                    iconActiveColor: Color(0xFF006A60),
                    rippleColor: Color(0xFF006A60),
                  ),
                  GButton(
                    icon: Icons.mic_rounded,
                    text: 'Conversation',
                    iconColor: Colors.orange,
                    iconActiveColor: Colors.orange,
                    rippleColor: Colors.amber,
                  ),
                  GButton(
                    icon: Icons.history,
                    text: 'History',
                    iconColor: Colors.indigo,
                    iconActiveColor: Colors.indigo,
                    rippleColor: Colors.indigoAccent,
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: 'Favorite',
                    iconColor: Colors.pink,
                    iconActiveColor: Colors.pink,
                    rippleColor: Colors.pinkAccent,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'BABEL',
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
            padding: const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white70.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: IconButton(
                icon: isDarkMode
                    ? const Icon(Icons.wb_sunny, color: Colors.amberAccent)
                    : const Icon(Icons.nightlight_round,
                        color: Colors.deepPurpleAccent),
                onPressed: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                  });
                },
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff131316),
              ),
              child: Text(
                'Babel',
                style: TextStyle(
                  fontFamily: 'Morgenwalsh',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                  color: Color(0xfffdfffc),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.three_p_rounded,
                color: Color(0xff011627),
              ),
              title: const Text('About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff011627),
                  )),
              //selected: selectedPage == 1,
              selectedTileColor: const Color(0xfffdfffc),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.security,
                color: Color(0xff011627),
              ),
              title: const Text(
                'Privacy Policy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff011627),
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
      body: pages[currentIndex],
    );
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
