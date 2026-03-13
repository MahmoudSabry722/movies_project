import 'package:flutter/material.dart';
import 'package:movies/core/colors/app_color.dart';

abstract class AppStyle {
  static TextStyle font24WhiteBold = TextStyle(
    color: AppColor.textColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font20WhiteBold = TextStyle(
    color: AppColor.textColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font36WhiteBold = TextStyle(
    color: AppColor.textColor,
    fontSize: 36,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font20WhiteW400 = TextStyle(
    color: AppColor.textColor,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font20GrayBold = TextStyle(
    color: AppColor.tertiaryColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static TextStyle font20BlackW600 = TextStyle(
    color: AppColor.primaryColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle font20GoldW600 = TextStyle(
    color: AppColor.secondaryColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle font16WhiteW400 = TextStyle(
    color: AppColor.textColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font16BlackW600 = TextStyle(
    color: AppColor.primaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static TextStyle font18WhiteW400 = TextStyle(
    color: AppColor.textColor,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font16GoldW400 = TextStyle(
    color: AppColor.secondaryColor,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font14GoldBold = TextStyle(
    color: AppColor.secondaryColor,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}