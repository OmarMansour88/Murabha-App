import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/app_formatters.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/features/car_version/data/models/car_version.dart';
import 'package:murabha_app/core/helpers/extensions.dart';

class CarGridVersion extends StatelessWidget {
  final CarVersion version;

  const CarGridVersion({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(Routes.carDetailsScreen),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: ColorsManager.lighterGrey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Image
            Container(
              height: 155.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsManager.moreLighterGrey,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/onboarding_middle_screen_car_option1_1_2.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            VerticalSpacing(8.h),
            // Car Info
            Text(
              'Toyota Corolla',
              style: TextStyleManager.font18BlackSemiBold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            VerticalSpacing(4.h),
            Text(
              'Year: ${version.year}',
              style: TextStyleManager.font14BlackRegular,
            ),
            Text(
              '${AppFormatters.formatKilometers(version.kilometer)} KM | ${version.category}',
              style: TextStyleManager.font14BlackRegular,
            ),
            VerticalSpacing(10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // MainAxisAlignment.spaceBetween,
                Text(
                  '\$${AppFormatters.formatPrice(version.price)}',
                  style: TextStyleManager.font16BlackBold,
                ),
                Text(
                  '\$${AppFormatters.formatPrice(10000)}/mo',
                  style: TextStyleManager.font18GreenBold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
