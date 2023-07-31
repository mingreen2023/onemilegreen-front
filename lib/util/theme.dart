import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:onemilegreen_front/util/colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: OmgColors.primaryColor,
    cardColor: OmgColors.cardColor,
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
    unselectedItemColor: OmgColors.unselectedBottonMenu,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    backgroundColor: Colors.white,
    selectedLabelStyle: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    unselectedLabelStyle: TextStyle(
      color: OmgColors.unselectedBottonMenu,
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
      color: OmgColors.mainSecondTextColor,
      fontSize: 16,
    ),
    titleLarge: const TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
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
    color: OmgColors.primaryColor,
  );
  static TextStyle routineStatusLabel = TextStyle(
    fontSize: 12.sp,
    color: OmgColors.secondPrimaryColor,
  );
  static TextStyle routineStatus = TextStyle(
    fontSize: 20.sp,
    color: OmgColors.primaryColor,
  );

  static TextStyle routineMytitle = TextStyle(
    fontSize: 16.sp,
    color: OmgColors.primaryColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle routineNeigbor = TextStyle(
    color: OmgColors.primaryColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w300,
  );

  static TextStyle routineList = TextStyle(
    fontSize: 16.sp,
    color: OmgColors.mainSecondTextColor,
    fontWeight: FontWeight.w300,
  );

  static TextStyle routineItemDate = TextStyle(
    fontSize: 13.sp,
    color: OmgColors.middleGreyColor,
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
    color: OmgColors.lightGreyColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle createComTitle = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle createComGuide = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: OmgColors.unselectedBottonMenu,
  );

  static TextStyle createComName = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static TextStyle createComInputPlaceholder = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: OmgColors.chipGreyColor,
  );

  static TextStyle createComInputText = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static TextStyle createComChipSelected = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: OmgColors.primaryColor,
  );

  static TextStyle createComChipUnselected = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.w600,
    color: OmgColors.chipGreyColor,
  );
}
