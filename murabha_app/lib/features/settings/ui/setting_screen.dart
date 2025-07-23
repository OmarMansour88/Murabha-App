import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import 'package:murabha_app/features/settings/ui/widgets/setting_header.dart';
import 'package:murabha_app/features/settings/ui/widgets/setting_options.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
                VerticalSpacing(20.h),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const SettingHeader(),
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
                  child: const SettingOptions(),
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
