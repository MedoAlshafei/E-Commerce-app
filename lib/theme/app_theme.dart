import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_colors.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      primaryColor: MyColors.primary,
      scaffoldBackgroundColor: MyColors.background,
      textTheme: GoogleFonts.encodeSansTextTheme(),
      appBarTheme: AppBarTheme(
        backgroundColor: MyColors.background,
        foregroundColor: MyColors.primary,
        elevation: 0,
        titleTextStyle: GoogleFonts.encodeSans(
          color: MyColors.primary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.primary,
          foregroundColor: MyColors.buttonText,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.encodeSans(fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyColors.primary),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: MyColors.greyDark,
        selectedItemColor: MyColors.primaryLight,
        unselectedItemColor: MyColors.grey2,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
