import 'package:flutter/material.dart';
import 'package:letterboxd/presentation/pages/on_Boarding.dart';
import 'package:letterboxd/presentation/theme/theme_manager.dart';

void main() => runApp(const LetterboxdApp());

class LetterboxdApp extends StatelessWidget {
  const LetterboxdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.letterboxdTheme,
      home: const OnBoarding(),
      // home: const SplashScreen(),
    );
  }
}
