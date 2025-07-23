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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(10.h),
              ImageandNotificationsIcon(),
              ApplyForACarCard(),
              VerticalSpacing(20.h),
              // CarBrandsSection(),
              Text(
                "Recomendations",
                style: TextStyleManager.font18BlackSemiBold,
              ),
              VerticalSpacing(10.h),
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return RecomendedCars();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppUniversalBottomNavBar(index: 0),
    );
  }
}
