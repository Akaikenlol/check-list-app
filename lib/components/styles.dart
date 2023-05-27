import 'package:flutter/painting.dart';

/// Convenience class to access application colors.
abstract class AppColors {
  /// Dark background color.
  static const Color backgroundColor = Color.fromRGBO(255, 255, 255, 1);

  /// Slightly lighter version of [backgroundColor].
  static const Color backgroundFadedColor = Color.fromRGBO(255, 255, 255, 1);

  /// Color used for cards and surfaces.
  static const Color cardColor = Color.fromRGBO(255, 255, 255, 1);

  /// Accent color used in the application.
  static const Color accentColor = Color.fromRGBO(51, 226, 170, 1);
}
