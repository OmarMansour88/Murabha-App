import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle profile header tap
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: ColorsManager.primaryColor.withOpacity(0.1),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Icon(
                  Icons.person,
                  size: 24.sp,
                  color: ColorsManager.primaryColor,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mohamed Amr",
                    style: TextStyleManager.font14BlackRegular,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "+20 123 456 7890",
                    style: TextStyleManager.font10GreyRegular,
                  ),
                ],
              ),
            ),

            // Right-aligned icon
            Icon(
              Icons.chevron_right, // or Icons.edit, as preferred
              size: 24.sp,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
