import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/font_weight.dart';

class TextStyleManager {
  static TextStyle font32PrimaryRedBold = TextStyle(
    fontSize: 32.sp,
    color: ColorsManager.primaryColor,
    fontWeight: FontWeightManager.bold,
  );
  static TextStyle font10GreyRegular = TextStyle(
    fontSize: 10.sp,
    color: ColorsManager.grey,
    fontWeight: FontWeightManager.regular,
  );
  static TextStyle font16WhiteSemibold = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeightManager.semiBold,
  );
}
