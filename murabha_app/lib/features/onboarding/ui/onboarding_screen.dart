import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/app_button.dart';
import 'package:murabha_app/features/onboarding/ui/widgets/image_and_text_onboarding.dart';
import 'package:murabha_app/features/onboarding/ui/widgets/murabha_logo_name.dart';
import 'package:murabha_app/features/onboarding/ui/widgets/onboarding_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: Column(
            children: [
              MurabhaLogoName(),
              VerticalSpacing(110.h),
              ImageAndTextOnboarding(),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.w),
              //   child: Text(
              //     'Your bank’s trusted app for finding and buying the perfect car — simple, safe, and made for our customers.',
              //     textAlign: TextAlign.center,
              //     style: TextStyleManager.font10GreyRegular,
              //   ),
              // ),
              // VerticalSpacing(10.h),
              OnboardingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
