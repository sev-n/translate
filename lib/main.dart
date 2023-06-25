import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:translate/model/stt.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Beach/Beaches.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Cultural/Cultures.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Food/food.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/Landscape/landscapes.dart';
import 'package:translate/pages/bottom_nav_pages/discover%20pages/festival/festivals.dart';
import 'package:translate/utils/colors.dart';
import 'model/model.dart';
import 'model/show_hide_model.dart';
import 'model/swap_lang.dart';
import 'pages/bottom_nav_pages/trans_language.dart';
import 'pages/intro_page/introduction.dart';
import 'pages/side_menu/about.dart';
import 'pages/side_menu/privacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp
  ]);

  final prefs = await SharedPreferences.getInstance();

  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  const MyApp({super.key, required this.prefs});

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
        ChangeNotifierProvider<ShowState>(
          create: (_) => ShowState(),
        ),
        ChangeNotifierProvider<LanguagesStt>(
          create: (_) => LanguagesStt(),
        ),
        ChangeNotifierProvider<TransLanguageStt>(
          create: (_) => TransLanguageStt(),
        ),
        ChangeNotifierProvider<Swap>(
          create: (_) => Swap(),
        ),
        ChangeNotifierProvider<LanguagesSpokeStt>(
          create: (_) => LanguagesSpokeStt(),
        ),
        ChangeNotifierProvider<GetIndex>(
          create: (_) => GetIndex(),
        ),
        ChangeNotifierProvider<TranslatedText>(
          create: (_) => TranslatedText(),
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
            title: 'Babel',
            home: OneTimeWelcomePage(prefs: prefs),
            routes: {
              '/about': (context) => const About(),
              '/privacy': (context) => const Privacy(),
              '/lang': (context) => const SourceLanguage(),
              '/translang': (context) => const LanguagesToTranslate(),
              '/foods': (context) => const Foods(),
              '/cultures': (content) => const Cultures(),
              '/beaches': (content) => const Beaches(),
              '/festivals': (context) => const Festivals(),
              '/landscape': (context) => const Landscapes(),
            },
          );
        },
      ),
    );
  }
}
