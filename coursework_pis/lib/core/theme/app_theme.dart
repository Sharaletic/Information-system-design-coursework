import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        textTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 13,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w700,
      ),
    ));
  }
}
