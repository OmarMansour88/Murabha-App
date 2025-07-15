import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/app_button.dart';

class ApplyForACarCard extends StatelessWidget {
  const ApplyForACarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 180.h,
      // decoration: BoxDecoration(color: Colors.red),
      child: Stack(
        // fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0.h,
            child: SvgPicture.asset(
              "assets/svgs/home_screen_card_background.svg",
              height: 160.h,
              width: 160.w,
              // fit: BoxFit.scaleDown,
            ),
          ),
          Positioned(
            right: 0,
            child: Image.asset(
              'assets/images/sales.png',
              width: 150.w,
              height: 200.h,
            ),
          ),
          Positioned(
            top: 40.h,
            left: 20.w,
            child: Text(
              "Get your\nCar with a\nBank you trust",
              style: TextStyleManager.font18WhiteMedium,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 20.w,
            child: AppUniversalButton(
              onPressed: () {},
              text: "Browse Cars",
              backgroundColor: Colors.white,
              width: 120.w,
              height: 30.h,
              textStyle: TextStyleManager.font12PrimaryColorRegular,
              horizontalPadding: 0.h,
            ),
          ),
        ],
      ),
    );
  }
}
