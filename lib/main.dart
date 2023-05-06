import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'views/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      theme: AppTheme().myAppTheme,
      home: InputPage(),
    );
  }
}
