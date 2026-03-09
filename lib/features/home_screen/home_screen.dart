import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/features/home_screen/tabs/browse_tab/browse_tab.dart';
import 'package:movies/features/home_screen/tabs/home_tab/home_tab.dart';
import 'package:movies/features/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:movies/features/home_screen/tabs/search_tab/search_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> tabs = const [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,

      extendBody: true,

      body: tabs[selectedIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 15,
        ),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColor.tertiaryColor.withOpacity(0.95),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, AppIcon.home, AppIcon.homeSelected),
              _buildNavItem(1, AppIcon.search, AppIcon.searchSelected),
              _buildNavItem(2, AppIcon.browse, AppIcon.browseSelected),
              _buildNavItem(3, AppIcon.profile, AppIcon.profileSelected),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String selectedIconPath) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          isSelected ? selectedIconPath : iconPath,
          height: 26,
        ),
      ),
    );
  }
}