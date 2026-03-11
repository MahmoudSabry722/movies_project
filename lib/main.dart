import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/routes/app_route.dart';
import 'package:movies/features/onboarding/onboarding_screen.dart';
import 'package:movies/features/home_screen/presentation/home_screen.dart';
import 'package:movies/features/update_profile/presentation/screens/update_profile.dart';

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
        title: 'Movies',
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoute.onBoarding: (context) => const OnboardingScreen(),
          AppRoute.home: (context) => const HomeScreen(),
          AppRoute.updateProfile: (context) => const UpdateProfile(),
          /*AppRoute.login: (context) => LoginScreen,
          AppRoute.register: (context) => RegisterScreen,
          AppRoute.forgetPassword: (context) => ForgetPasswordScreen,

          AppRoute.movieDetails: (context) => MovieDetailsScreen,
          ,*/
        },
        initialRoute: AppRoute.onBoarding,
      ),
    );
  }
}