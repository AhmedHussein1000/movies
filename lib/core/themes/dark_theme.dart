import 'package:flutter/material.dart';
import 'package:movies_app/core/themes/app_colors.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    ),
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
      
      backgroundColor: AppColors.redPrimaryColor,
      foregroundColor: Colors.black,
      shape: CircleBorder()
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      foregroundColor: AppColors.redPrimaryColor,
    )));
