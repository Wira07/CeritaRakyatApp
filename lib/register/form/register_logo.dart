import 'package:flutter/material.dart';

class RegisterLogo extends StatelessWidget {
  final Animation<double> scaleAnimation;
  final Animation<double> fadeAnimation;

  const RegisterLogo({
    Key? key,
    required this.scaleAnimation,
    required this.fadeAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Container(
          width: 100,
          height: 100,
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
            Icons.person_add,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}