import 'package:flutter/material.dart';

class LoginAnimations {
  final TickerProvider vsync;

  late AnimationController _logoAnimationController;
  late AnimationController _formAnimationController;
  late AnimationController _buttonAnimationController;

  late Animation<double> logoScaleAnimation;
  late Animation<double> logoFadeAnimation;
  late Animation<Offset> formSlideAnimation;
  late Animation<double> formFadeAnimation;
  late Animation<double> buttonScaleAnimation;

  LoginAnimations(this.vsync) {
    _initializeControllers();
    _initializeAnimations();
  }

  void _initializeControllers() {
    _logoAnimationController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: vsync,
    );

    _formAnimationController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: vsync,
    );

    _buttonAnimationController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: vsync,
    );
  }

  void _initializeAnimations() {
    logoScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoAnimationController,
      curve: Curves.elasticOut,
    ));

    logoFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _logoAnimationController,
      curve: Curves.easeOut,
    ));

    formSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _formAnimationController,
      curve: Curves.easeOutCubic,
    ));

    formFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _formAnimationController,
      curve: Curves.easeOut,
    ));

    buttonScaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonAnimationController,
      curve: Curves.elasticOut,
    ));
  }

  void startAnimations() async {
    _logoAnimationController.forward();
    await Future.delayed(Duration(milliseconds: 400));
    _formAnimationController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    _buttonAnimationController.forward();
  }

  void dispose() {
    _logoAnimationController.dispose();
    _formAnimationController.dispose();
    _buttonAnimationController.dispose();
  }
}