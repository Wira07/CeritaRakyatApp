import 'package:flutter/material.dart';

class RegisterAnimations {
  late AnimationController logoAnimationController;
  late AnimationController formAnimationController;
  late AnimationController buttonAnimationController;

  late Animation<double> logoScaleAnimation;
  late Animation<double> logoFadeAnimation;
  late Animation<Offset> formSlideAnimation;
  late Animation<double> formFadeAnimation;
  late Animation<double> buttonScaleAnimation;

  void initializeAnimations(TickerProvider vsync) {
    // Initialize animation controllers
    logoAnimationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: vsync,
    );

    formAnimationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: vsync,
    );

    buttonAnimationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: vsync,
    );

    // Initialize animations
    logoScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: logoAnimationController,
      curve: Curves.elasticOut,
    ));

    logoFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: logoAnimationController,
      curve: Curves.easeOut,
    ));

    formSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: formAnimationController,
      curve: Curves.easeOutCubic,
    ));

    formFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: formAnimationController,
      curve: Curves.easeOut,
    ));

    buttonScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: buttonAnimationController,
      curve: Curves.elasticOut,
    ));
  }

  void startAnimations() async {
    // Start logo animation immediately
    logoAnimationController.forward();

    // Start form animation after delay
    await Future.delayed(Duration(milliseconds: 400));
    formAnimationController.forward();

    // Start button animation after form
    await Future.delayed(Duration(milliseconds: 300));
    buttonAnimationController.forward();
  }

  void dispose() {
    logoAnimationController.dispose();
    formAnimationController.dispose();
    buttonAnimationController.dispose();
  }
}