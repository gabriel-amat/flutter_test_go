import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static final defaultBorder = 10.0;

  static theme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
