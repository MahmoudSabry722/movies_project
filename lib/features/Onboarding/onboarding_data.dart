import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/strings/app_string.dart';
import 'onboarding_model.dart';
import 'package:flutter/material.dart';

List<OnboardingModel> onboardingPages = [

  OnboardingModel(
    image: AppImage.onBoarding1,
    title: AppString.firstOnboardingTitle,
    description: AppString.firstOnboardingText,
    gradientColor: Colors.transparent,
  ),

  OnboardingModel(
    image: AppImage.onBoarding2,
    title: AppString.secondOnboardingTitle,
    description: AppString.secondOnboardingText,
    gradientColor: Color(0xFF084250),
  ),

  OnboardingModel(
    image: AppImage.onBoarding3,
    title: AppString.thirdOnboardingTitle,
    description: AppString.thirdOnboardingText,
    gradientColor: Color(0xFF85210E),
  ),

  OnboardingModel(
    image: AppImage.onBoarding4,
    title: AppString.forthOnboardingTitle,
    description: AppString.forthOnboardingText,
    gradientColor: Color(0xFF4C2471),
  ),

  OnboardingModel(
    image: AppImage.onBoarding5,
    title: AppString.fifthOnboardingTitle,
    description: AppString.fifthOnboardingText,
    gradientColor: Color(0xFF601321),
  ),

  OnboardingModel(
    image: AppImage.onBoarding6,
    title: AppString.sixthOnboardingTitle,
    description: "",
    gradientColor: Color(0xFF2A2C30),
  ),
];