import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/app_formatters.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/features/car_version/data/models/car_version.dart';

class CarListVersion extends StatelessWidget {
  final CarVersion version;
  final bool isEven;

  const CarListVersion({Key? key, required this.version, required this.isEven})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isEven ? ColorsManager.grey100 : Colors.white;

    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.carDetailsScreen);
      },
      child: Container(
        color: backgroundColor,
        padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 14.h),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorsManager.lightGrey,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Image.asset(
                'assets/images/onboarding_middle_screen_car_option1_1_2.png',
                width: 130.w,
                height: 90.h,
                fit: BoxFit.contain,
              ),
            ),
            HorizontalSpacing(16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Toyota Corolla',
                    style: TextStyleManager.font16BlackBold,
                  ),
                  VerticalSpacing(4.h),
                  Text(
                    "Year: ${version.year}",
                    style: TextStyleManager.font12BlackRegular,
                  ),
                  Text(
                    "${AppFormatters.formatKilometers(version.kilometer)} KM | ${version.category}",
                    style: TextStyleManager.font12BlackRegular,
                  ),
                  VerticalSpacing(6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // MainAxisAlignment.spaceBetween,
                      Text(
                        '\$${AppFormatters.formatPrice(version.price)}',
                        style: TextStyleManager.font14BlackBold,
                      ),
                      Text(
                        '\$${AppFormatters.formatPrice(10000)}/mo',
                        style: TextStyleManager.font14GreenBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
