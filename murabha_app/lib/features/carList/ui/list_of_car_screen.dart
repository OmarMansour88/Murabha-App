import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import 'package:murabha_app/features/carList/ui/widgets/list_of_car.dart';

class ListOfCarScreen extends StatelessWidget {
  const ListOfCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text('Cars Model', style: TextStyleManager.font18BlackSemiBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: ListOfCar(),
      ),
      bottomNavigationBar: AppUniversalBottomNavBar(),
    );
  }
}
