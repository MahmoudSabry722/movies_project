import 'package:flutter/material.dart';
import '../colors/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? obscureText : false,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      style: const TextStyle(color: AppColor.textColor),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: AppColor.textColor),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 10.0),
                child: widget.prefixIcon,
              )
            : null,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 48,
          minHeight: 24,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(
                  !obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                color: AppColor.textColor,
              )
            : widget.suffixIcon,

        enabledBorder: buildBorder(AppColor.tertiaryColor),
        focusedBorder: buildBorder(AppColor.secondaryColor, width: 1),
        errorBorder: buildBorder(AppColor.elevatedButtonColor),
        focusedErrorBorder: buildBorder(AppColor.elevatedButtonColor, width: 1),
        filled: true,
        fillColor: AppColor.tertiaryColor,
      ),
    );
  }

  OutlineInputBorder buildBorder(Color color, {double width = 1.0}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
