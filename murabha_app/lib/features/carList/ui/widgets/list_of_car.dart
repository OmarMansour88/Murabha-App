import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import 'package:murabha_app/features/carList/data/models/car_model.dart'; // includes CarModel too

class ListOfCar extends StatefulWidget {
  const ListOfCar({super.key});

  @override
  State<ListOfCar> createState() => _ListOfCarState();
}

class _ListOfCarState extends State<ListOfCar> {
  late Future<List<CarModel>> futureCarModels;

  Future<List<CarModel>> loadCarModels() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/data.json',
    );
    final List<dynamic> jsonResponse = json.decode(jsonString);
    final models = jsonResponse.map((data) => CarModel.fromJson(data)).toList();

    return models;
  }

  @override
  void initState() {
    super.initState();
    futureCarModels = loadCarModels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CarModel>>(
        future: futureCarModels,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No car models found"));
          } else {
            final models = snapshot.data!;
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemCount: 10,
              itemBuilder: (context, index) {
                final model = models[index];
                return Container(
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
                      child: Image.network(
                        model.image.optimized,
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
                );
              },
            );
          }
        },
      ),
    );
  }
}
