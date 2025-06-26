import 'package:ceritarakyatapp/register/RegisterScreen.dart';
import 'package:flutter/material.dart';
import 'login_animations.dart';

class LoginButton extends StatelessWidget {
  final LoginAnimations animations;
  final bool isLoading;
  final VoidCallback onPressed;
  final VoidCallback? onRegisterPressed;

  const LoginButton({
    Key? key,
    required this.animations,
    required this.isLoading,
    required this.onPressed,
    this.onRegisterPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Tombol Login
        ScaleTransition(
          scale: animations.buttonScaleAnimation,
          child: SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: isLoading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[700],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: isLoading
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Masuk...',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              )
                  : Text(
                'Masuk',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
        ),

        SizedBox(height: 20),

        // Text Daftar
        GestureDetector(
          onTap: () {
            // Arahkan ke RegisterScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterScreen(),
              ),
            );
          },
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Belum punya akun? ',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: 'Daftar Sekarang',
                  style: TextStyle(
                    color: Colors.brown[700],
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}