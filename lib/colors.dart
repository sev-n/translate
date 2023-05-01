import 'package:flutter/material.dart';

const MaterialColor mcgpalette =
    MaterialColor(_mcgpalettePrimaryValue, <int, Color>{
  50: Color(0xFFE0E5E9),
  100: Color(0xFFB3BFC7),
  200: Color(0xFF8094A2),
  300: Color(0xFF4D697D),
  400: Color(0xFF264961),
  500: Color(_mcgpalettePrimaryValue),
  600: Color(0xFF00243E),
  700: Color(0xFF001F36),
  800: Color(0xFF00192E),
  900: Color(0xFF000F1F),
});
const int _mcgpalettePrimaryValue = 0xFF002945;

const MaterialColor mcgpaletteAccent =
    MaterialColor(_mcgpaletteAccentValue, <int, Color>{
  100: Color(0xFF5C92FF),
  200: Color(_mcgpaletteAccentValue),
  400: Color(0xFF0052F5),
  700: Color(0xFF0049DB),
});
const int _mcgpaletteAccentValue = 0xFF2970FF;
