import 'package:flutter/material.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/features/carList/ui/widgets/list_of_car.dart';

class ListOfCarScreen extends StatelessWidget {
  final String brandSlug; // dynamically passed

  const ListOfCarScreen({super.key, required this.brandSlug});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.primaryColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        title: Text('${brandSlug.toUpperCase()} Cars'),
        centerTitle: true,
      ),
     body: ListOfCar(brandSlug: brandSlug), // dynamically load cars // pass it to your ListOfCar widget
    );
  }
}
