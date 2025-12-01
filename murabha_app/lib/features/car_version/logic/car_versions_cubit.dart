import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murabha_app/features/car_version/data/models/car_version.dart';

part 'car_versions_state.dart';

class CarVersionsCubit extends Cubit<CarVersionsState> {
  CarVersionsCubit() : super(CarVersionsInitial());

  Future<void> loadVersions(String slug) async {
    emit(CarVersionsLoading());
    try {
      // Load JSON from assets
      final String jsonString = await rootBundle.loadString(
        'assets/data/cars.json',
      );
      final List<dynamic> data = json.decode(jsonString) as List<dynamic>;

      // Find brand by slug
      final Map<String, dynamic> brand = data
          .cast<Map<String, dynamic>>()
          .firstWhere(
            (b) => b['slug'] == slug,
            orElse: () => data.first as Map<String, dynamic>,
          );

      final List<dynamic> carsJson =
          (brand['cars'] as List<dynamic>? ?? <dynamic>[]);

      final versions = carsJson
          .cast<Map<String, dynamic>>()
          .map((carJson) => CarVersion.fromJson(carJson))
          .toList();

      emit(CarVersionsLoaded(versions));
    } catch (e) {
      emit(CarVersionsError(e.toString()));
    }
  }
}
