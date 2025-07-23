import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import 'package:murabha_app/features/profile/ui/widgets/profile_header.dart';
import 'package:murabha_app/features/profile/ui/widgets/profile_options.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200.h,
            color: ColorsManager.primaryColor,
            child: SvgPicture.asset(
              'assets/svgs/home_screen_card_background.svg',
              fit: BoxFit.cover,
            ),
          ),


          // Scrollable content
          SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 20.h),
                VerticalSpacing(20.h),

            // Scrollable content
       
//                   SizedBox(height: 20.h),
//                   Padding(
//                     padding: EdgeInsets.only(left: 20.w),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "MuraBaha",
//                         style: TextStyleManager.font20BlackRegular,
//                       ),
//                     ),
//                   ),


                // Padding(
                //   padding: EdgeInsets.only(left: 20.w),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       "MuraBaha",
                //       style: TextStyle(
                //         fontSize: 20.sp,
                //         color: Colors.white,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const ProfileHeader(),
                ),

                SizedBox(height: 20.h),

                // White container with profile options
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12.r),
                    ),
                  ),
                  child: const ProfileOptions(),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: AppUniversalBottomNavBar(index: 3),
    );
  }
}
