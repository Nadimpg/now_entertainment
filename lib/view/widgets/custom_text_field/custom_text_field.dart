import 'package:blog_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    this.onFieldSubmitted,
    this.textEditingController,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.cursorColor = Colors.black,
    this.inputTextStyle,
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.onChanged,
    this.maxLines = 1,
    this.validator,
    this.hintText,
    this.hintStyle,
    this.fillColor = Colors.white,
    this.suffixIcon,
    this.suffixIconColor,
    this.fieldBorderRadius = 8,
    this.fieldBorderColor = const Color(0xffE7F0FD),
    this.isPassword = false,
    this.isPrefixIcon = true,
    this.readOnly = false,
    super.key, this.prefix
  });

  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Color cursorColor;
  final TextStyle? inputTextStyle;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FormFieldValidator? validator;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final Widget? prefix;
  final double fieldBorderRadius;
  final Color fieldBorderColor;
  final bool isPassword;
  final bool isPrefixIcon;
  final bool readOnly;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      onFieldSubmitted: widget.onFieldSubmitted,
      readOnly: widget.readOnly,
      controller: widget.textEditingController,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      cursorColor: widget.cursorColor,
      style: widget.inputTextStyle,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      obscureText: widget.isPassword ? obscureText : false,
      validator: widget.validator,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        fillColor: widget.fillColor,
        filled: true,
        prefixIcon: widget.prefix ,
        suffixIcon: widget.isPassword ? GestureDetector(
          onTap: toggle,
          child: Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
            child: SvgPicture.asset(AppIcons.cross,height: 22,width: 22),
          ),
        ) : widget.suffixIcon,
        suffixIconColor: widget.suffixIconColor,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
            borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
            gapPadding: 0),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
            borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
            gapPadding: 0),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.fieldBorderRadius),
            borderSide: BorderSide(color: widget.fieldBorderColor, width: 1),
            gapPadding: 0),
      ),
    );
  }

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}