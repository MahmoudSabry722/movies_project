import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/core/strings/app_string.dart';
import 'package:movies/core/styles/app_style.dart';
import 'package:movies/features/home_screen/presentation/tabs/search_tab/widgets/movie_poster.dart';

class SearchTab extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              style: AppStyle.font20WhiteBold,
              decoration: InputDecoration(
                hintText: AppString.search,
                hintStyle: AppStyle.font20WhiteW400,
                prefixIcon: Padding(
                  padding: REdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  child: SvgPicture.asset(AppIcon.search),
                ),
                prefixIconConstraints: BoxConstraints(
                  minWidth: 24.w,
                  minHeight: 24.h,
                ),
                filled: true,
                fillColor: AppColor.tertiaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.white, width: 1),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                padding: REdgeInsets.only(bottom: 100),
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 189 / 279,
                ),
                itemBuilder: (context, index) {
                  return MoviePoster();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
