import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class CarSpecifications extends StatelessWidget {
  const CarSpecifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Specifications",
          style: TextStyleManager.font16BlackBold,
          textAlign: TextAlign.start,
        ),
        VerticalSpacing(5.h),
        Divider(color: ColorsManager.lightRed, thickness: 1),
        VerticalSpacing(5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                height: 50.h,

                // decoration: BoxDecoration(color: Colors.yellow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // VerticalSpacing(10.h),
                    Text("Engine", style: TextStyleManager.font12GreyMedium),
                    VerticalSpacing(10.h),
                    Text(
                      "2.0L Turbo Charged",
                      style: TextStyleManager.font14BlackRegular,
                    ),
                  ],
                ),
              ),
            ),
            HorizontalSpacing(5.w),
            Expanded(
              child: Container(
                height: 50.h,

                // decoration: BoxDecoration(color: Colors.yellow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // VerticalSpacing(10.h),
                    Text("Fuel Type", style: TextStyleManager.font12GreyMedium),
                    VerticalSpacing(10.h),
                    Text(
                      "Gasoline",
                      style: TextStyleManager.font14BlackRegular,
                    ),
                  ],
                ),
              ),
            ),
            HorizontalSpacing(5.w),
          ],
        ),
        Divider(color: ColorsManager.lightRed, thickness: 1),

        VerticalSpacing(5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                height: 50.h,

                // decoration: BoxDecoration(color: Colors.yellow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // VerticalSpacing(10.h),
                    Text(
                      "Transmission",
                      style: TextStyleManager.font12GreyMedium,
                    ),
                    VerticalSpacing(10.h),
                    Text(
                      "Automatic",
                      style: TextStyleManager.font14BlackRegular,
                    ),
                  ],
                ),
              ),
            ),
            HorizontalSpacing(5.w),
            Expanded(
              child: Container(
                height: 50.h,

                // decoration: BoxDecoration(color: Colors.yellow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // VerticalSpacing(10.h),
                    Text(
                      "Horse Power",
                      style: TextStyleManager.font12GreyMedium,
                    ),
                    VerticalSpacing(10.h),
                    Text("180 hp", style: TextStyleManager.font14BlackRegular),
                  ],
                ),
              ),
            ),
            HorizontalSpacing(5.w),
          ],
        ),
        Divider(color: ColorsManager.lightRed, thickness: 1),
        VerticalSpacing(5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                height: 50.h,

                // decoration: BoxDecoration(color: Colors.yellow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // VerticalSpacing(10.h),
                    Text(
                      "Drive Type",
                      style: TextStyleManager.font12GreyMedium,
                    ),
                    VerticalSpacing(10.h),
                    Text("RWD", style: TextStyleManager.font14BlackRegular),
                  ],
                ),
              ),
            ),
            HorizontalSpacing(5.w),
            Expanded(
              child: Container(
                height: 50.h,

                // decoration: BoxDecoration(color: Colors.yellow),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // VerticalSpacing(10.h),
                    Text("Colors", style: TextStyleManager.font12GreyMedium),
                    VerticalSpacing(10.h),
                    Text(
                      "Black,Yellow",
                      style: TextStyleManager.font14BlackRegular,
                    ),
                  ],
                ),
              ),
            ),
            HorizontalSpacing(5.w),
          ],
        ),
      ],
    );
  }
}
