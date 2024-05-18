import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTheme {
  static final MyTheme Instance = MyTheme();
  ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
      colorScheme: ColorScheme.light(
        background: Color.fromARGB(255, 97, 97, 97),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 22,
          color: Color.fromARGB(255, 23, 48, 148),
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 23, 48, 148),
          fontWeight: FontWeight.w600,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 93, 109, 173),
        ),
      ));
  ThemeData dark = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      background: Color.fromARGB(255, 0, 0, 0),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 22,
        color: Color.fromARGB(255, 78, 77, 78),
        
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Color.fromARGB(255, 228, 228, 235),
        fontWeight: FontWeight.w600,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: Color.fromARGB(255, 35, 60, 171),
      ),
    ),
  );
  
}
