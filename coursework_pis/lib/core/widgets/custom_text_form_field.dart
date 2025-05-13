import 'package:coursework_pis/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.labelText,
      required this.hintText,
      this.validator,
      this.suffixIcon,
      this.color,
      this.onChanged,
      this.keyboardType,
      this.obscureText = false,
      this.readOnly = false,
      this.maxLines = 1});
  final TextEditingController controller;
  final String? Function(String? val)? validator;
  final TextInputType? keyboardType;
  final String hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Color? color;
  final bool obscureText;
  final bool readOnly;
  final int? maxLines;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      readOnly: readOnly,
      maxLines: maxLines,
      onChanged: onChanged,
      style: TextStyle(
        color: color,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: color),
        errorStyle: TextStyle(
          fontSize: 11,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.errorColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
