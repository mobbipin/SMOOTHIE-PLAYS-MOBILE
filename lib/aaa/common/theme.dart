import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Color(0xFF800000), // Marron color
      colorScheme: ColorScheme.light(
        primary: Color(0xFF800000), // Marron color
        secondary: Color(0xFF9B1B30), // Secondary color
      ),
      scaffoldBackgroundColor:
          Colors.white, // Default white background for all screens
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 32,
          fontWeight: FontWeight.w900, // Bold for large display text
          color: Colors.black, // Black text color
        ),
        displayMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 24,
          fontWeight: FontWeight.w700, // Bold for medium-sized text
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400, // Regular weight for body text
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w300, // Light weight for small text
          color: Colors.black.withOpacity(0.6),
        ),
        titleMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18,
          fontWeight: FontWeight.w400, // Regular weight for titles
          fontStyle: FontStyle.italic,
          color: Colors.black.withOpacity(0.8),
        ),
        labelLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF800000), // Marron color for buttons
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xFF800000)),
        ),
        labelStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          color: Colors.black,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}
