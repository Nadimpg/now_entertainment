import 'package:blog_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
        this.maxLines ,
        this.textAlign = TextAlign.center,
        this.left = 0,
        this.right = 0,
        this.top = 0,
        this.bottom = 0,
        this.fontSize = 14,
        this.fontWeight =FontWeight.w400,
        this.color = AppColors.black_100,
        this.text = "",
        this.overflow = TextOverflow.ellipsis,
        this.textDecoration = TextDecoration.none
      });
  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int ? maxLines;
  final TextOverflow overflow;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: Text(
        textAlign: textAlign,
        text,maxLines: maxLines,
        overflow: overflow,
        style: GoogleFonts.prompt(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
            decoration: textDecoration
        ),
      ),
    );
  }
}