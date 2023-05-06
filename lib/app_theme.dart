import 'package:flutter/material.dart';

class AppTheme {
  ThemeData myAppTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF0A0B19),
      appBarTheme: AppBarTheme(color: Color(0xFF0A0C1A)),
      colorScheme: ColorScheme.dark().copyWith(
        secondary: Color(0xFFDF2454),
      ));
}
