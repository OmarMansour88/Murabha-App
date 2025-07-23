import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';

class ApplicationTileModel extends StatelessWidget {
  final String? applicationNumber;
  final String? carName;
  final VoidCallback onTap;
  final String? imageUrl;
  final String? carPrice;
  final String? applicationStatus;

  const ApplicationTileModel({
    super.key,
    this.applicationNumber,
    required this.onTap,
    this.imageUrl,
    this.carName,
    this.carPrice,
    this.applicationStatus,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Container(
          height: 120.h, // Adjust height as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              7.r,
            ), // Optional: rounded corners
            border: Border(
              top: BorderSide(color: Colors.grey, width: 0.2.w),
              bottom: BorderSide(color: Colors.grey, width: 0.2.w),
              left: BorderSide(color: Colors.grey, width: 0.2.w),
              right: BorderSide(color: Colors.grey, width: 0.2.w),
            ),
          ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    // color: ColorsMana,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Image.asset(
                    imageUrl ??
                        "assets/images/onboarding_middle_screen_car_black.png",
                    fit: BoxFit.contain,
                  ),
                ),
                HorizontalSpacing(10.w),
                // Inside the Row:
                Container(
                  width: 150.w,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalSpacing(5.h),

                        Row(
                          children: [
                            Icon(
                              Icons.paste_rounded,
                              color: ColorsManager.primaryColor,
                              size: 18.sp,
                            ),
                            HorizontalSpacing(5.w),
                            Text(
                              applicationNumber ?? "CA-25-84",
                              style: TextStyleManager.font16BlackBold,
                            ),
                          ],
                        ),

                        // VerticalSpacing(5.h),
                        Text(
                          carName ?? "Mercedes Benz - C Class 2025",
                          style: TextStyleManager.font14PGreyRegular,
                          maxLines: 2, // or 1 if you only want a single line
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),

                        VerticalSpacing(5.h),

                        Text(
                          carPrice ?? "120000\$",
                          style: TextStyleManager.font14PGreyRegular,
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10.h,
                        right: 10.w,
                        child: Container(
                          width: 10.w,
                          height: 10.h,
                          child: CircleAvatar(
                            backgroundColor: applicationStatus == "Pending"
                                ? Colors.yellow
                                : applicationStatus == "Approved"
                                ? Colors.green
                                : applicationStatus == "Rejected"
                                ? Colors.red
                                : ColorsManager.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
