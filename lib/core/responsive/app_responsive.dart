import 'package:flutter/material.dart';

class AppResponsive {
  AppResponsive._(); // private constructor

  // Breakpoints
  static const int mobileBreak = 600;
  static const int tabletBreak = 1024;
  static const int desktopBreak = 1440;

  /// Check if the screen is mobile
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < mobileBreak;
  }

  /// Check if the screen is tablet
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= mobileBreak && width < tabletBreak;
  }

  /// Check if the screen is desktop
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreak;
  }

  static bool ismenydestop(BuildContext context) {
    return MediaQuery.of(context).size.width >= tabletBreak;
  }

  /// Screen width
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Screen height
  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
