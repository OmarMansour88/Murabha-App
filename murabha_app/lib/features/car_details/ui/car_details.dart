import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/app_button.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import 'package:murabha_app/features/car_details/ui/widgets/car_specifications.dart';
import 'package:murabha_app/features/car_version/data/models/car_version.dart';

class CarDetails extends StatelessWidget {
  final CarVersion version;

  const CarDetails({super.key, required this.version});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(version.model)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 200.h,
              child: Image.network(
                version.image.main,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VerticalSpacing(20.h),

                  /// --- CAR NAME + PRICE ---
                  Text(
                    version.model,
                    style: TextStyleManager.font18BlackSemiBold,
                  ),
                  Text(
                    version.price,
                    style: TextStyleManager.font16BlackBold,
                  ),

                  VerticalSpacing(20.h),

                  /// --- CAR SPECS ---
                  CarSpecifications(
                    engine: version.specs.engine,
                    topSpeed: version.specs.topSpeed,
                    acceleration: version.specs.acceleration,
                    fuelType: version.specs.fuelType,
                    transmission: version.specs.transmission,
                    horsePower: version.horsePower.toString(),
                  ),

                  VerticalSpacing(30.h),

                  AppUniversalButton(
                    onPressed: () {},
                    text: "Apply For Car",
                    horizontalPadding: 5.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppUniversalBottomNavBar(),
    );
  }
}
