import 'package:flutter/material.dart';
import 'package:movies/core/routes/app_route.dart';
import 'package:movies/features/home_screen/home_screen.dart';

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
        AppRoute.home: (context) => HomeScreen(),
        /*AppRoute.login: (context) => LoginScreen,
        AppRoute.register: (context) => RegisterScreen,
        AppRoute.forgetPassword: (context) => ForgetPasswordScreen,
        AppRoute.onBoarding: (context) => OnBoardingScreen,
        AppRoute.movieDetails: (context) => MovieDetailsScreen,
        AppRoute.updateProfile: (context) => UpdateProfileScreen,*/
      },
      initialRoute: AppRoute.home,
    );
  }
}
