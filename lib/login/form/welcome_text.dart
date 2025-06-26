import 'package:flutter/material.dart';

import 'login_animations.dart';

class WelcomeText extends StatelessWidget {
  final LoginAnimations animations;

  const WelcomeText({Key? key, required this.animations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animations.formSlideAnimation,
      child: FadeTransition(
        opacity: animations.formFadeAnimation,
        child: Column(
          children: [
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown[800],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Masuk ke dunia cerita rakyat Nusantara',
              style: TextStyle(
                fontSize: 16,
                color: Colors.brown[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}