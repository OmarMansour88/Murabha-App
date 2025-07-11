import 'package:flutter/material.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/widgets/app_button.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppUniversalButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      text: "Get Started",
    );
  }
}
