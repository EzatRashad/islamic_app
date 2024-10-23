import 'package:flutter/material.dart';
import '/core/themes/colors.dart';

class MyTheme {
  static bool dTheme = false;
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backColor1,
    primaryColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryLight,
       elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo-Regular",
      ),
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryDark,
      unselectedItemColor: AppColors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: "Cairo-Regular"),
      titleMedium: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w700,
          fontSize: 23,
          fontFamily: "Cairo-Regular"),
      titleSmall: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: 20,
          fontFamily: "Cairo-Regular"),
    ),
  );
  //-------------------------------------------------------------------------------------------------
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: AppColors.primaryDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
      fontFamily: "Cairo-Regular",
          color: Color(0Xff9E6F21),
          fontSize: 25,
          fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.yellow,
      unselectedItemColor: AppColors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
          fontFamily: "Cairo-Regular"),
      titleMedium: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w700,
          fontSize: 23,
          fontFamily: "Cairo-Regular"),
      titleSmall: TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.w400,
          fontSize: 20,
          fontFamily: "Cairo-Regular"),
    ),
  );
}
