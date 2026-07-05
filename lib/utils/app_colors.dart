import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF4A90E2);
  static const Color primaryDark = Color(0xFF2C6B9F);
  static const Color primaryLight = Color(0xFF7BB0F7);
  static const Color primaryVeryLight = Color(0xFFE8F0FE);

  // Secondary Colors
  static const Color secondary = Color(0xFFF5A623);
  static const Color secondaryDark = Color(0xFFC47D00);
  static const Color secondaryLight = Color(0xFFFFD966);

  // Success Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color successDark = Color(0xFF388E3C);
  static const Color successLight = Color(0xFF81C784);

  // Error Colors
  static const Color error = Color(0xFFE53935);
  static const Color errorDark = Color(0xFFC62828);
  static const Color errorLight = Color(0xFFEF5350);

  // Warning Colors
  static const Color warning = Color(0xFFFF9800);
  static const Color warningDark = Color(0xFFE65100);
  static const Color warningLight = Color(0xFFFFB74D);

  // Info Colors
  static const Color info = Color(0xFF2196F3);
  static const Color infoDark = Color(0xFF1565C0);
  static const Color infoLight = Color(0xFF64B5F6);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // Background Colors
  static const Color backgroundLight = Color(0xFFF8FAFC);
  static const Color backgroundDark = Color(0xFF121212);

  // Card Colors
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color cardDark = Color(0xFF1E1E1E);

  // Category Colors
  static const Map<String, Color> categoryColors = {
    'Vocabulary': Color(0xFF4A90E2),
    'Grammar': Color(0xFFE74C3C),
    'Phrases': Color(0xFF2ECC71),
    'Pronunciation': Color(0xFFF39C12),
    'Conversation': Color(0xFF9B59B6),
    'Reading': Color(0xFF1ABC9C),
    'Writing': Color(0xFFE67E22),
  };

  // Language Colors
  static const Map<String, Color> languageColors = {
    'French': Color(0xFF4A90E2),
    'Spanish': Color(0xFFE74C3C),
    'German': Color(0xFFF39C12),
    'Italian': Color(0xFF2ECC71),
    'Japanese': Color(0xFFE91E63),
    'Chinese': Color(0xFFD32F2F),
    'Korean': Color(0xFF3F51B5),
    'Russian': Color(0xFF607D8B),
    'Arabic': Color(0xFF009688),
    'Portuguese': Color(0xFFFF6F00),
  };

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [secondary, secondaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient successGradient = LinearGradient(
    colors: [success, successDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient errorGradient = LinearGradient(
    colors: [error, errorDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warmGradient = LinearGradient(
    colors: [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient coolGradient = LinearGradient(
    colors: [Color(0xFF4ECDC4), Color(0xFF45B7D1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient vibrantGradient = LinearGradient(
    colors: [Color(0xFFA8E6CF), Color(0xFF88D8B0)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient sunsetGradient = LinearGradient(
    colors: [Color(0xFFFF6B6B), Color(0xFFFFD93D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Shadows
  static List<BoxShadow> get defaultShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get mediumShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          blurRadius: 15,
          offset: const Offset(0, 6),
        ),
      ];

  static List<BoxShadow> get heavyShadow => [
        BoxShadow(
          color: Colors.black.withOpacity(0.16),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];

  // Decoration
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: cardLight,
        borderRadius: BorderRadius.circular(16),
        boxShadow: defaultShadow,
      );

  static BoxDecoration get primaryCardDecoration => BoxDecoration(
        gradient: primaryGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: mediumShadow,
      );
}
