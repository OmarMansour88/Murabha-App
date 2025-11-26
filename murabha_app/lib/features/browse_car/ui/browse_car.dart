import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import 'package:murabha_app/features/browse_car/data/models/car_brands.dart';

class BrowseCar extends StatefulWidget {
  const BrowseCar({super.key});

  @override
  State<BrowseCar> createState() => _BrowseCarState();
}

class _BrowseCarState extends State<BrowseCar> {
  late Future<List<CarBrand>> futureCars;

  Future<List<CarBrand>> loadCars() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/cars.json',
    );
    final List<dynamic> jsonResponse = json.decode(jsonString);
    return jsonResponse.map((data) => CarBrand.fromJson(data)).toList();
  }

  @override
  void initState() {
    super.initState();
    futureCars = loadCars();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<CarBrand>>(
          future: futureCars,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No data found"));
            } else {
              final names = snapshot.data!.map((car) => car.name).toList();
              final optimizedUrls = snapshot.data!
                  .map((car) => car.image.source)
                  .toList();

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Car Brands",
                      style: TextStyleManager.font18BlackSemiBold,
                      textAlign: TextAlign.center,
                    ),
                    VerticalSpacing(20.h),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3, // Number of items per row
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 20,
                          childAspectRatio: 1,
                        ),
                        itemCount: names.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.pushNamed(Routes.listCarScreen);
                            },
                            child: Container(
                              height: double.maxFinite,
                              decoration: BoxDecoration(
                                color: Colors.white, // Box background color
                                borderRadius: BorderRadius.circular(
                                  12,
                                ), // Rounded corners
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3), // Shadow position
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 8.h,
                              ), // Padding inside the box
                              child: Column(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ), // Optional if you want rounded image corners
                                      child: Image.network(
                                        optimizedUrls[index],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    names[index],
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      bottomNavigationBar: AppUniversalBottomNavBar(index: 1),
    );
  }
}
