import 'package:flutter/material.dart';
import '../colors/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Widget? icon;
  final Color? borderColor;
  final double? width;
  final double height;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textStyle,
    this.icon,
    this.borderColor,
    this.width,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColor.secondaryColor,
          elevation: 0,
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: 1.5)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 10),
            ],
            Text(
              text,
              style: textStyle ?? const TextStyle(
                color: AppColor.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}