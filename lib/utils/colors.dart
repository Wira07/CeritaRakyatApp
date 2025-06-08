import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF8D6E63);
  static const Color primaryLight = Color(0xFFBCAAA4);
  static const Color primaryDark = Color(0xFF5D4037);
  static const Color secondary = Color(0xFFFF8F00);
  static const Color secondaryLight = Color(0xFFFFB74D);
  static const Color accent = Color(0xFF2196F3);
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFB00020);

  // Custom colors for wisdom card
  static const Color wisdomBackground = Color(0xFFFFF3E0);
  static const Color wisdomBorder = Color(0xFFFFCC02);

  // Quiz colors
  static const Color quizBackground = Color(0xFFE3F2FD);
  static const Color quizBorder = Color(0xFF2196F3);

  static MaterialColor get primaryMaterialColor {
    return MaterialColor(
      primary.value,
      <int, Color>{
        50: Color(0xFFF3E5AB),
        100: Color(0xFFE0C097),
        200: Color(0xFFBCAAA4),
        300: Color(0xFFA1887F),
        400: Color(0xFF8D6E63),
        500: primary,
        600: Color(0xFF6D4C41),
        700: Color(0xFF5D4037),
        800: Color(0xFF4E342E),
        900: Color(0xFF3E2723),
      },
    );
  }
}