import 'package:flutter/material.dart';
import 'package:ceritarakyatapp/register/RegisterScreen.dart';
import '../screens/home_screen.dart';
import 'auth/auth_service.dart';
import 'form/login_animations.dart';
import 'form/login_button.dart';
import 'form/login_form.dart';
import 'form/login_logo.dart';
import 'form/welcome_text.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  late LoginAnimations _animations;
  final AuthService _authService = AuthService();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _animations = LoginAnimations(this);
    _animations.startAnimations();
  }

  @override
  void dispose() {
    _animations.dispose();
    super.dispose();
  }

  void _handleLogin(String email, String password, bool rememberMe) async {
    setState(() => _isLoading = true);

    final success = await _authService.login(email, password, rememberMe);

    setState(() => _isLoading = false);

    if (success) {
      _navigateToHome();
      _showSuccessMessage();
    }
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut),
              ),
              child: child,
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 600),
      ),
    );
  }

  void _showSuccessMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Text('Selamat datang di Cerita Rakyat Nusantara!'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 60),
              LoginLogo(animations: _animations),
              SizedBox(height: 40),
              WelcomeText(animations: _animations),
              SizedBox(height: 40),
              LoginForm(
                animations: _animations,
                onLogin: _handleLogin,
              ),
              SizedBox(height: 32),
              LoginButton(
                animations: _animations,
                isLoading: _isLoading,
                onPressed: () => _handleLogin('', '', false), // Will be handled by form
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}