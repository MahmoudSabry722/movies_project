import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routes/app_route.dart';
import 'package:movies/features/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Movies',
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoute.home: (context) => const HomeScreen(),
            /*
            AppRoute.login: (context) => const LoginScreen(),
            AppRoute.register: (context) => const RegisterScreen(),
            AppRoute.forgetPassword: (context) => const ForgetPasswordScreen(),
            AppRoute.onBoarding: (context) => const OnBoardingScreen(),
            AppRoute.movieDetails: (context) => const MovieDetailsScreen(),
            AppRoute.updateProfile: (context) => const UpdateProfileScreen(),
            */
          },
          initialRoute: AppRoute.home,
        );
      },
    );
  }
}
