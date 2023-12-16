import 'package:flutter/material.dart';
import 'package:uas_prak_mobile/view/splashscreen.dart';
import 'package:uas_prak_mobile/view/surah.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/surah': (context) => SurahDetail(),
      },
    );
  }
}
