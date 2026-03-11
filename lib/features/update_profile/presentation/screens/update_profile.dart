import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/core/strings/app_string.dart';
import 'package:movies/core/styles/app_style.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/features/update_profile/widgets/avatar_picker.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateTabState();
}

class _UpdateTabState extends State<UpdateProfile> {
  String selectedAvatar = AppImage.avatar1;

  final List<String> avatars = [
    AppImage.avatar1,
    AppImage.avatar2,
    AppImage.avatar3,
    AppImage.avatar4,
    AppImage.avatar5,
    AppImage.avatar6,
    AppImage.avatar7,
    AppImage.avatar8,
    AppImage.avatar9,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(AppString.pickAvatar, style: AppStyle.font16GoldW400),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            AppIcon.arrowBack,
            colorFilter: const ColorFilter.mode(
              AppColor.secondaryColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: REdgeInsets.only(top: 30),
                  child: GestureDetector(
                    onTap: () {
                      AvatarPicker.show(
                        context,
                        avatars: avatars,
                        selectedAvatar: selectedAvatar,
                        onAvatarSelected: (newPath) {
                          setState(() => selectedAvatar = newPath);
                        },
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        selectedAvatar,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 34.h),

              CustomTextFormField(
                hintText: AppString.name,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(AppIcon.user),
                ),
              ),

              SizedBox(height: 20.h),

              CustomTextFormField(
                hintText: AppString.phone,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(AppIcon.phone),
                ),
                keyboardType: TextInputType.phone,
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppString.resetPassword,
                    style: AppStyle.font20WhiteW400,
                  ),
                ),
              ),

              SizedBox(height: 80.h),

              CustomElevatedButton(
                text: AppString.deleteAccount,
                backgroundColor: AppColor.elevatedButtonColor,
                textStyle: AppStyle.font20WhiteW400,
                onPressed: () {},
              ),

              SizedBox(height: 20.h),

              CustomElevatedButton(
                text: AppString.updateData,
                backgroundColor: AppColor.secondaryColor,
                textStyle: AppStyle.font20BlackW600,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}