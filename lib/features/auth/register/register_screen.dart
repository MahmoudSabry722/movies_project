import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/core/strings/app_string.dart';
import 'package:movies/core/styles/app_style.dart';
import 'package:movies/core/widgets/CustomTextFormField.dart';
import 'package:movies/features/auth/widgets/AvatarPageView.dart';
import 'package:movies/features/auth/login/login_screen.dart';
import '../../../core/widgets/custom_elevated_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(AppIcon.arrowBack),
          ),
          title: Center(
            child: Text(
              AppString.register,
              style: TextStyle(color: AppColor.secondaryColor),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AvatarPageView(),
              Text(
                AppString.avatar,
                style: AppStyle.font16WhiteW400
              ),
              SizedBox(height: 7),
              CustomTextFormField(
                hintText: AppString.name,
                prefixIcon: SvgPicture.asset(AppIcon.name),
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppString.email,
                prefixIcon: SvgPicture.asset(AppIcon.email),
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppString.password,
                prefixIcon: SvgPicture.asset(AppIcon.password),
                suffixIcon: SvgPicture.asset(AppIcon.eyeOff),
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppString.confirmPassword,
                prefixIcon: SvgPicture.asset(AppIcon.password),
                suffixIcon: SvgPicture.asset(AppIcon.eyeOff),
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: AppString.phone,
                prefixIcon: SvgPicture.asset(AppIcon.phone),
              ),
              SizedBox(height: 16),
              CustomElevatedButton(
                text: AppString.createAccount,
                onPressed: () {},
                backgroundColor: AppColor.secondaryColor,
                borderColor: AppColor.secondaryColor,
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: AppColor.primaryColor,
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppString.alreadyHaveAccount,
                    style: TextStyle(
                      color: AppColor.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      AppString.login,
                      style: TextStyle(
                        color: AppColor.secondaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.secondaryColor),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AppIcon.america, width: 30, height: 30),
                    SizedBox(width: 10),
                    SvgPicture.asset(AppIcon.egypt, width: 30, height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
