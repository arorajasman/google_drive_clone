import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppUtils {
  TextStyle appTextStyle(double fontSize, Color color, FontWeight fontWeight) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    );
  }
}
