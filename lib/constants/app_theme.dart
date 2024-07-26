import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.primaryColorLight,
  primaryColorDark: AppColors.primaryColorDark,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.secondaryColor,
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.primaryColor,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.5,
    centerTitle: false,
    backgroundColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  primaryTextTheme: GoogleFonts.poppinsTextTheme(
    const TextTheme(
      bodySmall: TextStyle(fontSize: 12),
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(
    const TextTheme(
      displayLarge: TextStyle(fontSize: 25),
      displaySmall: TextStyle(fontSize: 23),
      headlineLarge: TextStyle(fontSize: 21),
      headlineSmall: TextStyle(fontSize: 19),
      titleLarge: TextStyle(fontSize: 17),
      titleSmall: TextStyle(fontSize: 14),
      bodyLarge: TextStyle(fontSize: 13),
      bodySmall: TextStyle(fontSize: 12),
    ).apply(displayColor: Colors.black, bodyColor: Colors.black),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    hintStyle: const TextStyle(color: Colors.black),
    labelStyle: const TextStyle(color: Colors.black),
    errorStyle: const TextStyle(color: Colors.red),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.secondaryColor,
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: AppColors.primaryColor,
  primaryColorLight: AppColors.primaryColorLight,
  primaryColorDark: AppColors.primaryColorDark,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.secondaryColor,
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      backgroundColor: AppColors.primaryColor,
    ),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.5,
    centerTitle: false,
    backgroundColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  primaryTextTheme: GoogleFonts.poppinsTextTheme(
    const TextTheme(
      bodySmall: TextStyle(fontSize: 12),
    ),
  ),
  textTheme: GoogleFonts.poppinsTextTheme(
    const TextTheme(
      displayLarge: TextStyle(fontSize: 25),
      displaySmall: TextStyle(fontSize: 23),
      headlineLarge: TextStyle(fontSize: 21),
      headlineSmall: TextStyle(fontSize: 19),
      titleLarge: TextStyle(fontSize: 17),
      titleSmall: TextStyle(fontSize: 15),
      bodyLarge: TextStyle(fontSize: 13),
      bodySmall: TextStyle(fontSize: 12),
    ).apply(displayColor: Colors.white, bodyColor: Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    hintStyle: const TextStyle(color: Colors.white),
    labelStyle: const TextStyle(color: Colors.white),
    errorStyle: const TextStyle(color: Colors.red),
    contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primaryColor),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.secondaryColor,
  ),
);
