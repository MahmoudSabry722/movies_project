import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/assets/app_assets.dart';
import '../../../../../core/colors/app_color.dart';
import '../../../../../core/strings/app_string.dart';
import '../../../../../core/styles/app_style.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: AppColor.secondaryColor,
      indicatorWeight: 3,
      labelColor: AppColor.secondaryColor,
      unselectedLabelColor: AppColor.secondaryColor,
      labelStyle: AppStyle.font16WhiteW400.copyWith(
        fontWeight: FontWeight.bold,
      ),
      tabs: [
        Tab(
          icon: SvgPicture.asset(AppIcon.watchList),
          text: AppString.watchList,
        ),
        Tab(icon: SvgPicture.asset(AppIcon.history), text: AppString.history),
      ],
    );
  }
}
