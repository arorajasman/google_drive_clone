import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getTextStyle(double fontSize, Color color, FontWeight fontWeight) {
  return GoogleFonts.montserrat(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
