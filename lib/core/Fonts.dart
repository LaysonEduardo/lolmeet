import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Colors.dart';

class AppFonts {
  static final TextStyle logoA = GoogleFonts.bebasNeue(
    color: AppColors.primary,
    fontSize: 80,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle logoB = GoogleFonts.bebasNeue(
    color: AppColors.secondary,
    fontSize: 80,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle simpleText = GoogleFonts.ptSerif(
    color: AppColors.accent,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle inputText = GoogleFonts.quicksand(
    color: AppColors.accent.withOpacity(0.8),
    fontSize: 15,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );
  static final TextStyle helpText = GoogleFonts.quicksand(
    color: AppColors.accent.withOpacity(0.8),
    fontSize: 13,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );
}
