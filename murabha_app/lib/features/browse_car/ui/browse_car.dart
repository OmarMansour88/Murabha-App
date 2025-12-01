import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/widgets/custom_app_bar.dart';
import 'package:murabha_app/core/widgets/navigation_bar.dart';
import '../logic/car_brand_cubit.dart';


class BrowseCarScreen extends StatelessWidget {
  const BrowseCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarBrandCubit()..fetchCarBrands(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Car Brands",
          showBackButton: false,
        ),
        body: SafeArea(
          child: BlocBuilder<CarBrandCubit, CarBrandState>(
            builder: (context, state) {
              if (state is CarBrandLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CarBrandError) {
                return Center(child: Text(state.message));
              } else if (state is CarBrandSuccess) {
                final cars = state.cars;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    itemCount: cars.length,
                    itemBuilder: (context, index) {
                      final car = cars[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.listCarScreen,
                            arguments: car.slug,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    car.image.source,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                car.name,
                                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }

              // default fallback
              return const SizedBox.shrink();
            },
          ),
        ),
        bottomNavigationBar: AppUniversalBottomNavBar(index: 1),
      ),
    );
  }
}
