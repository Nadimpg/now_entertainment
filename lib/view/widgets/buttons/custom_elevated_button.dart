import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomElevatedButton extends StatelessWidget {

  final VoidCallback onPressed;
  final String titleText;
  final Color titleColor;
  final Color buttonColor;
  final Color? borderColor;
  final double titleSize;
  final FontWeight titleWeight;
  final double buttonRadius;
  final double buttonHeight;
  final double? buttonWidth;

  const CustomElevatedButton({
    required this.onPressed,
    required this.titleText,
    this.titleColor = Colors.white,
    this.buttonColor = AppColors.red_500,
    this.titleSize = 18,
    this.buttonRadius = 8,
    this.titleWeight = FontWeight.w600,
    this.buttonHeight = 58,
    this.buttonWidth,
    this.borderColor,
    super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius),
                side: BorderSide(color: borderColor ?? AppColors.red_500, width: 1.0),
              ),
            ),
            elevation: MaterialStateProperty.all(0)),
        child: Text(
          titleText,
          textAlign: TextAlign.center,
          style: GoogleFonts.prompt(
              color: titleColor, fontSize: titleSize, fontWeight: titleWeight
          ),
        ),
      ),
    );
  }
}