import 'package:demo_todo_megmo/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeFactory {
  // Theme for  application light theme
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightEleavatedButton,


    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.blue,

      secondary: AppColors.subTextColor,

      // color of dividers in app
      onSurface: AppColors.dividerColor,
      // black color for app
      inversePrimary: Colors.black,
    ),
  );
}

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

// elevated button for light theme
  static final lightEleavatedButton = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.white,
    backgroundColor: AppColors.blue,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: EdgeInsets.symmetric(vertical: 8.h),
    textStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.appBlack),
  ));

// elevated button for dark theme
}




// Customized Theme data for fonts

class AppTextTheme {
  AppTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white),
    headlineMedium: TextStyle(
        fontSize: 27.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.appBlack),
    headlineSmall: TextStyle(
        fontSize: 19.sp, fontWeight: FontWeight.w600, color: Colors.black),
    titleLarge: TextStyle(
        fontSize: 16.sp, fontWeight: FontWeight.w300, color: Colors.black),
    titleMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.subTextColor,
    height: 0),
    displayMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w700,
        color: AppColors.textBlue),

  );
}
