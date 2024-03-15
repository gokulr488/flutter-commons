import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInfo extends StatelessWidget {
  const TextInfo(
      {super.key, 
      required this.text,
      required this.size,
      this.color,
      this.thickness,
      this.align,
      this.pad});
  final String text;
  final double size;
  final Color? color;
  final FontWeight? thickness;
  final Alignment? align;
  final EdgeInsets? pad;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align ?? Alignment.centerLeft,
      child: Padding(
        padding: pad ?? const EdgeInsets.all(4.0),
        child: Text(
          text,
          style: GoogleFonts.montserrat(
              fontSize: size,
              color: color ?? Colors.black,
              fontWeight: thickness ?? FontWeight.normal),
        ),
      ),
    );
  }
}
