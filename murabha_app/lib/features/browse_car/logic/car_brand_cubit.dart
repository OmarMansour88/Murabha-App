import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:murabha_app/features/browse_car/data/models/car_brands.dart';

part 'car_brand_state.dart';

class CarBrandCubit extends Cubit<CarBrandState> {
  CarBrandCubit() : super(CarBrandInitial());

  /// Fetch car brands from local JSON (mock API)
  Future<void> fetchCarBrands() async {
    emit(CarBrandLoading());

    try {
      // Load local JSON
      final String jsonString = await rootBundle.loadString('assets/data/cars.json');
      final List<dynamic> jsonResponse = json.decode(jsonString);

      // Map JSON to List<CarBrand>
      final cars = jsonResponse.map((data) => CarBrand.fromJson(data)).toList();

      if (cars.isEmpty) {
        emit(CarBrandError("No cars found"));
      } else {
        emit(CarBrandSuccess(cars));
      }
    } catch (e) {
      emit(CarBrandError("Failed to load car brands: $e"));
    }
  }
}
