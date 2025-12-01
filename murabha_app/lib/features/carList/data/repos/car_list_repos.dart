import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:murabha_app/features/carList/data/models/car_model.dart';

class CarListRepository {
  /// Fetch cars for a given brand slug
  Future<List<CarModel>> getCarsByBrand(String brandSlug) async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/cars.json');
      final List<dynamic> jsonResponse = json.decode(jsonString);

      final brandData = jsonResponse.firstWhere(
        (brand) => brand['slug'] == brandSlug,
        orElse: () => null,
      );

      if (brandData == null) return [];

      final List<dynamic> carsJson = brandData['cars'];
      return carsJson.map((data) => CarModel.fromJson(data)).toList();
    } catch (e) {
      throw Exception("Failed to load cars: $e");
    }
  }
}
