import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/features/car_version/data/models/car_version.dart';
import 'package:murabha_app/features/car_version/ui/widgets/car_grid_version.dart';
import 'package:murabha_app/features/car_version/ui/widgets/car_listview_version.dart';
import 'package:murabha_app/features/car_version/ui/widgets/filters/filter_bottom_sheet.dart';
import 'package:murabha_app/features/car_version/ui/widgets/sort_filter_button.dart';

class CarCombainedLists extends StatefulWidget {
  const CarCombainedLists({super.key});

  @override
  State<CarCombainedLists> createState() => _CarCombainedListsState();
}

class _CarCombainedListsState extends State<CarCombainedLists> {
  bool isGridView = false;
  late Future<List<CarVersion>> carVersions;

  // Load JSON – Fixed version
  Future<List<CarVersion>> loadVersions() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/cars.json');
      final List<dynamic> jsonResponse = json.decode(jsonString);
      
      List<CarVersion> allCars = [];
      
      // Extract all cars from all brands
      for (var brandData in jsonResponse) {
        if (brandData['cars'] != null) {
          for (var carData in brandData['cars']) {
            allCars.add(CarVersion.fromJson(carData));
          }
        }
      }
      
      print("Loaded ${allCars.length} cars as versions");
      return allCars;
    } catch (e) {
      print("Error loading versions: $e");
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    carVersions = loadVersions();
    
    // Debug the loaded data
    carVersions.then((versions) {
      print("=== DEBUG: Loaded ${versions.length} versions ===");
      for (var version in versions.take(2)) {
        print("Model: ${version.model}");
        print("Year: ${version.year}");
        print("Price: ${version.price}");
        print("Image: ${version.image.main}");
        print("---");
      }
    }).catchError((error) {
      print("Error in future: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      body: FutureBuilder<List<CarVersion>>(
        future: carVersions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}",
                  style: TextStyleManager.font14BlackBold),
            );
          }

          final versions = snapshot.data!;

          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
            ),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  /// HEADER (Title + Sort/Filter)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Versions",
                            style: TextStyleManager.font18BlackSemiBold),

                        /// Sort + Filter Buttons
                        Row(
                          children: [
                            SortFilterButton(
                              icon: Icons.sort,
                              title: "Sort",
                              onPressed: () {},
                            ),
                            HorizontalSpacing(8.w),
                            SortFilterButton(
                              icon: Icons.filter_alt_outlined,
                              title: "Filter",
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (_) => const FilterBottomSheet(),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// TOTAL + TOGGLE View
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Cars: ${versions.length}",
                            style: TextStyleManager.font14BlackBold),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.list,
                                color: !isGridView
                                    ? ColorsManager.primaryColor
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  isGridView = false;
                                });
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.grid_view_rounded,
                                color: isGridView
                                    ? ColorsManager.primaryColor
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  isGridView = true;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// LIST OR GRID VIEW
                  Expanded(
                    child: isGridView
                        ? GridView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Changed from 1 to 2 for better grid layout
                              childAspectRatio: 0.7, // Adjusted aspect ratio
                              crossAxisSpacing: 8.w,
                              mainAxisSpacing: 10.h,
                            ),
                            itemCount: versions.length,
                            itemBuilder: (context, index) {
                              return CarGridVersion(
                                version: versions[index],
                              );
                            },
                          )
                        : ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 8.h),
                            itemCount: versions.length,
                            itemBuilder: (context, index) {
                              return CarListVersion(
                                version: versions[index],
                                isEven: index.isEven,
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}