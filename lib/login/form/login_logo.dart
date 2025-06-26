import 'package:flutter/material.dart';
import 'login_animations.dart';

class LoginLogo extends StatelessWidget {
  final LoginAnimations animations;

  const LoginLogo({Key? key, required this.animations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animations.logoScaleAnimation,
      child: FadeTransition(
        opacity: animations.logoFadeAnimation,
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.brown[700],
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.brown.withOpacity(0.3),
                blurRadius: 15,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            Icons.auto_stories,
            size: 60,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}