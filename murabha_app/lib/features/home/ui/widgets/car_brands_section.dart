import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class CarBrandsSection extends StatelessWidget {
  const CarBrandsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Car Brands", style: TextStyleManager.font18BlackSemiBold),
            Text("see more", style: TextStyleManager.font12PrimaryColorRegular),
          ],
        ),
        VerticalSpacing(10.h),
        SizedBox(
          height: 100.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsetsDirectional.only(
                  start: index == 0 ? 0 : 24.w,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: ColorsManager.homeScreenBrandBackground,
                      child: Image.asset(
                        'assets/images/mercedes_logo.png',
                        width: 50.w,
                        height: 50.h,
                      ),
                    ),
                    Text(
                      "Mercedes",
                      style: TextStyleManager.font12BlackRegular,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
