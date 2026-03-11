import 'dart:ui';
import 'package:flutter/material.dart';

class DynamicBackground extends StatelessWidget {
  final String imagePath;

  const DynamicBackground({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),

        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: Container(

          key: ValueKey<String>(imagePath),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
  }
}