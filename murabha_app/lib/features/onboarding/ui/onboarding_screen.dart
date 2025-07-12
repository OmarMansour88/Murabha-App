import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
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
              OnboardingButton(),
            ],
          ),
        ),
      ),
    );
  }
}
