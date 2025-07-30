import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murabha_app/core/helpers/extensions.dart';
import 'package:murabha_app/core/routing/routes.dart';
import 'package:murabha_app/features/car_version_screen/cubit/car_versions_cubit_cubit.dart';

class CarVersionScreen extends StatelessWidget {
  const CarVersionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // You can change this slug to test different mock data
    const String fakeSlug = 'toyota-corolla';
    const String fakeCarName = 'Toyota';

    return BlocProvider(
      create: (_) => CarVersionsCubit()..loadVersions(fakeSlug),
      child: Scaffold(
        appBar: AppBar(
          title: Text(fakeCarName),
          backgroundColor: Colors.white,
          centerTitle: true,
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
              return ListView.builder(
                itemCount: versions.length,
                itemBuilder: (context, index) {

                  final version = versions[index];
                  return Card(
                    color: Colors.white,
                    margin: const EdgeInsets.all(12),
                    child: ListTile(
                      onTap: () {
                        context.pushNamed(Routes.carDetailsScreen);
                      },
                      contentPadding: const EdgeInsets.all(12),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/mercedes-amg-sls-gullwing-black-series-hd-wallpaper-preview-Photoroom.png', // Placeholder image
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text("Year: ${version.year}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text("Price: \$${version.price}"),
                          Text("Stock: ${version.stock} units"),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("Failed to load car versions."));
            }
          },
        ),
      ),
    );
  }
}
