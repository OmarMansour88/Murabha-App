import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import 'package:murabha_app/features/home/ui/widgets/apply_for_a_car_card.dart';
import 'package:murabha_app/features/home/ui/widgets/car_brands_section.dart';
import 'package:murabha_app/features/home/ui/widgets/recomendation_Section.dart';
import 'package:murabha_app/features/home/ui/widgets/text_and_notifications_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpacing(10.h),
                ImageandNotificationsIcon(),
                // VerticalSpacing(10.h),
                ApplyForACarCard(),
                VerticalSpacing(20.h),
                CarBrandsSection(),
                // VerticalSpacing(10.h),
                Text(
                  "Recomendations",
                  style: TextStyleManager.font18BlackSemiBold,
                ),
                VerticalSpacing(10.h),
                SizedBox(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return RecomendedCars();
                    },
                  ),
                ),
              ],

              // style: Theme.of(context).textTheme.headline4,
            ),
          ),

          // Positioned(
          //   bottom: 0.h,
          //   child: Container(
          //     height: 50.h,
          //     width: double.maxFinite,
          //     decoration: BoxDecoration(color: Colors.white),
          //   ),
          // ),
        ),
      ),
      bottomNavigationBar: AppUniversalBottomNavBar(index: 0),
    );
  }
}
