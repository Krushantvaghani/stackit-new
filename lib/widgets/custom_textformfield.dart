import 'package:flutter/material.dart';
import 'package:stackit/global/utility/app_notifier.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? container;
  final String? hint;
  final String? hintText;
  final String? labelText;
  final double radius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? style;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final double padding;
  final Color? fillColor;
  final int maxLines;
  final bool isDense;
  final TextStyle? hintStyle;
  final InputBorder? enabledBorder, focusedBorder;
  final InputBorder? border;

  const CustomTextFormField({
    Key? key,
    this.container,
    this.hint,
    this.hintText,
    this.labelText,
    this.radius = 10.0,
    this.prefixIcon,
    this.suffixIcon,
    this.style,
    this.obscureText = false,
    this.validator,
    this.padding = 10,
    this.fillColor,
    this.maxLines = 1,
    this.keyboardType,
    this.isDense = true,
    this.hintStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: container,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: suffixIcon,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
        filled: true,
        fillColor: fillColor ?? Color(0xFFF5F6FA),
        contentPadding: EdgeInsets.all(15),
        hintText: hintText,
        // hintStyle: TextStyle(color: Colors.black38, fontWeight: FontWeight.w300),
        labelText: labelText,
        hintStyle: hintStyle,
        focusedBorder: focusedBorder,
        enabledBorder: enabledBorder,
        isDense: true,
      ),
      style: style,
      obscureText: obscureText,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
    );
  }
}
