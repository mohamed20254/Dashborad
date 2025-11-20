import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static AppTheme instanc = AppTheme._();
  final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[200],
    primaryColor: const Color(0xFF3F51B5),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      bodySmall: TextStyle(fontSize: 14, color: Colors.black),
      labelLarge: TextStyle(fontSize: 12, color: Colors.black),
      labelMedium: TextStyle(fontSize: 10, color: Colors.black),
    ),
  );
}
