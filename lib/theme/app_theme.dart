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
        foregroundColor: MyColors.black,
        elevation: 0,
        titleTextStyle: GoogleFonts.encodeSans(
          color: MyColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.buttonBackground,
          foregroundColor: MyColors.buttonText,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.encodeSans(fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: MyColors.greyDark, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: MyColors.grey, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: MyColors.greyDark, width: 1),
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
