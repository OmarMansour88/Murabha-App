import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/app_divider.dart';
import 'package:murabha_app/features/login/ui/widgets/login/social_media_options.dart';

class OtherSignInOptions extends StatelessWidget {
  const OtherSignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DividerUni(),
            Text(
              "or sign in with",
              style: TextStyleManager.font12TextLightGreyRegular,
            ),
            DividerUni(),
          ],
        ),
        VerticalSpacing(40.h),
        SocialMediaRow(),
        // VerticalSpacing(20.h),
      ],
    );
  }
}
