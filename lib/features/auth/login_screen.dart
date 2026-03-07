import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/widgets/CustomTextFormField.dart';
import 'package:movies/features/auth/forgetPass.dart';
import 'package:movies/features/auth/register_screen.dart';

import '../../core/assets/app_assets.dart';
import '../../core/colors/app_color.dart';
import '../../core/strings/app_string.dart';
import '../../core/widgets/custom_elevated_button.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        SafeArea(child:
        Column(
          children: [
            Center(child: Image.asset(AppImage.logo,width: 150,height: 150,),
            ),
            SizedBox(
              height: 19,
            ),
            CustomTextFormField(hintText:AppString.email,
              prefixIcon: SvgPicture.asset(AppIcon.email),),
            SizedBox(
              height: 23,
            ),
            CustomTextFormField(hintText: AppString.password,prefixIcon: SvgPicture.asset(AppIcon.password),suffixIcon: SvgPicture.asset(AppIcon.eyeOff),),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Forgetpass()));
                  }, child: Text(AppString.forgetPassword,style: TextStyle(

                  color: AppColor.secondaryColor,fontSize: 14,fontWeight: FontWeight.w400))),
            ),
            SizedBox(
              height: 34,
            ),
            CustomElevatedButton(elevatedButtonText: AppString.login,
              elevatedButtonAction:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              backGroundColor: AppColor.secondaryColor,
              borderColor: AppColor.secondaryColor,
              elevatedButtonTextStyle:
              TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: AppColor.primaryColor),),
            SizedBox(
              height: 19,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppString.doNotHaveAccount,style: TextStyle(color: AppColor.textColor,fontSize: 14),),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero
                  ),
                    onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                }, child: Text(AppString.createOne,style: TextStyle(

                    color: AppColor.secondaryColor,fontSize: 14,fontWeight: FontWeight.w400)))
              ],
            ),
            SizedBox(
              height: 27,
            ),
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
                Text(AppString.or,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: AppColor.secondaryColor),),
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
            SizedBox(
              height: 27,
            ),
            CustomElevatedButton(
                elevatedButtonTextStyle:  TextStyle(fontWeight: FontWeight.w400,fontSize: 20,color: AppColor.primaryColor),
                backGroundColor: AppColor.secondaryColor,
                elevatedButtonText: AppString.loginWithGoogle,
                elevatedButtonAction: (){},elevatedButtonIcon:SvgPicture.asset(AppIcon.google)),
            SizedBox(
              height: 27,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              decoration: BoxDecoration(
                border: Border.all(
                    color: AppColor.secondaryColor
                ),
               borderRadius:BorderRadius.circular(30)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AppIcon.america,width: 30,height: 30,),
                  SizedBox(width: 10,),
                  SvgPicture.asset(AppIcon.egypt,width: 30,height: 30,)
                ],
              ),
            )
          ],
        ),
      ),)
    );
  }
}
