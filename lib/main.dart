import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Beach/Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Cultural/Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Food/Foods.dart';
import 'package:translate/pages/utils/colors.dart';
import 'home.dart';
import 'model/model.dart';
import 'pages/bottom_nav_pages/trans_language.dart';
import 'pages/side_menu/about.dart';
import 'pages/side_menu/privacy.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SourceLanguageModel>(
          create: (_) => SourceLanguageModel(),
        ),
        ChangeNotifierProvider<TranslatedLanguageModel>(
          create: (_) => TranslatedLanguageModel(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'gothic',
              primarySwatch: accent,
            ),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            home: const HomePage(),
            routes: {
              '/about': (context) => const About(),
              '/privacy': (context) => const Privacy(),
              '/lang': (context) => const SourceLanguage(),
              '/translang': (context) => const LanguagesToTranslate(),
              '/foods': (context) => const Foods(),
              '/cultures': (content) => const Cultures(),
              '/beaches': (content) => const Beaches(),
              // '/page3': (context) => const Page3(),
              // '/languages': (context) => const MyLanguageUI(),
            },
          );
        },
      ),
    );
  }
}
