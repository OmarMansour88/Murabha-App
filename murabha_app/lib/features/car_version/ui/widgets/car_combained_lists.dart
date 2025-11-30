import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/features/carList/data/models/car_model.dart' hide CarSpecs;
import 'package:murabha_app/features/car_version/data/models/car_version.dart';
import 'package:murabha_app/features/car_version/ui/widgets/car_grid_version.dart';
import 'package:murabha_app/features/car_version/ui/widgets/car_listview_version.dart';
import 'package:murabha_app/features/car_version/ui/widgets/filters/filter_bottom_sheet.dart';
import 'package:murabha_app/features/car_version/ui/widgets/sort_filter_button.dart';

class CarCombainedLists extends StatefulWidget {
  final List<CarModel> cars; // keep it CarModel

  const CarCombainedLists({super.key, required this.cars});

  @override
  State<CarCombainedLists> createState() => _CarCombainedListsState();
}

class _CarCombainedListsState extends State<CarCombainedLists> {
  bool isGridView = false;

  /// Convert CarModel → CarVersion
List<CarVersion> get versions => widget.cars
    .map((car) => CarVersion(
          model: car.model,
          year: car.year ?? 0,
          price: car.price ?? '',
          image: CarVersionImage(
            main: car.image.main,
            thumb: car.image.thumb,
            gallery: car.image.gallery,
            versions: [], // empty list because CarImage doesn't have versions
          ),
          specs: CarSpecs(
            engine: car.specs.engine,
            topSpeed: car.specs.topSpeed,
            acceleration: car.specs.acceleration,
            fuelType: car.specs.fuelType,
            transmission: car.specs.transmission,
          ),
          id: car.id ?? 0,
          horsePower: car.horsePower ?? 0,
        ))
    .toList();



  @override
  Widget build(BuildContext context) {
    final carVersions = versions;

    return Scaffold(
      backgroundColor: ColorsManager.primaryColor,
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.r),
          topRight: Radius.circular(18.r),
        ),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              /// HEADER
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Versions", style: TextStyleManager.font18BlackSemiBold),
                    Row(
                      children: [
                        SortFilterButton(
                            icon: Icons.sort, title: "Sort", onPressed: () {}),
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
                    )
                  ],
                ),
              ),

              /// TOTAL + VIEW TOGGLE
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Cars: ${carVersions.length}",
                        style: TextStyleManager.font14BlackBold),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.list,
                              color: !isGridView
                                  ? ColorsManager.primaryColor
                                  : Colors.grey),
                          onPressed: () => setState(() => isGridView = false),
                        ),
                        IconButton(
                          icon: Icon(Icons.grid_view_rounded,
                              color: isGridView
                                  ? ColorsManager.primaryColor
                                  : Colors.grey),
                          onPressed: () => setState(() => isGridView = true),
                        )
                      ],
                    )
                  ],
                ),
              ),

              /// LIST OR GRID VIEW
              Expanded(
                child: isGridView
                    ? GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 8.w,
                          mainAxisSpacing: 10.h,
                        ),
                        itemCount: carVersions.length,
                        itemBuilder: (context, index) =>
                            CarGridVersion(version: carVersions[index]),
                      )
                    : ListView.builder(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                        itemCount: carVersions.length,
                        itemBuilder: (context, index) => CarListVersion(
                          version: carVersions[index],
                          isEven: index.isEven,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
