import 'package:flutter/material.dart';
import 'models/theme/app_theme.dart';
import 'models/widgets/splash_screen.dart';


void main() => runApp(MaterialApp(
    title: 'Movie App',
    debugShowCheckedModeBanner: false,
    theme: appTheme,
    home: const SplashScreen()));
