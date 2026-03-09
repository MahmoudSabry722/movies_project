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
          borderRadius: BorderRadiusGeometry.circular(16.r),
          child: Image.asset(
            AppImage.poster1,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),

        Positioned(
          top: 10,
          left: 10,
          child: Container(
            padding: REdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: AppColor.lightBlackBackground,
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
