import 'package:flutter/material.dart';

class AppColors {
  // Primary color scheme
  static const Color primary = Color(0xFF2196F3); // Bright blue
  static const Color primaryVariant = Color(0xFF1976D2); // Darker blue
  static const Color secondary = Color(0xFF009688); // Teal
  static const Color secondaryVariant = Color(0xFF00796B); // Darker teal

  // Neutral colors
  static const Color background = Color(0xFFFFFFFF); // Pure white
  static const Color surface = Color(0xFFF5F5F5); // Light gray
  static const Color error = Color(0xFFD32F2F); // Red

  // On colors (for text/icons on top of primary/secondary)
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.white;
  static const Color onBackground = Color(0xFF212121); // Dark gray
  static const Color onSurface = Color(0xFF757575); // Medium gray
  static const Color onError = Colors.white;
}
