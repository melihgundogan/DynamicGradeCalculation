import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor primaryColor = Colors.indigo;

  static const String titleText = "Ortalama Hesapla";

  static final TextStyle titleStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: primaryColor);

  static BorderRadius borderRadius = BorderRadius.circular(16);

  static final TextStyle numberOfLessonsStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor);

  static final TextStyle averageStyle = GoogleFonts.quicksand(
      fontSize: 52, fontWeight: FontWeight.w800, color: primaryColor);

  static final TextStyle gradeShowStyle = GoogleFonts.quicksand(
      fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor);

  static final dropDownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);

  static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
