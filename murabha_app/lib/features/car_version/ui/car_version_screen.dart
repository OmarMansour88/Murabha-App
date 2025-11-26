import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import 'package:murabha_app/features/car_version/ui/widgets/car_combained_lists.dart';

class CarVersionScreen extends StatelessWidget {
  const CarVersionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text('Car Versions', style: TextStyleManager.font18WhiteMedium),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w),
        child: CarCombainedLists(),
      ),
      bottomNavigationBar: AppUniversalBottomNavBar(),
    );
  }
}
