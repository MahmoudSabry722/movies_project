import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/core/strings/app_string.dart';
import 'package:movies/core/styles/app_style.dart';
import 'package:movies/core/widgets/movie_poster.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final List<String> images;

  const MovieSection({super.key, required this.title, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppStyle.font20WhiteBold),
              TextButton.icon(
                onPressed: () {
                  //action
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
                icon: SvgPicture.asset(
                  AppIcon.arrowForward,
                  width: 14.w,
                  height: 14.h,
                  colorFilter: const ColorFilter.mode(
                    AppColor.secondaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                label: Text(AppString.seeMore, style: AppStyle.font14GoldBold),
                iconAlignment: IconAlignment.end,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: images.length,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: SizedBox(
                  width: 140.w,
                  child: MoviePoster(
                    imagePath: images[index],
                    rating: "8.5",
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}