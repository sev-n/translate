import 'package:flutter/material.dart';
import 'bottomnav.dart';
import 'colors.dart';
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
        child: GNav(
          backgroundColor: mcgpalette,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade700,
          gap: 20,
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
              iconColor: Colors.white,
            ),
            GButton(
              icon: Icons.mic_rounded,
              text: 'Conversation',
              iconColor: Colors.white,
            ),
            GButton(
              icon: Icons.history,
              text: 'History',
              iconColor: Colors.white,
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Favorite',
              iconColor: Colors.white,
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Translate'),
        //elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF002945),
              ),
              child: Text(
                'Babel',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.three_p_rounded,
                color: Color(0xff002945),
              ),
              title: const Text('About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff264961),
                  )),
              //selected: selectedPage == 1,
              selectedTileColor: const Color(0xffB3BFC7),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.security,
                color: Color(0xff002945),
              ),
              title: const Text(
                'Privacy Policy',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xff264961),
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

// class Nav extends StatefulWidget {
//   const Nav({super.key});

//   @override
//   State<Nav> createState() => _NavState();
// }

// class _NavState extends State<Nav> {
  

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: GNav(
//         backgroundColor: mcgpalette,
//         color: Colors.white,
//         activeColor: Colors.white,
//         tabBackgroundColor: Colors.grey.shade700,
//         gap: 20,
//         selectedIndex: currentIndex,
//         onTabChange: (index) {
//           updateIndex(index);
//           debugPrint('Current Index: $currentIndex');
//         },
//         //padding: const EdgeInsets.all(16),
//         tabs: const [
//           GButton(
//             icon: Icons.home,
//             text: 'Home',
//             iconColor: Colors.white,
//           ),
//           GButton(
//             icon: Icons.mic_rounded,
//             text: 'Conversation',
//             iconColor: Colors.white,
//           ),
//           GButton(
//             icon: Icons.history,
//             text: 'History',
//             iconColor: Colors.white,
//           ),
//           GButton(
//             icon: Icons.favorite,
//             text: 'Favorite',
//             iconColor: Colors.white,
//           )
//         ],
//       ),
//     );
//   }
// }
