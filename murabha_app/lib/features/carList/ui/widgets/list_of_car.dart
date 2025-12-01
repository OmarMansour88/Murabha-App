import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/features/carList/data/models/car_model.dart';
import 'package:murabha_app/features/carList/data/repos/car_list_repos.dart';
import 'package:murabha_app/features/carList/logic/list_of_car_cubit.dart';


class ListOfCar extends StatelessWidget {
  final String brandSlug;
  const ListOfCar({super.key, required this.brandSlug});

  Map<String, List<CarModel>> groupByModel(List<CarModel> cars) {
    final Map<String, List<CarModel>> grouped = {};
    for (var car in cars) {
      grouped.putIfAbsent(car.model, () => []);
      grouped[car.model]!.add(car);
    }
    return grouped;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListOfCarCubit(repo: CarListRepository())..fetchCars(brandSlug),
      child: Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        body: BlocBuilder<ListOfCarCubit, ListOfCarState>(
          builder: (context, state) {
            if (state is CarListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CarListError) {
              return Center(child: Text(state.message));
            } else if (state is CarListSuccess) {
              final cars = state.cars;
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
                          Navigator.pushNamed(
                            context,
                            Routes.carVersionScreen,
                            arguments: versions, // List<CarModel>
                          );
                        },
                        child: Column(
                          children: [
                            VerticalSpacing(12.h),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(color: ColorsManager.lighterGrey),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 14.h),
                              child: Row(
                                children: [
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
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(modelName, style: TextStyleManager.font14BlackBold),
                                        SizedBox(height: 4.h),
                                        Text("${versions.length} Versions Available",
                                            style: TextStyleManager.font12BlackRegular),
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
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
