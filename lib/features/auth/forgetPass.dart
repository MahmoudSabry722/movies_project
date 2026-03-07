import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/assets/app_assets.dart';
import '../../core/colors/app_color.dart';
import '../../core/strings/app_string.dart';
import '../../core/widgets/CustomTextFormField.dart';
import '../../core/widgets/custom_elevated_button.dart';

class Forgetpass extends StatelessWidget {
  const Forgetpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading:SafeArea(
          child: IconButton(onPressed:(){ Navigator.pop(context);
          }, icon: SvgPicture.asset(AppIcon.arrowBack),
          ),
        ),
        title:
        Center(
          child: Text("Forget Password",
            style: TextStyle(color: AppColor.secondaryColor),),
        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset(AppImage.forgetPasswordImage),
            CustomTextFormField(hintText:AppString.email,prefixIcon:SvgPicture.asset( AppIcon.email),),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(elevatedButtonText: AppString.verifyEmail,
              elevatedButtonAction:(){},
              backGroundColor: AppColor.secondaryColor,
              borderColor: AppColor.secondaryColor,
              elevatedButtonTextStyle:
              TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: AppColor.primaryColor),),
          ],
        ),
      ),
    );
  }
}
