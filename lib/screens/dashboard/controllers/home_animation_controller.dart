import 'package:flutter/material.dart';

class HomeAnimationController {
  late AnimationController headerAnimationController;
  late AnimationController contentAnimationController;
  late AnimationController fabAnimationController;

  late Animation<Offset> headerSlideAnimation;
  late Animation<double> headerFadeAnimation;
  late Animation<double> contentFadeAnimation;
  late Animation<Offset> contentSlideAnimation;
  late Animation<double> fabScaleAnimation;

  void initializeAnimations(TickerProvider vsync) {
    // Initialize animation controllers
    headerAnimationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: vsync,
    );

    contentAnimationController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: vsync,
    );

    fabAnimationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: vsync,
    );

    // Initialize animations
    headerSlideAnimation = Tween<Offset>(
      begin: Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: headerAnimationController,
      curve: Curves.easeOutBack,
    ));

    headerFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: headerAnimationController,
      curve: Curves.easeOut,
    ));

    contentFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: contentAnimationController,
      curve: Curves.easeOut,
    ));

    contentSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: contentAnimationController,
      curve: Curves.easeOutCubic,
    ));

    fabScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: fabAnimationController,
      curve: Curves.elasticOut,
    ));
  }

  void startAnimations() async {
    headerAnimationController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    contentAnimationController.forward();
    await Future.delayed(Duration(milliseconds: 500));
    fabAnimationController.forward();
  }

  void dispose() {
    headerAnimationController.dispose();
    contentAnimationController.dispose();
    fabAnimationController.dispose();
  }
}