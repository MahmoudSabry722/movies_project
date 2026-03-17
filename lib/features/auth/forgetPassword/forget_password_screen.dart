import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/styles/app_style.dart';
import 'package:movies/core/validation/validation.dart';
import '../../../core/assets/app_assets.dart';
import '../../../core/colors/app_color.dart';
import '../../../core/strings/app_string.dart';
import '../../../core/widgets/CustomTextFormField.dart';
import '../../../core/widgets/custom_elevated_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          scrolledUnderElevation: 0,
          forceMaterialTransparency: true,
          elevation: 0,
          centerTitle: true,
          title: Text(AppString.forgetPasswordHead, style: AppStyle.font16GoldW400),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(AppIcon.arrowBack),
          ),
          actions: [SizedBox(width: 48.w)],
        ),
        body: Form(
          key: _formKey,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      Image.asset(AppImage.forgetPasswordImage,height: 430, width: 430,),
                      SizedBox(height: 40.h),
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
                      SizedBox(height: 30.h),
                      CustomElevatedButton(
                        text: AppString.verifyEmail,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Email is valid: ${_emailController.text}");
                          }
                        },
                        backgroundColor: AppColor.secondaryColor,
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}