import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF171717),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFF4B39EE)),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        GoogleFonts.roboto(
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  ),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: const Color(0xFF171717),
    onPrimary: const Color(0xFFDDDDDD),
    primaryContainer: const Color(0xFF4B39EE),
    secondary: const Color(0xFF282828),
    secondaryContainer: const Color(0xFF39D2C0),
    onSecondary: const Color(0xFFBFBBBB),
    tertiary: const Color(0xFFD4D4D4), //Secondary Text
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.grey[200]!,
    onSurface: Colors.grey,
    background: Colors.black,
    onBackground: Colors.white,
    onTertiary: const Color(0xFF262D34),
    onPrimaryContainer: const Color(0xFF404040), //Tertiary
    outline: const Color(0xFF404040),
    tertiaryContainer: const Color(0xFFFFA130),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all(Colors.white),
      iconSize: MaterialStateProperty.all(16),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
                color: Color(0xFF404040), style: BorderStyle.solid, width: 1)),
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Color(0xFFF7F7F7),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    bodyMedium: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Color(0xFFD4D4D4),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    bodySmall: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Color(0xFFD4D4D4),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    displayLarge: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Color(0xFFD4D4D4),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    displayMedium: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    displaySmall: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Color(0xFFF7F7F7),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    labelMedium: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Color(0xFFD4D4D4),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    headlineLarge: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Color(0xFFF7F7F7),
        fontSize: 36,
        fontWeight: FontWeight.w600,
      ),
    ),
    headlineMedium: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Color(0xFFF7F7F7),
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    ),
    titleSmall: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Color(0xFFD4D4D4),
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ),
    titleMedium: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 16,
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color(0xFF4B39EE),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF282828),
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: const Color(0xFF171717),
    dayForegroundColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white; // Selected day background color
        }
        return null; // Default background color
      },
    ),
    rangePickerHeaderForegroundColor: const Color(0xFF202020),
    dayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Color(0xFF4B39EE); // Selected day background color
        }
        return null; // Default background color
      },
    ),
    confirmButtonStyle: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFF4B39EE)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
    cancelButtonStyle: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFF4B39EE)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
    headerBackgroundColor: const Color(0xFF4B39EE),
    headerHelpStyle: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Color(0xFFF7F7F7),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    headerForegroundColor: Colors.white,
    headerHeadlineStyle: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Color(0xFFF7F7F7),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);
