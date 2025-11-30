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
      // onTap: () => context.pushNamed(Routes.carDetailsScreen),
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.carDetailsScreen,
          arguments: version,
        );
      },
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
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorsManager.moreLighterGrey,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.network(
                        version.image.main, // Use version.image.main
                        fit: BoxFit.cover,
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
                  if (version.image.versions.isNotEmpty)
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 2.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          '${version.image.versions.length} colors',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            VerticalSpacing(8.h),
            // Car Info
            Text(
              version.model, // Use version.model
              style: TextStyleManager.font18BlackSemiBold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            VerticalSpacing(4.h),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 14.sp,
                  color: ColorsManager.grey,
                ),
                HorizontalSpacing(4.w),
                Text(
                  version.year.toString(), // Use version.year
                  style: TextStyleManager.font12GreyMedium,
                ),
              ],
            ),
            VerticalSpacing(4.h),
            Row(
              children: [
                Icon(Icons.speed, size: 14.sp, color: ColorsManager.grey),
                HorizontalSpacing(4.w),
                Text(
                  '${version.horsePower} HP', // Use version.horsePower
                  style: TextStyleManager.font12GreyMedium,
                ),
              ],
            ),
            VerticalSpacing(4.h),
            Row(
              children: [
                Icon(
                  Icons.local_gas_station,
                  size: 14.sp,
                  color: ColorsManager.grey,
                ),
                HorizontalSpacing(4.w),
                Text(
                  version.specs.fuelType, // Use version.specs.fuelType
                  style: TextStyleManager.font12GreyMedium,
                ),
              ],
            ),
            VerticalSpacing(8.h),
            // Price
            Text(version.price, style: TextStyleManager.font16BlackBold),
            VerticalSpacing(10.h),
          ],
        ),
      ),
    );
  }
}
