import 'package:flutter/material.dart';
import 'package:movies/core/strings/app_string.dart';
import 'package:movies/features/home_screen/tabs/profile_tab/widgets/build_history_content.dart';
import 'package:movies/features/home_screen/tabs/profile_tab/widgets/build_watch_list_content.dart';
import 'package:movies/features/home_screen/tabs/profile_tab/widgets/profile_tab_bar.dart';
import 'package:movies/features/home_screen/tabs/profile_tab/widgets/silver_app_bar_delegate.dart';
import 'package:movies/features/home_screen/tabs/profile_tab/widgets/state_item.dart';
import '../../../../core/assets/app_assets.dart';
import '../../../../core/colors/app_color.dart';
import '../../../../core/styles/app_style.dart';
import '../../../../core/widgets/custom_elevated_button.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: NestedScrollView(
          key: const PageStorageKey<String>('profile_scroll'),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: Container(
                  color: AppColor.profileTabBarColor,
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      AppImage.avatar1,
                                      width: 118,
                                      height: 118,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    "Mahmoud Sabry",
                                    style: AppStyle.font20WhiteBold,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 30),
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      StateItem(count: "12", label: "Watch List"),
                                      StateItem(count: "10", label: "History"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: CustomElevatedButton(
                                  elevatedButtonText: AppString.editProfile,
                                  backGroundColor: AppColor.secondaryColor,
                                  elevatedButtonAction: () {},
                                  elevatedButtonTextStyle: AppStyle.font20BlackW600,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                flex: 2,
                                child: CustomElevatedButton(
                                  elevatedButtonText: AppString.exit,
                                  backGroundColor: AppColor.elevatedButtonColor,
                                  elevatedButtonAction: () {},
                                  elevatedButtonTextStyle: AppStyle.font20WhiteBold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: AppColor.profileTabBarColor,
                    alignment: Alignment.center,
                    child: const ProfileTabBar(),
                  ),
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              BuildWatchListContent(),
              BuildHistoryContent(),
            ],
          ),
        ),
      ),
    );
  }
}