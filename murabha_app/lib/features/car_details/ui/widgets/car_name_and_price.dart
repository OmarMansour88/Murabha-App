import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class CarNameAndPrice extends StatelessWidget {
  const CarNameAndPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Porche Taycan",
                overflow: TextOverflow.ellipsis, // shows ...
                style: TextStyleManager.font18BlackSemiBold,
                textAlign: TextAlign.start,
              ),
              VerticalSpacing(5.h),
              Text(
                "2023 Model - 4 Door Sedan",
                style: TextStyleManager.font12GreyMedium,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        HorizontalSpacing(5.w),

        Text(
          "120,000\$",
          style: TextStyleManager.font18BlackSemiBold,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
