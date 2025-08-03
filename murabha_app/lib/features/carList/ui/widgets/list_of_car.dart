import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/features/carList/data/models/car_model.dart'; // includes CarModel too

class ListOfCar extends StatefulWidget {
  const ListOfCar({super.key});

  @override
  State<ListOfCar> createState() => _ListOfCarState();
}

class _ListOfCarState extends State<ListOfCar> {
  late List<CarModel> carModels;

  @override
  void initState() {
    super.initState();
    carModels = [
      CarModel(
        name: 'Toyota Corolla',
        slug: 'toyota-corolla',
        image: ImageUrls(
          source: 'assets/images/Sls Black Series-Photoroom.png',
          thumb: '',
          optimized: '',
          original: '',
          localThumb: '',
          localOptimized: '',
          localOriginal: '',
        ),
      ),
      CarModel(
        name: 'Toyota Yaris',
        slug: 'toyota-yaris',
        image: ImageUrls(
          source: 'assets/images/Sls Black Series-Photoroom.png',
          thumb: '',
          optimized: '',
          original: '',
          localThumb: '',
          localOptimized: '',
          localOriginal: '',
        ),
      ),
      CarModel(
        name: 'Toyota Camry',
        slug: 'toyota-camry',
        image: ImageUrls(
          source: 'assets/images/Sls Black Series-Photoroom.png',
          thumb: '',
          optimized: '',
          original: '',
          localThumb: '',
          localOptimized: '',
          localOriginal: '',
        ),
      ),
      CarModel(
        name: 'Toyota Hilux',
        slug: 'toyota-hilux',
        image: ImageUrls(
          source: 'assets/images/Sls Black Series-Photoroom.png',
          thumb: '',
          optimized: '',
          original: '',
          localThumb: '',
          localOptimized: '',
          localOriginal: '',
        ),
      ),
      CarModel(
        name: 'Toyota Land Cruiser',
        slug: 'toyota-land-cruiser',
        image: ImageUrls(
          source: 'assets/images/Sls Black Series-Photoroom.png',
          thumb: '',
          optimized: '',
          original: '',
          localThumb: '',
          localOptimized: '',
          localOriginal: '',
        ),
      ),
      CarModel(
        name: 'Toyota Fortuner',
        slug: 'toyota-fortuner',
        image: ImageUrls(
          source: 'assets/images/Sls Black Series-Photoroom.png',
          thumb: '',
          optimized: '',
          original: '',
          localThumb: '',
          localOptimized: '',
          localOriginal: '',
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        itemCount: carModels.length,
        itemBuilder: (context, index) {
          final model = carModels[index];
          return GestureDetector(
            onTap: () {
              // context.pushNamed(Routes.carDetailsScreen);
              context.pushNamed(
                Routes.carVersionScreen,
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(12.w),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    model.image.source,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  model.name,
                  style: TextStyleManager.font12BlackRegular,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
