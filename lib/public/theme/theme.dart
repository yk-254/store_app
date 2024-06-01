import 'package:flutter/material.dart';
import 'package:get/get.dart';

var themeVar = Get.theme;
ThemeData myTheme() {
  return ThemeData(
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.amber,
          onPrimary: Colors.white,
          secondary: Color(0xff012D74),
          onSecondary: Colors.white,
          error: Colors.black,
          onError: Colors.black,
          background: Colors.black,
          onBackground: Colors.black,
          surface: Colors.black,
          onSurface: Colors.black),
      scaffoldBackgroundColor: Color.fromARGB(255, 239, 238, 238),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.white))));
}
