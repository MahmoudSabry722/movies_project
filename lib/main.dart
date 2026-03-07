import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routes/app_route.dart';
import 'package:movies/features/home_screen/presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Movies',
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoute.home: (context) => const HomeScreen(),
            /*AppRoute.login: (context) => LoginScreen,
            AppRoute.register: (context) => RegisterScreen,
            AppRoute.forgetPassword: (context) => ForgetPasswordScreen,
            AppRoute.onBoarding: (context) => OnBoardingScreen,
            AppRoute.movieDetails: (context) => MovieDetailsScreen,
            AppRoute.updateProfile: (context) => UpdateProfileScreen,*/
          },
          initialRoute: AppRoute.home,
        );
      },
    );
  }
}
