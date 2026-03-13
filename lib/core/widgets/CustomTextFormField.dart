import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscureText = false,
    this.controller,
    this.validator,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      validator: validator,
      keyboardType: keyboardType,
      style: const TextStyle(color: AppColor.textColor),
      decoration: InputDecoration(
        hintText: hintText,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14
      ),
        hintStyle: const TextStyle(color: AppColor.textColor),
        prefixIcon: prefixIcon != null
            ? Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: prefixIcon,
        )
            : null,

        suffixIcon: suffixIcon != null
            ? Padding(
          padding: const EdgeInsets.only(right: 12, left: 8),
          child: suffixIcon,
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColor.tertiaryColor),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColor.secondaryColor, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColor.elevatedButtonColor),
        ),
        filled: true,
        fillColor: AppColor.tertiaryColor,
      ),
    );
  }
}