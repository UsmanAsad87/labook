
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_colors.dart';


ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: MyColors.themeColor,
    scaffoldBackgroundColor: MyColors.white,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: MyColors.bodyLightThemeColor),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor: MyColors.bodyLightThemeColor),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => MyColors.themeColor),
      overlayColor:  MaterialStateColor.resolveWith((states) => MyColors.titleColor),
    ),


    colorScheme: ColorScheme.light(
      secondary: MyColors.titleColor,
      secondaryContainer: MyColors.textFieldContainerColor,
      tertiary:  MyColors.titleColor2,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1.h,
      backgroundColor: Colors.white,
      selectedItemColor: MyColors.themeColor,
      unselectedItemColor: MyColors.titleColor,
      selectedIconTheme: const IconThemeData(color: MyColors.themeColor),
      showUnselectedLabels: true,
    ),
  );
}
//
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: MyColors.themeColor,
    scaffoldBackgroundColor: MyColors.black,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: MyColors.bodyDarkThemeColor),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        .apply(bodyColor:MyColors.bodyDarkThemeColor),
    colorScheme: const ColorScheme.dark().copyWith(
      secondary:MyColors.white,
      tertiary: MyColors.bodyDarkThemeColor,
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateColor.resolveWith((states) => MyColors.themeColor),
      overlayColor:  MaterialStateColor.resolveWith((states) => MyColors.white),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.black,
      selectedItemColor: MyColors.themeColor,
      unselectedItemColor: MyColors.white,
      selectedIconTheme: const IconThemeData(color: MyColors.themeColor),
      showUnselectedLabels: true,
    ),
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0, color: MyColors.themeColor);
