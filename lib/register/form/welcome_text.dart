import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Daftar Akun',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Bergabunglah dan jelajahi cerita rakyat Nusantara',
          style: TextStyle(
            fontSize: 16,
            color: Colors.brown[600],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}