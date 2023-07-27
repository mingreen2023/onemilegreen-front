import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  return TextTheme(
    headlineLarge: const TextStyle(
      color: Colors.black,
      fontSize: 48,
      fontWeight: FontWeight.w400,
    ),
    headlineMedium: const TextStyle(
      color: Colors.black,
      fontSize: 36,
    ),
    // 메인 중간 환경보효 효과
    headlineSmall: const TextStyle(
      color: Colors.black,
      fontSize: 24,
    ),
    labelMedium: const TextStyle(
      color: mainSecondTextColor,
      fontSize: 16,
    ),
    titleLarge: const TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: primaryColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: const TextStyle(
      color: Color(0xff5a5a5a),
      fontSize: 14,
    ),
  );
}

class CustomTextStyle {
  static TextStyle routineMsg = TextStyle(
    fontSize: 16.sp,
    color: primaryColor,
  );
  static TextStyle routineStatusLabel = TextStyle(
    fontSize: 12.sp,
    color: secondPrimaryColor,
  );
  static TextStyle routineStatus = TextStyle(
    fontSize: 20.sp,
    color: primaryColor,
  );

  static TextStyle routineMytitle = TextStyle(
    fontSize: 15.sp,
    color: primaryColor,
  );

  static TextStyle routineList = TextStyle(
    fontSize: 16.sp,
    color: mainSecondTextColor,
    fontWeight: FontWeight.w300,
  );

  static TextStyle routineItemDate = TextStyle(
    fontSize: 13.sp,
    color: middleGreyColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle routineItemTitle = TextStyle(
    fontSize: 18.sp,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  static TextStyle routineItemJoined = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle routineItemPoint = TextStyle(
    fontSize: 12.sp,
    color: lightGreyColor,
    fontWeight: FontWeight.w400,
  );
}
