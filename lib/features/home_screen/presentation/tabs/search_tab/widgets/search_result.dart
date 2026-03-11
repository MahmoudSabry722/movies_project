import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/widgets/movie_poster.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  final List<String> searchImages = const [
    AppImage.onBoarding1,
    AppImage.onBoarding2,
    AppImage.onBoarding3,
    AppImage.onBoarding4,
    AppImage.onBoarding5,
    AppImage.onBoarding6,
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GridView.builder(
        padding: EdgeInsets.only(top: 0, bottom: 120.h),
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return MoviePoster(
            imagePath: searchImages[index % searchImages.length],
            rating: "7.7",
          );
        },
      ),
    );
  }
}