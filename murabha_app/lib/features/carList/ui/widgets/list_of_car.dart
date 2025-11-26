import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/app_formatters.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/features/carList/data/models/car_model.dart';

class ListOfCar extends StatefulWidget {
  const ListOfCar({super.key});

  @override
  State<ListOfCar> createState() => _ListOfCarState();
}

class _ListOfCarState extends State<ListOfCar> {
  final backgroundColor = Colors.white;

  late Future<List<CarModel>> carModels;

  Future<List<CarModel>> loadCars() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/cars.json',
    );
    final List<dynamic> jsonResponse = json.decode(jsonString)[0]['cars'];
    return jsonResponse.map((data) => CarModel.fromJson(data)).toList();
  }

  @override
  void initState() {
    super.initState();
    carModels = loadCars();
    print("omar" + carModels.toString());
  }
  // late List<CarModel> carModels;

  // @override
  // void initState() {
  //   super.initState();
  //   carModels = [
  //     CarModel(
  //       name: 'Toyota Corolla',
  //       slug: 'toyota-corolla',
  //       image: ImageUrls(
  //         source: 'assets/images/Sls Black Series-Photoroom.png',
  //         thumb: '',
  //         optimized: '',
  //         original: '',
  //         localThumb: '',
  //         localOptimized: '',
  //         localOriginal: '',
  //       ),
  //     ),
  //     CarModel(
  //       name: 'Toyota Yaris',
  //       slug: 'toyota-yaris',
  //       image: ImageUrls(
  //         source: 'assets/images/Sls Black Series-Photoroom.png',
  //         thumb: '',
  //         optimized: '',
  //         original: '',
  //         localThumb: '',
  //         localOptimized: '',
  //         localOriginal: '',
  //       ),
  //     ),
  //     CarModel(
  //       name: 'Toyota Camry',
  //       slug: 'toyota-camry',
  //       image: ImageUrls(
  //         source: 'assets/images/Sls Black Series-Photoroom.png',
  //         thumb: '',
  //         optimized: '',
  //         original: '',
  //         localThumb: '',
  //         localOptimized: '',
  //         localOriginal: '',
  //       ),
  //     ),
  //     CarModel(
  //       name: 'Toyota Hilux',
  //       slug: 'toyota-hilux',
  //       image: ImageUrls(
  //         source: 'assets/images/Sls Black Series-Photoroom.png',
  //         thumb: '',
  //         optimized: '',
  //         original: '',
  //         localThumb: '',
  //         localOptimized: '',
  //         localOriginal: '',
  //       ),
  //     ),
  //     CarModel(
  //       name: 'Toyota Land Cruiser',
  //       slug: 'toyota-land-cruiser',
  //       image: ImageUrls(
  //         source: 'assets/images/Sls Black Series-Photoroom.png',
  //         thumb: '',
  //         optimized: '',
  //         original: '',
  //         localThumb: '',
  //         localOptimized: '',
  //         localOriginal: '',
  //       ),
  //     ),
  //     CarModel(
  //       name: 'Toyota Fortuner',
  //       slug: 'toyota-fortuner',
  //       image: ImageUrls(
  //         source: 'assets/images/Sls Black Series-Photoroom.png',
  //         thumb: '',
  //         optimized: '',
  //         original: '',
  //         localThumb: '',
  //         localOptimized: '',
  //         localOriginal: '',
  //       ),
  //     ),
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,

      // body: ListView.builder(
      //   padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      //   itemCount: carModels.length,
      //   itemBuilder: (context, index) {
      //     final model = carModels[index];
      //     return GestureDetector(
      //       onTap: () {
      //         // context.pushNamed(Routes.carDetailsScreen);
      //         context.pushNamed(Routes.carVersionScreen);
      //       },
      //       child: Container(
      //         margin: EdgeInsets.only(bottom: 12.h),
      //         decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.circular(12),
      //           boxShadow: [
      //             BoxShadow(
      //               color: Colors.grey.withOpacity(0.2),
      //               blurRadius: 6,
      //               offset: Offset(0, 3),
      //             ),
      //           ],
      //         ),
      //         child: ListTile(
      //           contentPadding: EdgeInsets.all(12.w),
      //           leading: ClipRRect(
      //             borderRadius: BorderRadius.circular(8),
      //             child: Image.asset(
      //               model.image.source,
      //               width: 60.w,
      //               height: 60.h,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //           title: Text(
      //             model.name,
      //             style: TextStyleManager.font12BlackRegular,
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
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

          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
            ),
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  final model = cars[index];
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.carVersionScreen);
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
                              Container(
                                decoration: BoxDecoration(
                                  color: ColorsManager.moreLighterGrey,
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Image.network(
                                  model.image.main,
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
                                      model.model,
                                      style: TextStyleManager.font14BlackBold,
                                    ),
                                    VerticalSpacing(4.h),
                                    Text(
                                      "Engine: ${model.specs.engine}",
                                      style:
                                          TextStyleManager.font12BlackRegular,
                                    ),
                                    Text(
                                      "${model.specs.fuelType}  | ${model.specs.transmission}",
                                      style:
                                          TextStyleManager.font12BlackRegular,
                                    ),
                                    VerticalSpacing(6.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // MainAxisAlignment.spaceBetween,
                                        // Text(
                                        //   "1000000 KM | Manual",
                                        //   style: TextStyleManager.font14BlackBold,
                                        // ),
                                        // Text(
                                        //   '\$${AppFormatters.formatPrice(10000)}/mo',
                                        //   style: TextStyleManager.font14GreenBold,
                                        // ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // child: Container(
                    //   margin: EdgeInsets.only(bottom: 12.h),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(12),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.grey.withOpacity(0.2),
                    //         blurRadius: 6,
                    //         offset: Offset(0, 3),
                    //       ),
                    //     ],
                    //   ),
                    //   child: ListTile(
                    //     contentPadding: EdgeInsets.all(12.w),
                    //     leading: ClipRRect(
                    //       borderRadius: BorderRadius.circular(8),
                    //       child: Image.network(
                    //         model.image.source,
                    //         // width: 12.w,
                    //         // height: 12.h,
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //     title: Text(
                    //       model.name,
                    //       style: TextStyleManager.font12BlackRegular,
                    //     ),
                    //   ),
                    // ),
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
