import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/custom_app_bar.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import 'package:murabha_app/features/carList/data/models/car_model.dart';
import 'package:murabha_app/features/car_version/ui/widgets/car_combained_lists.dart';

class CarVersionScreen extends StatelessWidget {
  final List<CarModel> cars;

  const CarVersionScreen({super.key, required this.cars});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: ColorsManager.primaryColor,
      //   elevation: 0,
      //   shadowColor: Colors.transparent,
      //   title: Text('Car Versions', style: TextStyleManager.font18WhiteMedium),
      //   centerTitle: true,
      // ),
      appBar: CustomAppBar(
        title: 'Car Versions',
        backgroundColor: ColorsManager.primaryColor,
        iconColor: Colors.white,
        titleTextStyle: TextStyleManager.font18WhiteMedium,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        child: CarCombainedLists(cars: cars), // pass CarModel list
      ),
      bottomNavigationBar: AppUniversalBottomNavBar(),
    );
  }
}
