import 'package:flutter/material.dart';

final class AppColors {
  static const white1 = Color(0xFFFFFFFF);
  static const white2 = Color.fromARGB(255, 243, 246, 249);

  static const black1 = Color.fromARGB(48, 38, 36, 1);
  static const lightBrown = Color.fromARGB(255, 229, 228, 201);
  static const brown = Color.fromARGB(52, 25, 4, 1);

  static const customBlue = Color(0xFF0B1317);
  static const customBlue2 = Color(0xFF162028);

  static const red1 = Color(0xFFE74C3C);
  static const red2 = Color.fromARGB(255, 251, 242, 241);
  static const red3 = Color.fromRGBO(243, 222, 222, 1);
  static const red4 = Color.fromRGBO(236, 174, 174, 1);

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    surface: customBlue,
    onSurface: white1,

    primary: customBlue,
    onPrimary: customBlue,
    secondary: customBlue,
    onSecondary: AppColors.white1,
    error: AppColors.red2,
    onError: white1,
  );
}
