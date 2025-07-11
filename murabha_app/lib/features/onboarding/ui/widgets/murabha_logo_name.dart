import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MurabhaLogoName extends StatelessWidget {
  const MurabhaLogoName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/murabha_logo.png',
          width: 50.w,
          height: 50.h,
        ),
        // SizedBox(width: 10.w),
        Text(
          "MuraBaha",
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
