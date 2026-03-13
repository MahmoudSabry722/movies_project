import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/core/styles/app_style.dart';

class MoviePoster extends StatelessWidget {
  final String imagePath;
  final String rating;

  const MoviePoster({super.key, required this.imagePath, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.54),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  rating,
                  style: AppStyle.font20WhiteW400.copyWith(fontSize: 14),
                ),
                const SizedBox(width: 4),
                SvgPicture.asset(AppIcon.star, width: 14, height: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}