import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTheme {
  static final MyTheme Instance = MyTheme();

  ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: ColorScheme.light(
      background: Color.fromARGB(255, 255, 255, 255),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 127, 158, 238),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 22,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 23, 48, 148),
        fontWeight: FontWeight.w600,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 54, 73, 150),
      ),
    ),
  );

  ThemeData dark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      background: Color.fromARGB(255, 0, 0, 0),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 22,
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 243, 236, 236),
        fontWeight: FontWeight.w600,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 51, 67, 137),
      ),
    ),
  );
}
