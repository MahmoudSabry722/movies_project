import 'package:flutter/material.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/core/styles/app_style.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'onboarding_data.dart';
import 'package:movies/features/home_screen/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,

      body: PageView.builder(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: onboardingPages.length,

        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        itemBuilder: (context, index) {

          final page = onboardingPages[index];

          return Stack(
            children: [

              /// IMAGE
              Positioned.fill(
                child: Image.asset(
                  page.image,
                  fit: BoxFit.cover,
                ),
              ),

              /// GRADIENT
              Positioned.fill(
                child: Container(
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
                      stops: const [
                        0.0,
                        0.39,
                        0.68,
                        1.0,
                      ],
                    ),
                  ),
                ),
              ),

              /// FIRST PAGE CONTENT
              if (index == 0)
                Positioned(
                  left: 16,
                  right: 16,
                  bottom: 16,

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Text(
                        page.title,
                        style: AppStyle.font36WhiteBold,
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        page.description,
                        style: AppStyle.font18WhiteW400,
                        textAlign: TextAlign.justify,
                      ),

                      const SizedBox(height: 20),

                      CustomElevatedButton(
                        text: "Explore Now",
                        onPressed: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.ease,
                          );
                        },
                      ),
                    ],
                  ),
                ),

              /// BOTTOM CARD
              if (index != 0)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,

                  child: Center(
                    child: Container(

                      constraints: const BoxConstraints(
                        maxWidth: 430,
                        maxHeight: 343,
                      ),

                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 32),

                      decoration: const BoxDecoration(
                        color: Color(0xFF121312),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                      ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,

                          children: [

                            /// TITLE
                            Text(
                              page.title,
                              style: AppStyle.font24WhiteBold,
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 8),

                            /// DESCRIPTION
                            Text(
                              page.description,
                              style: AppStyle.font20WhiteW400,
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 6),

                            /// NEXT / FINISH
                            CustomElevatedButton(
                              text: index == onboardingPages.length - 1
                                  ? "Finish"
                                  : "Next",

                              onPressed: () {

                                if (index < onboardingPages.length - 1) {

                                  controller.nextPage(
                                    duration: const Duration(milliseconds: 350),
                                    curve: Curves.ease,
                                  );

                                } else {

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                }
                              },
                            ),

                            /// BACK
                            if (index > 1) ...[
                              const SizedBox(height: 6),

                              CustomElevatedButton(
                                text: "Back",
                                isOutlined: true,

                                onPressed: () {
                                  controller.previousPage(
                                    duration: const Duration(milliseconds: 350),
                                    curve: Curves.ease,
                                  );
                                },
                              ),
                            ],

                          ],
                        ),
                    ),
                  ),
                ),

            ],
          );
        },
      ),
    );
  }
}