import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize; // base font size from Figma
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double? letterSpacing;
  final String fontFamily; // Google Font family name

  const AppText({
    super.key,
    required this.text,
    required this.fontSize,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
    this.letterSpacing,
    this.fontFamily = 'Roboto', // default Google Font
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive font size based on screen width (Figma base 400)
    final double responsiveFontSize = screenWidth * (fontSize / 400);

    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.getFont(
        fontFamily,
        fontSize: responsiveFontSize,
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: 1,
      ),
    );
  }
}
