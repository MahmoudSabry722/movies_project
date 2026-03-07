import 'package:flutter/material.dart';
import '../colors/app_color.dart';
import '../styles/app_style.dart';

class CustomElevatedButton extends StatefulWidget {

  final String text;
  final VoidCallback onPressed;
  final bool isOutlined;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
  });

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {

  double scale = 1;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTapDown: (_) {
        setState(() {
          scale = 0.95;
        });
      },

      onTapUp: (_) {
        setState(() {
          scale = 1;
        });
        widget.onPressed();
      },

      onTapCancel: (){
        setState(() {
          scale = 1;
        });
      },

      child: AnimatedScale(

        duration: const Duration(milliseconds: 120),
        scale: scale,

        child: Container(

          height: 55,

          decoration: BoxDecoration(

            color: widget.isOutlined
                ? Colors.transparent
                : AppColor.secondaryColor,

            borderRadius: BorderRadius.circular(15),

            border: widget.isOutlined
                ? Border.all(
              color: AppColor.secondaryColor,
              width: 2,
            )
                : null,

          ),

          child: Center(

            child: Text(

              widget.text,

              style: widget.isOutlined
                  ? AppStyle.font20GoldW600
                  : AppStyle.font20BlackW600,

            ),

          ),
        ),
      ),
    );
  }
}