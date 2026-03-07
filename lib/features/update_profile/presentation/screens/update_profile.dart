import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/assets/app_assets.dart';
import 'package:movies/core/colors/app_color.dart';
import 'package:movies/core/strings/app_string.dart';
import 'package:movies/core/styles/app_style.dart';
import 'package:movies/core/widgets/custom_elvatedButton.dart';
import 'package:movies/core/widgets/custom_textField.dart';

class UpdateProfile extends StatefulWidget {
  String selectedAvatar = AppImage.avatar1;

  @override
  State<UpdateProfile> createState() => _UpdateTabState();
}

class _UpdateTabState extends State<UpdateProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(AppString.pickAvatar, style: AppStyle.font16GoldW400),
        centerTitle: true,
      ),
      body: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: REdgeInsets.only(top: 37),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: AppColor.tertiaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(24.r),
                            ),
                          ),
                          builder: (context) {
                            return Padding(
                              padding: REdgeInsets.all(20),
                              child: GridView.count(
                                shrinkWrap: true,
                                crossAxisCount: 3,
                                crossAxisSpacing: 20.w,
                                mainAxisSpacing: 20.h,
                                children: [
                                  avatarItem(AppImage.avatar1),
                                  avatarItem(AppImage.avatar2),
                                  avatarItem(AppImage.avatar3),
                                  avatarItem(AppImage.avatar4),
                                  avatarItem(AppImage.avatar5),
                                  avatarItem(AppImage.avatar6),
                                  avatarItem(AppImage.avatar7),
                                  avatarItem(AppImage.avatar8),
                                  avatarItem(AppImage.avatar9),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage(widget.selectedAvatar),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 34.h),
                CustomTextFormField(
                  hintText: AppString.name,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(AppIcon.user),
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  hintText: AppString.password,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(AppIcon.phone),
                  ),
                ),
                SizedBox(height: 20.h),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppString.resetPassword,
                    style: AppStyle.font20WhiteW400,
                  ),
                ),
              ],
            ),

            Spacer(),

            Column(
              children: [
                CustomElevatedButton(
                  elevatedButtonTextStyle: AppStyle.font20WhiteW400,
                  backGroundColor: AppColor.elevatedButtonColor,
                  elevatedButtonText: AppString.deleteAccount,
                  elevatedButtonAction: () {},
                ),
                SizedBox(height: 20.h),
                CustomElevatedButton(
                  elevatedButtonTextStyle: AppStyle.font20BlackW600.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  backGroundColor: AppColor.secondaryColor,
                  elevatedButtonText: AppString.updateData,
                  elevatedButtonAction: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget avatarItem(String image) {
    bool isSelected = widget.selectedAvatar == image;

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selectedAvatar = image;
        });
        Navigator.pop(context);
      },
      child: Container(
        padding: REdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColor.secondaryColor, width: 2),
          color: isSelected
              ? AppColor.secondaryColor.withOpacity(0.56)
              : Colors.transparent,
        ),
        child: CircleAvatar(radius: 35.r, backgroundImage: AssetImage(image)),
      ),
    );
  }
}
