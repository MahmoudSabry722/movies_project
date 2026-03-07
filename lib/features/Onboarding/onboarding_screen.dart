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

        itemBuilder: (context,index){

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


              /// FIRST PAGE
              if(index == 0)
                Positioned(

                  left: 24,
                  right: 24,
                  bottom: 60,

                  child: Column(

                    mainAxisSize: MainAxisSize.min,

                    children: [

                      Text(
                        page.title,
                        style: AppStyle.font24WhiteBold,
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 12),

                      Text(
                        page.description,
                        style: AppStyle.font20WhiteW400,
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 24),

                      CustomElevatedButton(
                        text: "Explore Now",
                        onPressed: (){
                          controller.nextPage(
                            duration: const Duration(milliseconds: 350),
                            curve: Curves.ease,
                          );
                        },
                      ),

                    ],
                  ),
                ),



              /// DRAGGABLE CARD
              if(index != 0)
                DraggableScrollableSheet(

                  initialChildSize: 0.30,
                  minChildSize: 0.18,
                  maxChildSize: 0.60,

                  builder: (context, scrollController) {

                    return Container(

                      padding: const EdgeInsets.all(24),

                      decoration: const BoxDecoration(

                        color: Colors.black,

                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),

                      ),

                      child: ListView(

                        controller: scrollController,

                        children: [

                          /// HANDLE
                          Center(
                            child: Container(
                              width: 40,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// TITLE
                          Text(
                            page.title,
                            style: AppStyle.font24WhiteBold,
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 10),

                          /// DESCRIPTION
                          Text(
                            page.description,
                            style: AppStyle.font20WhiteW400,
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 24),

                          /// NEXT
                          CustomElevatedButton(

                            text: index == onboardingPages.length - 1
                                ? "Finish"
                                : "Next",

                            onPressed: (){

                              if(index < onboardingPages.length - 1){

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

                          const SizedBox(height: 12),

                          /// BACK
                          CustomElevatedButton(

                            text: "Back",
                            isOutlined: true,

                            onPressed: (){
                              controller.previousPage(
                                duration: const Duration(milliseconds: 350),
                                curve: Curves.ease,
                              );
                            },

                          ),

                        ],
                      ),
                    );
                  },
                ),

            ],
          );

        },
      ),
    );
  }
}