import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/assets/app_assets.dart';

import '../../../../../../core/styles/app_style.dart';

class EmptySearchState extends StatelessWidget {
  const EmptySearchState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImage.popcornImage,
          ),
          SizedBox(height: 16.h),
          Text(
            "Find your next movie...",
            style: AppStyle.font20WhiteW400.copyWith(
              color: Colors.grey.withOpacity(0.8),
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
