import 'package:flutter/material.dart';
import 'package:translate/utils/colors.dart';
import 'pages/bottom_nav_pages/UI/speech.dart';
import 'pages/bottom_nav_pages/UI/default_page.dart';
import 'pages/bottom_nav_pages/UI/discover.dart';
import 'pages/bottom_nav_pages/UI/history.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  //index
  int currentIndex = 0;

  void updateIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> pages = [
    const DefaultPage(),
    const Conversation(),
    const History(),
    const Favorite(),
  ];

  TextStyle myTextStyle = const TextStyle(
    fontFamily: 'Space',
  );

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
        elevation: 0,
        title: currentIndex != 3
            ? Text(
                "Babel: Translation App",
                style: TextStyle(fontFamily: 'gothic'),
              )
            : null,
        centerTitle: true,
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
                    top: 25), // Adjust the value as needed
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
                      fontSize: 18,
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
                    fontSize: 18,
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
