import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/widgets/app_button.dart';
import 'package:murabha_app/features/login/ui/widgets/login/otp/image_and_text.dart';
import 'package:murabha_app/features/login/ui/widgets/login/otp/otp_textfields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              ImageAndText(),
              OtpTextfields(),
              VerticalSpacing(100.h),
              AppUniversalButton(onPressed: () {}, text: "Sign in"),
            ],
          ),
        ),
      ),
    );
  }
}
