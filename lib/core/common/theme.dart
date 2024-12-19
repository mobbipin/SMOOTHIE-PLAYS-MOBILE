import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: Color(0xFF800000), // Maroon color for primary elements
      colorScheme: ColorScheme.light(
        primary: Color(0xFF800000), // Maroon primary color
        secondary: Color(0xFF9B1B30), // Secondary color (optional)
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 32,
          fontWeight: FontWeight.w900, // Black weight for bold headings
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 24,
          fontWeight: FontWeight.w700, // Bold weight for sub-headings
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontFamily: 'Montserrat', // Font family
          fontSize: 16,
          fontWeight: FontWeight.w400, // Regular weight
          color: Colors.black,
        ),
        bodyText2: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          fontWeight: FontWeight.w300, // Light weight
          color: Colors.black.withOpacity(0.6),
        ),
        subtitle1: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 18,
          fontWeight: FontWeight.w400, // Regular weight for subtitles
          fontStyle: FontStyle.italic, // Italic style for subtitles
          color: Colors.black.withOpacity(0.8),
        ),
        button: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w700, // Bold weight for buttons
          color: Colors.white, // Button text color (optional)
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF800000), // Maroon button color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide:
              BorderSide(color: Color(0xFF800000)), // Maroon border color
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
