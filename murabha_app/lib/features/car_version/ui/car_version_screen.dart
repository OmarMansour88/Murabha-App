import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/spacing.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/features/car_version/cubit/car_versions_cubit_cubit.dart';
import 'package:murabha_app/features/car_version/ui/widgets/car_grid_version.dart';
import 'package:murabha_app/features/car_version/ui/widgets/car_listview_version.dart';
import 'package:murabha_app/features/car_version/ui/widgets/filters/filter_bottom_sheet.dart';
import 'package:murabha_app/features/car_version/ui/widgets/sort_filter_button.dart';

class CarVersionScreen extends StatefulWidget {
  const CarVersionScreen({super.key});

  @override
  State<CarVersionScreen> createState() => _CarVersionScreenState();
}

class _CarVersionScreenState extends State<CarVersionScreen> {
  String sortBy = 'year';
  bool ascending = true;
  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    // You can change this slug to test different mock data
    const String fakeSlug = 'toyota-corolla';

    return BlocProvider(
      create: (_) => CarVersionsCubit()..loadVersions(fakeSlug),
      child: Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            'Car Versions',
            style: TextStyleManager.font18WhiteMedium,
          ),
          backgroundColor: ColorsManager.primaryColor,
          centerTitle: true,
          elevation: 0,
        ),

        body: BlocBuilder<CarVersionsCubit, CarVersionsState>(
          builder: (context, state) {
            if (state is CarVersionsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CarVersionsLoaded) {
              final versions = state.versions;
              if (versions.isEmpty) {
                return const Center(child: Text("No versions found."));
              }
              return ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18.r),
                  topRight: Radius.circular(18.r),
                ),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      // Header with title and sort/filter button
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Versions",
                              style: TextStyleManager.font18BlackSemiBold,
                            ),
                            Row(
                              children: [
                                SortFilterButton(
                                  icon: Icons.sort,
                                  title: "Sort By",
                                  onPressed: () {
                                    // Your sorting logic here
                                  },
                                ),
                                HorizontalSpacing(8.w),
                                SortFilterButton(
                                  icon: Icons.filter_alt_outlined,
                                  title: "Filters",
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

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Cars: 10",
                              style: TextStyleManager.font14BlackBold,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
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
                      Expanded(
                        child: isGridView
                            ? GridView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: (1.045).h,
                                      crossAxisSpacing: 12.w,
                                      mainAxisSpacing: 13.h,
                                    ),
                                itemCount: versions.length,
                                itemBuilder: (context, index) {
                                  final version = versions[index];
                                  return CarGridVersion(version: version);
                                },
                              )
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 8.h,
                                ),
                                itemCount: versions.length,
                                itemBuilder: (context, index) {
                                  final version = versions[index];
                                  return CarListVersion(
                                    version: version,
                                    isEven: index.isEven,
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: Text("Failed to load car versions."));
            }
          },
        ),
      ),
    );
  }
}
