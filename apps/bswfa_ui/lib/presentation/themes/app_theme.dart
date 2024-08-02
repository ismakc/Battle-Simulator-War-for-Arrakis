import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
    );
  }
}
