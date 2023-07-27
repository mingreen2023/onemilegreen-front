import 'package:flutter/material.dart';
import 'package:onemilegreen_front/util/colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    cardColor: cardColor,
    bottomNavigationBarTheme: bottomNavigationBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

// bottomNavigationBarTheme
BottomNavigationBarThemeData bottomNavigationBarTheme() {
  return const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    unselectedItemColor: unselectedBottonMenu,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    backgroundColor: Colors.white,
    selectedLabelStyle: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    unselectedLabelStyle: TextStyle(
      color: unselectedBottonMenu,
      fontSize: 12,
    ),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 36,
    ),
    // 메인 중간 환경보효 효과
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: 24,
    ),
    labelMedium: TextStyle(
      color: mainSecondTextColor,
      fontSize: 16,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      color: Color(0xff5a5a5a),
      fontSize: 14,
    ),
  );
}
