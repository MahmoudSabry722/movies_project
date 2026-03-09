import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routes/app_route.dart';
import 'package:movies/features/home_screen/home_screen.dart';
import 'package:movies/features/update_profile/presentation/screens/update_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      splitScreenMode: false,
      child: MaterialApp(
        title: 'Movies',
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoute.home: (context) => HomeScreen(),
          AppRoute.updateProfile: (context) => UpdateProfile(),
          /*AppRoute.login: (context) => LoginScreen,
          AppRoute.register: (context) => RegisterScreen,
          AppRoute.forgetPassword: (context) => ForgetPasswordScreen,
          AppRoute.onBoarding: (context) => OnBoardingScreen,
          AppRoute.movieDetails: (context) => MovieDetailsScreen,
          ,*/
        },
        initialRoute: AppRoute.home,
      ),
    );
  }
}
