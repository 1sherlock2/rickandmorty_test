import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rickandmorty_test/ui/core/colors.dart';

final class AppTheme {
  final baseTextTheme = ThemeData.dark().textTheme;

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: const Color.fromARGB(255, 232, 237, 239),
      displayColor: const Color.fromRGBO(147, 168, 178, 1),
      fontFamily: GoogleFonts.fredoka().fontFamily,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.customBlue,
      selectionColor: Colors.blue, // цвет выделения
      selectionHandleColor: Colors.blue, // цвет ручек
    ),
  );
}
