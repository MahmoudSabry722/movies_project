import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String elevatedButtonText;
  final VoidCallback elevatedButtonAction;
  final Color backGroundColor;
  final TextStyle elevatedButtonTextStyle;
  final Widget? elevatedButtonIcon;
  final Color? borderColor;

  const CustomElevatedButton({
    required this.elevatedButtonTextStyle,
    required this.backGroundColor,
    required this.elevatedButtonText,
    required this.elevatedButtonAction,
    super.key,
    this.elevatedButtonIcon,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16.0),
        backgroundColor: backGroundColor,
        side: borderColor != null
            ? BorderSide(color: borderColor!)
            : BorderSide.none,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: elevatedButtonAction,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (elevatedButtonIcon != null) ...[
            const SizedBox(width: 10),
            elevatedButtonIcon!,
            const SizedBox(width: 10),
          ],
          Text(elevatedButtonText, style: elevatedButtonTextStyle),
        ],
      ),
    );
  }
}
