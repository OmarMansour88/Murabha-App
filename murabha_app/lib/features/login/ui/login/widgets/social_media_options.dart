import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';

class SocialMediaRow extends StatelessWidget {
  const SocialMediaRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundColor: ColorsManager.lighterGrey,
          child: Image.asset(
            "assets/images/google.png",
            width: 25.w,
            height: 25.h,
          ),
        ),
        CircleAvatar(
          backgroundColor: ColorsManager.lighterGrey,
          child: Image.asset(
            "assets/images/facebook.png",
            width: 25.w,
            height: 25.h,
          ),
        ),
        CircleAvatar(
          backgroundColor: ColorsManager.lighterGrey,
          child: Image.asset(
            "assets/images/apple.png",
            width: 25.w,
            height: 25.h,
          ),
        ),
      ],
    );
  }
}
