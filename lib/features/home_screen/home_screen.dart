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
  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: tabs[selectedIndex],


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 8,
        ),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: AppColor.tertiaryColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 150),
                blurRadius: 20,
                offset: const Offset(0, 8),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => setState(() => selectedIndex = 0),
                child: SvgPicture.asset(
                  selectedIndex == 0 ? AppIcon.homeSelected : AppIcon.home,
                  height: 26,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => selectedIndex = 1),
                child: SvgPicture.asset(
                  selectedIndex == 1 ? AppIcon.searchSelected : AppIcon.search,
                  height: 26,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => selectedIndex = 2),
                child: SvgPicture.asset(
                  selectedIndex == 2 ? AppIcon.browseSelected : AppIcon.browse,
                  height: 26,
                ),
              ),
              GestureDetector(
                onTap: () => setState(() => selectedIndex = 3),
                child: SvgPicture.asset(
                  selectedIndex == 3 ? AppIcon.profileSelected : AppIcon.profile,
                  height: 26,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}