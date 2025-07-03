import 'package:flutter/material.dart';
import 'screens/splash_screen/splash_screen.dart';

void main() {
  runApp(CeritaRakyatApp());
}

class CeritaRakyatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cerita Rakyat Nusantara',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Roboto',
      ),
      home: SplashScreen(), // Changed from HomeScreen() to SplashScreen()
      debugShowCheckedModeBanner: false,
    );
  }
}
