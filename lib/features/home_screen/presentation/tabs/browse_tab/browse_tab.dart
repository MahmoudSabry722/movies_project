import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/core/styles/app_style.dart';
import 'package:movies/core/widgets/movie_poster.dart';

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  final List<String> categories = [
    "All",
    "Action",
    "Adventure",
    "Comedy",
    "Drama",
    "Horror",
    "Sci-Fi",
    "Animation",
  ];

  final List<String> movieImages = [
    AppImage.onBoarding1,
    AppImage.onBoarding2,
    AppImage.onBoarding3,
    AppImage.onBoarding4,
    AppImage.onBoarding5,
    AppImage.onBoarding6,
  ];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16.h),
              child: SizedBox(
                height: 45.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  itemBuilder: (context, index) {
                    bool isSelected = selectedCategoryIndex == index;
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategoryIndex = index;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColor.secondaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: AppColor.secondaryColor,
                              width: 1.5,
                            ),
                          ),
                          child: Text(
                            categories[index],
                            style: isSelected
                                ? AppStyle.font20BlackW600.copyWith(
                                    fontSize: 16.sp,
                                  )
                                : AppStyle.font20GoldW600.copyWith(
                                    fontSize: 16.sp,
                                  ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 100.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: 20,

                  itemBuilder: (context, index) {
                    String imagePath = movieImages[index % movieImages.length];
                    return MoviePoster(imagePath: imagePath, rating: "7.7");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
