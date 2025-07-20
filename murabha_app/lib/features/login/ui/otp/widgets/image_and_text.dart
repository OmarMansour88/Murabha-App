import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class ImageAndText extends StatelessWidget {
  const ImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpacing(20.h),
        Container(
          width: double.maxFinite,
          height: 250.h,
          // decoration: BoxDecoration(color: Colors.red),
          child: Image.asset("assets/images/otp_image.png"),
        ),
        VerticalSpacing(50.h),
        Text(
          "OTP Verification",
          style: TextStyleManager.font20BlackBold,
          textAlign: TextAlign.center,
        ),
        VerticalSpacing(20.h),

        Text(
          "Enter the OTP sent to your register number",
          style: TextStyleManager.font12TextLightGreyRegular,
          textAlign: TextAlign.center,
        ),
        VerticalSpacing(50.h),
      ],
    );
  }
}
