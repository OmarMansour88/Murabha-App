import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:flutter_svg/svg.dart';

class ImageAndTextOnboarding extends StatelessWidget {
  const ImageAndTextOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset("assets/svgs/onboarding_low_opacity.svg"),
        Container(
          width: double.infinity,
          height: 250.h,
          // foregroundDecoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.bottomCenter,
          //     end: Alignment.topCenter,
          //     stops: [0.14, 0.4],
          //     colors: [Colors.white, Colors.white.withOpacity(0.0)],
          //   ),
          // ),
          child: Image.asset(
            'assets/images/onboarding_middle_screen_car_option1_1_2.png',
          ),
        ),
        Positioned(
          bottom: 70.h,
          left: 20.w,
          right: 20.w,
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Text(
              'Best Auto\nFinance App',
              textAlign: TextAlign.center,
              style: TextStyleManager.font32PrimaryRedBold,
            ),
          ),
        ),
        Positioned(
          bottom: 20.h,
          left: 20.w,
          right: 20.w,
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Text(
              'Your bank’s trusted app for finding and buying the perfect car — simple, safe, and made for our customers.',
              textAlign: TextAlign.center,
              style: TextStyleManager.font10GreyRegular,
            ),
          ),
        ),
      ],
    );
  }
}
