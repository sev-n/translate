// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// import 'colors.dart';
// import 'pages/bottom_nav_pages/conversation.dart';
// import 'pages/bottom_nav_pages/default_page.dart';
// import 'pages/bottom_nav_pages/favorite.dart';
// import 'pages/bottom_nav_pages/history.dart';

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
//         selectedIndex: _selectedIndex,
//         onTabChange: (int index) {
//           setState(() {
//             _selectedIndex = index;
//           });
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

// class BottomNavPages {
//   int currentIndex = 0;

//   final List<Widget> pages = [
//     const DefaultPage(),
//     const Conversation(),
//     const History(),
//     const Favorite(),
//   ];

//   int getIndex() => currentIndex;
// }
