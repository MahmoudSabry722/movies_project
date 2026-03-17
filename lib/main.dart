import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/colors/app_color.dart';

import 'core/routes/app_route.dart';
import 'features/Onboarding/onboarding_screen.dart';
import 'features/auth/forgetPassword/forget_password_screen.dart';
import 'features/auth/login/login_screen.dart';
import 'features/auth/register/register_screen.dart';
import 'features/home_screen/presentation/home_screen.dart';
import 'features/update_profile/presentation/screens/update_profile.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: false,
      child: MaterialApp(
        color: AppColor.primaryColor,
        title: 'Movies',
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoute.onBoarding: (context) => const OnboardingScreen(),
          AppRoute.login: (context) => LoginScreen(),
          AppRoute.register: (context) => RegisterScreen(),
          AppRoute.forgetPassword: (context) => ForgetPasswordScreen(),
          AppRoute.home: (context) => const HomeScreen(),
          AppRoute.updateProfile: (context) => const UpdateProfile(),
          /*



          AppRoute.movieDetails: (context) => MovieDetailsScreen,
          ,*/
        },
        initialRoute: AppRoute.forgetPassword,
      ),
    );
  }
}