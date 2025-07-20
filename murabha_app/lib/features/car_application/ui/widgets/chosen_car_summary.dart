import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class ChosenCarSummary extends StatelessWidget {
  const ChosenCarSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 140.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: ColorsManager.homeScreenBrandBackground,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Image.asset(
                "assets/images/onboarding_middle_screen_car_black.png",
                width: double.maxFinite,
                height: double.maxFinite,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Porche Taycan",
                      style: TextStyleManager.font16LightBlackBold,
                      // textAlign: TextAlign.start,
                    ),
                    VerticalSpacing(10.h),
                    Text(
                      "2023 Model - 4 Door Sedan",
                      style: TextStyleManager.font12GreyMedium,
                      // textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
