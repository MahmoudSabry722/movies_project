import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/core/styles/app_style.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(16),
          child: Image.asset(
            AppImage.onBoarding6,
            fit: BoxFit.scaleDown,
            width: double.infinity,
          ),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: REdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.54),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text("7.7", style: AppStyle.font20WhiteW400),
                SizedBox(width: 5.w),
                SvgPicture.asset(AppIcon.star, width: 16.w, height: 16.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
