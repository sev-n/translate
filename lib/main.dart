import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translate/floatnav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: const HiddenDrawer(),
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue,
            secondaryHeaderColor: Colors.red,
            scaffoldBackgroundColor: const Color(0xffEEEEEE),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                color: Color(0xff161616),
              ),
              bodyMedium: TextStyle(
                color: Color(0xff161616),
              ),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor:
                Colors.deepPurple, // set the primary color for dark mode
            secondaryHeaderColor:
                Colors.amber, // set the accent color for dark mode
            colorScheme: const ColorScheme.dark(
              background: Color(0xff161616),
              surface: Color(0xff161616),
            ),
            // set the background color for dark mode
            // set the scaffold background color for dark mode
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                  color: Colors.white), // set the text color for dark mode
              bodyMedium: TextStyle(
                  color: Colors.white), // set the text color for dark mode
            ),
          ),
          themeMode: ThemeMode.dark,
          // routes: {
          //   '/about': (context) => const About(),
          //   '/privacy': (context) => const Privacy(),
          //   // '/page2': (context) => const Page2(),
          //   // '/page3': (context) => const Page3(),
          //   // '/languages': (context) => const MyLanguageUI(),
          // },
        );
      },
    );
  }
}
