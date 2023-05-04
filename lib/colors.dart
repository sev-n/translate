import 'package:flutter/material.dart';

const MaterialColor dark = MaterialColor(_darkPrimaryValue, <int, Color>{
  50: Color(0xFFE3E3E3),
  100: Color(0xFFB8B8B9),
  200: Color(0xFF89898B),
  300: Color(0xFF5A5A5C),
  400: Color(0xFF363639),
  500: Color(_darkPrimaryValue),
  600: Color(0xFF111113),
  700: Color(0xFF0E0E10),
  800: Color(0xFF0B0B0C),
  900: Color(0xFF060606),
});
const int _darkPrimaryValue = 0xFF131316;

const MaterialColor darkAccent = MaterialColor(_darkAccentValue, <int, Color>{
  100: Color(0xFFFF4E4E),
  200: Color(_darkAccentValue),
  400: Color(0xFFE70000),
  700: Color(0xFFCE0000),
});
const int _darkAccentValue = 0xFFFF1B1B;
