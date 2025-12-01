import 'package:flutter/material.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/custom_app_bar.dart';
import 'package:murabha_app/features/carList/ui/widgets/list_of_car.dart';

class ListOfCarScreen extends StatelessWidget {
  final String brandSlug; // dynamically passed

  const ListOfCarScreen({super.key, required this.brandSlug});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: ColorsManager.primaryColor,
      //   elevation: 0,
      //   shadowColor: Colors.transparent,
      //   title: Text('${brandSlug.toUpperCase()} Cars'),
      //   centerTitle: true,
      // ),
      appBar: CustomAppBar(
        title: '${brandSlug.toUpperCase()} Cars',
        backgroundColor: ColorsManager.primaryColor,
        iconColor: Colors.white,
        titleTextStyle: TextStyleManager.font18WhiteMedium,
      ),
     body: ListOfCar(brandSlug: brandSlug), // dynamically load cars // pass it to your ListOfCar widget
    );
  }
}
