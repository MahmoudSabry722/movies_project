import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/widgets/movie_poster.dart';

class MovieHeaderSection extends StatelessWidget {
  final PageController controller;
  final double pageOffset;
  final List<String> moviePosters;

  const MovieHeaderSection({
    super.key,
    required this.controller,
    required this.pageOffset,
    required this.moviePosters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h),
        SizedBox(
          height: 90.h,
          child: Image.asset(AppImage.availableNow, fit: BoxFit.contain),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 420.h,
          child: PageView.builder(
            controller: controller,
            itemCount: moviePosters.length,
            itemBuilder: (context, index) {
              double scale = (1 - (pageOffset - index).abs() * 0.2).clamp(
                0.8,
                1.0,
              );
              return Transform.scale(
                scale: scale,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: MoviePoster(
                    imagePath: moviePosters[index],
                    rating: "7.7",
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          height: 100.h,
          child: Image.asset(AppImage.watchNow, fit: BoxFit.contain),
        ),
      ],
    );
  }
}