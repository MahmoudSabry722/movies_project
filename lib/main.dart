import 'package:flutter/material.dart';
import 'package:movies/core/routes/app_route.dart';
import 'package:movies/features/home_screen/home_screen.dart';
import 'package:movies/features/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      routes: {

        AppRoute.home: (context) => const HomeScreen(),
        AppRoute.onBoarding: (context) => const OnboardingScreen(),

      },

      initialRoute: AppRoute.onBoarding,
    );
  }
}