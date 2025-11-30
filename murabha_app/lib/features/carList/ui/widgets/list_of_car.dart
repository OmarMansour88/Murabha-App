import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/features/carList/data/models/car_model.dart';

class ListOfCar extends StatefulWidget {
  final String brandSlug;
  const ListOfCar({super.key, required this.brandSlug});

  @override
  State<ListOfCar> createState() => _ListOfCarState();
}

class _ListOfCarState extends State<ListOfCar> {
  final backgroundColor = Colors.white;

  late Future<List<CarModel>> carModels;

  Map<String, List<CarModel>> groupByModel(List<CarModel> cars) {
    final Map<String, List<CarModel>> grouped = {};

    for (var car in cars) {
      grouped.putIfAbsent(car.model, () => []);
      grouped[car.model]!.add(car);
    }

    return grouped;
  }

  Future<List<CarModel>> loadCars(String brandSlug) async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/cars.json',
    );
    final List<dynamic> jsonResponse = json.decode(jsonString);

    // Find the brand that matches the slug
    final brandData = jsonResponse.firstWhere(
      (brand) => brand['slug'] == brandSlug,
      orElse: () => null,
    );

    if (brandData == null) {
      return []; // Return empty list if brand not found
    }

    final List<dynamic> carsJson = brandData['cars'];
    return carsJson.map((data) => CarModel.fromJson(data)).toList();
  }

  @override
  void initState() {
    super.initState();
    carModels = loadCars(widget.brandSlug); // use widget.brandSlug
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      body: FutureBuilder<List<CarModel>>(
        future: carModels,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final cars = snapshot.data!;
          final groupedCars = groupByModel(cars);
          final modelNames = groupedCars.keys.toList();

          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
            ),
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                itemCount: modelNames.length,
                itemBuilder: (context, index) {
                  final modelName = modelNames[index];
                  final versions = groupedCars[modelName]!;

                  return GestureDetector(
                    onTap: () {
                      final selectedVersions =
                          groupedCars[modelName]!; // List<CarModel>
                      Navigator.pushNamed(
                        context,
                        Routes.carVersionScreen,
                        arguments: selectedVersions, // pass as List<CarModel>
                      );
                    },
                    child: Column(
                      children: [
                        VerticalSpacing(12.h),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: ColorsManager.lighterGrey,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 14.w,
                            horizontal: 14.h,
                          ),
                          child: Row(
                            children: [
                              // Display first version image
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorsManager.moreLighterGrey,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Image.network(
                                  versions.first.image.main,
                                  width: 120.w,
                                  height: 90.h,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              HorizontalSpacing(16.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      modelName,
                                      style: TextStyleManager.font14BlackBold,
                                    ),
                                    VerticalSpacing(4.h),
                                    Text(
                                      "${versions.length} Versions Available",
                                      style:
                                          TextStyleManager.font12BlackRegular,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
