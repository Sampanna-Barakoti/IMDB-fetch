import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextModified extends StatelessWidget {
  const TextModified({super.key, this.text, this.color, this.size});

  final String? text;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.breeSerif(color: color, fontSize: size),
    );
  }
}
