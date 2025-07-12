import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,

      text: TextSpan(
        children: [
          TextSpan(
            text: "By signing in, you agree to our ",
            style: TextStyleManager.font12TextLightGreyRegular,
          ),
          TextSpan(
            text: "Terms & Conditions ",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
            ),
          ),
          TextSpan(
            text: "\nand",
            style: TextStyleManager.font12TextLightGreyRegular,
          ),
          TextSpan(
            text: "  Privacy Policy",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 11.sp,
            ),
          ),
        ],
      ),
    );
  }
}
