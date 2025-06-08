import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

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
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}