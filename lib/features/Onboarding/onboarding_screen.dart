import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/core/strings/app_string.dart';
import 'package:movies/core/styles/app_style.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import '../home_screen/presentation/home_screen.dart';
import 'onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  void _goToHome() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
              ),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 700),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = currentIndex == onboardingPages.length - 1;
    bool showSkip = currentIndex > 0 && !isLastPage;

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        children: [
          PageView.builder(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: onboardingPages.length,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) {
              final page = onboardingPages[index];
              return Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(page.image, fit: BoxFit.cover),
                  ),
                  Positioned.fill(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            page.gradientColor.withOpacity(0),
                            page.gradientColor.withOpacity(0.5),
                            page.gradientColor.withOpacity(0.9),
                            page.gradientColor,
                          ],
                          stops: const [0.0, 0.4, 0.7, 1.0],
                        ),
                      ),
                    ),
                  ),
                  index == 0
                      ? _buildFirstPageContent(page, index)
                      : _buildSubsequentPagesContent(page, index),
                ],
              );
            },
          ),

          Positioned(
            top: 54.h,
            right: 20.w,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: showSkip ? 1.0 : 0.0,
              child: IgnorePointer(
                ignoring: !showSkip,
                child: GestureDetector(
                  onTap: _goToHome,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: AppColor.secondaryColor,
                      borderRadius: BorderRadius.circular(25.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text("Skip", style: AppStyle.font16BlackW600),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstPageContent(dynamic page, int index) {
    return Positioned(
      left: 16.w, right: 16.w, bottom: 20.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(page.title, style: AppStyle.font36WhiteBold, textAlign: TextAlign.center),
          const SizedBox(height: 12),
          Text(page.description, style: AppStyle.font18WhiteW400, textAlign: TextAlign.center),
          const SizedBox(height: 30),
          CustomElevatedButton(
            text: AppString.exploreNow,
            backgroundColor: AppColor.secondaryColor,
            onPressed: () => _nextPage(index),
          ),
        ],
      ),
    );
  }

  Widget _buildSubsequentPagesContent(dynamic page, int index) {
    bool isLastPage = index == onboardingPages.length - 1;
    return Positioned(
      left: 0, right: 0, bottom: 0,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 430.w,
          maxHeight: MediaQuery.of(context).size.height * 0.45,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
        decoration: const BoxDecoration(
          color: Color(0xFF121312),
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(page.title, style: AppStyle.font24WhiteBold, textAlign: TextAlign.center),
              if (page.description.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(page.description, style: AppStyle.font20WhiteW400, textAlign: TextAlign.center),
              ],
              const SizedBox(height: 28),
              CustomElevatedButton(
                text: isLastPage ? AppString.finish : AppString.next,
                backgroundColor: AppColor.secondaryColor,
                onPressed: () => _nextPage(index),
              ),
              const SizedBox(height: 12),
              CustomElevatedButton(
                text: AppString.back,
                backgroundColor: Colors.transparent,
                borderColor: AppColor.secondaryColor,
                textStyle: AppStyle.font20GoldW600,
                onPressed: () => _previousPage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _nextPage(int index) {
    if (index < onboardingPages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      _goToHome();
    }
  }

  void _previousPage() {
    controller.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }
}