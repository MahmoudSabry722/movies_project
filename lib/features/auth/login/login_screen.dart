import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/routes/app_route.dart';
import 'package:movies/core/styles/app_style.dart';
import 'package:movies/core/validation/validation.dart';
import 'package:movies/core/widgets/CustomTextFormField.dart';
import '../../../core/assets/app_assets.dart';
import '../../../core/colors/app_color.dart';
import '../../../core/strings/app_string.dart';
import '../../../core/widgets/custom_elevated_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            AppImage.appLogo,
                            width: 150,
                            height: 150,
                          ),
                        ),
                        const SizedBox(height: 40),
                        CustomTextFormField(
                          controller: _emailController,
                          hintText: AppString.email,
                          prefixIcon: SvgPicture.asset(
                            AppIcon.email,
                            fit: BoxFit.scaleDown,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: Validation.email,
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          controller: _passwordController,
                          hintText: AppString.password,
                          isPassword: true,
                          prefixIcon: SvgPicture.asset(
                            AppIcon.password,
                            fit: BoxFit.scaleDown,
                          ),
                          validator: Validation.password,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            style: TextButton.styleFrom(padding: EdgeInsets.zero),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoute.forgetPassword,
                              );
                            },
                            child: Text(
                              AppString.forgetPassword,
                              style: AppStyle.font14GoldBold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        CustomElevatedButton(
                          text: AppString.login,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushReplacementNamed(context, AppRoute.home);
                            }
                          },
                          backgroundColor: AppColor.secondaryColor,
                          textStyle: AppStyle.font20GrayBold,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppString.doNotHaveAccount,
                              style: AppStyle.font14WhiteW400,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(padding: EdgeInsets.zero),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoute.register,
                                );
                              },
                              child: Text(
                                AppString.createOne,
                                style: AppStyle.font14GoldBold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                indent: 15,
                                endIndent: 15,
                                thickness: 2,
                                color: AppColor.secondaryColor,
                              ),
                            ),
                            Text(AppString.or, style: AppStyle.font16GoldW400),
                            Expanded(
                              child: Divider(
                                indent: 15,
                                endIndent: 15,
                                thickness: 2,
                                color: AppColor.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        CustomElevatedButton(
                          textStyle: AppStyle.font20GrayBold,
                          backgroundColor: AppColor.secondaryColor,
                          text: AppString.loginWithGoogle,
                          onPressed: () {},
                          icon: SvgPicture.asset(AppIcon.google),
                        ),
                        const SizedBox(height: 25),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColor.secondaryColor,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                AppIcon.america,
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(width: 10),
                              SvgPicture.asset(AppIcon.egypt, width: 30, height: 30),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}