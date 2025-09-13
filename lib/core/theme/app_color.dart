import 'package:flutter/material.dart';

class AppColor {
  AppColor._(); // coverage:ignore-line

  static const Color primaryColor = Color(0xFF1C3E66);
  static const Color secondaryColor = Color.fromARGB(255, 215, 170, 34);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color blackGrey = Color.fromARGB(255, 39, 39, 39);
  static const Color backgroundBlack = Color.fromARGB(255, 37, 37, 37);
  static const Color backgroundWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color backgroundBlue = Color.fromARGB(255, 236, 246, 255);
  static const Color lightGray = Color.fromARGB(255, 215, 215, 215);
  static const Color lightRed = Color.fromARGB(255, 255, 202, 202);
  static const Color lightGreen = Color.fromARGB(255, 212, 255, 202);

  static const MaterialColor primarySwatch = MaterialColor(0xFF1C3E66, {
    50: Color(0xFF8e9fb3),
    100: Color(0xFF778ba3),
    200: Color(0xFF607894),
    300: Color(0xFF496585),
    400: Color(0xFF335175),
    500: Color(0xFF1C3E66),
    600: Color(0xFF19385c),
    700: Color(0xFF163252),
    800: Color(0xFF142b47),
    900: Color(0xFF11253d),
  });

  static const MaterialColor neutral = MaterialColor(0xFF0A0A0A, {
    50: Color(0xFF0A0A0A),
    100: Color(0xFF0A0A0A),
    200: Color(0xFF616161),
    300: Color(0xFF757575),
    400: Color(0xFF9E9E9E),
    500: Color(0xFFC2C2C2),
    600: Color(0xFFE0E0E0),
    700: Color(0xFFEDEDED),
    800: Color(0xFFF5F5F5),
    900: Color(0xFFFFFFFF),
  });

  static const MaterialColor info = MaterialColor(0xFF1E85EC, {
    50: Color(0xFFD1F0FE),
    100: Color(0xFFD1F0FE),
    200: Color(0xFFA4DEFD),
    300: Color(0xFF76C5F9),
    400: Color(0xFF54ABF3),
    500: Color(0xFF1E85EC),
    600: Color(0xFF1567CA),
    700: Color(0xFF0F4DA9),
    800: Color(0xFF093688),
    900: Color(0xFF052671),
  });

  static const MaterialColor success = MaterialColor(0xFF00B200, {
    50: Color(0xFFDAFBC8),
    100: Color(0xFFDAFBC8),
    200: Color(0xFFAEF794),
    300: Color(0xFF74E75C),
    400: Color(0xFF41D034),
    500: Color(0xFF00B200),
    600: Color(0xFF00990D),
    700: Color(0xFF008016),
    800: Color(0xFF00671A),
    900: Color(0xFF00551D),
  });

  static const MaterialColor danger = MaterialColor(0xFFDB1A5D, {
    50: Color(0xFFFDD2D0),
    100: Color(0xFFFDD2D0),
    200: Color(0xFFFBA2A7),
    300: Color(0xFFF47386),
    400: Color(0xFFE94F75),
    500: Color(0xFFDB1A5D),
    600: Color(0xFFBC135E),
    700: Color(0xFF9D0D5B),
    800: Color(0xFF7F0854),
    900: Color(0xFF69044F),
  });

  static const MaterialColor warning = MaterialColor(0xFFDDAD00, {
    50: Color(0xFFFDF6CA),
    100: Color(0xFFFDF6CA),
    200: Color(0xFFFBEC96),
    300: Color(0xFFF4DB61),
    400: Color(0xFFEAC83A),
    500: Color(0xFFDDAD00),
    600: Color(0xFFBE9000),
    700: Color(0xFF9F7500),
    800: Color(0xFF805B00),
    900: Color(0xFF6A4900),
  });
}
