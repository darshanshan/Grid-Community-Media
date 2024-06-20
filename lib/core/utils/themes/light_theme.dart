import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF4B39EE),
  scaffoldBackgroundColor: const Color(0xFFF3F3F3),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFF4B39EE)),
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
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
    brightness: Brightness.light,
    primary: const Color(0xFFF3F3F3),
    onPrimary: const Color(0xFFDDDDDD),
    primaryContainer: const Color(0xFF4B39EE),
    secondary: const Color(0xFFFFFFFF),
    secondaryContainer: const Color(0xFF39D2C0),
    onSecondary: const Color(0xFFBFBBBB),
    tertiary: const Color(0xFF515151),
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.grey[200]!,
    onSurface: Colors.grey,
    background: Colors.white,
    onBackground: Colors.black,
    onTertiary: const Color(0xFFBFBBBB),
    onPrimaryContainer: const Color(0xFFDDDDDD),
    outline: const Color(0xFFDDDDDD),
    tertiaryContainer: const Color(0xFFFFA130),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: MaterialStateProperty.all(
        const Color(0xFF515151),
      ),
      shape: MaterialStateProperty.all(
        BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
              color: Color(0xFFDDDDDD), width: 1, style: BorderStyle.solid),
        ),
      ),
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Color(0xFF202020),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    bodyMedium: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Color(0xFF515151),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
    bodySmall: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Color(0xFF515151),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    displayLarge: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Color(0xFF515151),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    displayMedium: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    displaySmall: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Color(0xFF202020),
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    labelMedium: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Color(0xFF515151),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
    headlineLarge: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Color(0xFF202020),
        fontSize: 36,
        fontWeight: FontWeight.w500,
      ),
    ),
    headlineMedium: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Color(0xFF202020),
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
    ),
    titleSmall: GoogleFonts.inter(
      textStyle: const TextStyle(
        color: Color(0xFF515151),
        fontSize: 10,
        fontWeight: FontWeight.w400,
      ),
    ),
    titleMedium: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Color(0xFF4B39EE),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFFFFFFF),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
    size: 16,
  ),
  datePickerTheme: DatePickerThemeData(
    rangePickerShadowColor: Colors.red,
    dividerColor: Colors.white,
    dayForegroundColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white; // Selected day background color
        }
        return const Color(0xFF202020); // Default background color
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
    //rangePickerBackgroundColor: Colors.red,
    //inputDecorationTheme: InputDecorationTheme(fillColor: Colors.red),
    confirmButtonStyle: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFF4B39EE)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
    cancelButtonStyle: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFF4B39EE)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
    dayOverlayColor: MaterialStateProperty.all(const Color(0xFF4B39EE)),
    todayBorder: const BorderSide(color: Color(0xFF202020)),
    todayForegroundColor: MaterialStateProperty.all(const Color(0xFF202020)),
    yearForegroundColor: MaterialStateProperty.all(const Color(0xFF202020)),
    weekdayStyle: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Color(0xFF202020),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    backgroundColor: const Color(0xFFF3F3F3),
    headerBackgroundColor: const Color(0xFF4B39EE),
    headerHelpStyle: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    headerForegroundColor: Colors.white,
    headerHeadlineStyle: GoogleFonts.roboto(
      textStyle: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),
);
