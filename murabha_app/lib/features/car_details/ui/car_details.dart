import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/app_button.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import 'package:murabha_app/features/car_details/ui/widgets/car_name_and_price.dart';
import 'package:murabha_app/features/car_details/ui/widgets/car_specifications.dart';

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Car Details"), backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 160.h,
              // decoration: BoxDecoration(color: Colors.red),
              child: Image.asset(
                "assets/images/onboarding_middle_screen_car_black.png",
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacing(20.h),
                  CarNameAndPrice(),
                  VerticalSpacing(20.h),
                  CarSpecifications(),
                  VerticalSpacing(30.h),

                  AppUniversalButton(
                    onPressed: () {},
                    text: "Apply For Car",
                    horizontalPadding: 5.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppUniversalBottomNavBar(),
    );
  }
}
