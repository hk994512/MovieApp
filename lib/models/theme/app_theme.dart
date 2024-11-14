import 'package:flutter/material.dart';

const appStartupTheme = TextStyle(
  color: Colors.white,
);
var appTheme = ThemeData(
    appBarTheme:
        const AppBarTheme(iconTheme: IconThemeData(color: Colors.white)),
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: const TextTheme(
      bodyLarge: appStartupTheme,
      bodyMedium: appStartupTheme,
      bodySmall: appStartupTheme,
    ));
