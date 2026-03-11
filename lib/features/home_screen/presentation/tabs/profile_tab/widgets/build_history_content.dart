import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/widgets/movie_poster.dart';

class BuildHistoryContent extends StatelessWidget {
  const BuildHistoryContent({super.key});

  final List<String> historyImages = const [
    AppImage.onBoarding1,
    AppImage.onBoarding2,
    AppImage.onBoarding3,
    AppImage.onBoarding4,
    AppImage.onBoarding5,
    AppImage.onBoarding6,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.w,
        mainAxisSpacing: 8.h,
        childAspectRatio: 0.7,
      ),
      itemCount: 15,
      itemBuilder: (context, index) {
        return MoviePoster(
          imagePath: historyImages[index % historyImages.length],
          rating: "8.2",
        );
      },
    );
  }
}