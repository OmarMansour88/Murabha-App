import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/core/themes/colors_manager.dart';
import 'package:murabha_app/core/themes/text_style_manager.dart';
import 'package:murabha_app/features/car_version/cubit/car_versions_cubit_cubit.dart';
import 'package:murabha_app/features/car_version/ui/widgets/sort_filter_button.dart';

class CarVersionScreen extends StatefulWidget {
  const CarVersionScreen({super.key});

  @override
  State<CarVersionScreen> createState() => _CarVersionScreenState();
}

class _CarVersionScreenState extends State<CarVersionScreen> {
  String sortBy = 'year';
  bool ascending = true;

  @override
  Widget build(BuildContext context) {
    // You can change this slug to test different mock data
    const String fakeSlug = 'toyota-corolla';
    const String fakeCarName = 'Toyota';

    return BlocProvider(
      create: (_) => CarVersionsCubit()..loadVersions(fakeSlug),
      child: Scaffold(
        backgroundColor: ColorsManager.primaryColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(fakeCarName, style: TextStyleManager.font18WhiteMedium),
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
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: versions.length,
                          itemBuilder: (context, index) {
                            final version = versions[index];
                            final Color backgroundColor = index.isEven
                                ? ColorsManager.lighterGrey
                                : Colors.white;

                            return GestureDetector(
                              onTap: () {
                                context.pushNamed(Routes.carDetailsScreen);
                              },
                              child: Container(
                                color: backgroundColor,
                                padding: EdgeInsets.symmetric(
                                  vertical: 14.w,
                                  horizontal: 14.h,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: ColorsManager.lightGrey,
                                        borderRadius: BorderRadius.circular(
                                          6.r,
                                        ),
                                      ),
                                      child: Image.asset(
                                        'assets/images/onboarding_middle_screen_car_option1_1_2.png',
                                        width: 130.w,
                                        height: 90.h,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Year: ${version.year}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text("Price: \$${version.price}"),
                                        ],
                                      ),
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
