import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonText extends StatelessWidget {
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  const CommonText({
    super.key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: GoogleFonts.getFont(fontFamily ?? 'Unbounded',
            color: color, fontSize: fontSize, fontWeight: fontWeight));
  }
}
