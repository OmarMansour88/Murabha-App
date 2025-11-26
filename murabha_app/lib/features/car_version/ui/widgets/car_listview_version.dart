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
      child: Column(
        children: [
          VerticalSpacing(10.h),
          Container(
            // color: backgroundColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: ColorsManager.lighterGrey),
            ),
            padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 14.h),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorsManager.moreLighterGrey,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.r),
                    child: Image.network(
                      version.image.main,
                      width: 130.w,
                      height: 90.h,
                      fit: BoxFit.contain,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.primaryColor,
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                HorizontalSpacing(16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        version.model,
                        style: TextStyleManager.font16BlackBold,
                      ),
                      VerticalSpacing(4.h),
                      Text(
                        "Year: ${version.year}",
                        style: TextStyleManager.font12BlackRegular,
                      ),
                      VerticalSpacing(6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // MainAxisAlignment.spaceBetween,
                          Text(
                            version.price,
                            style: TextStyleManager.font14BlackBold,
                          ),
                          // Text(
                          //   '\$${AppFormatters.formatPrice(10000)}/mo',
                          //   style: TextStyleManager.font14GreenBold,
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
