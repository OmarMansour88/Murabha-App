import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:murabha_app/features/browse_car/data/models/car_brands.dart';

class CarBrandRepo {
  Future<List<CarBrand>> fetchCarBrands() async {
    try {
      final String jsonString = await rootBundle.loadString('assets/data/cars.json');
      final List<dynamic> jsonResponse = json.decode(jsonString);
      final cars = jsonResponse.map((data) => CarBrand.fromJson(data)).toList();
      return cars;
    } catch (e) {
      throw Exception("Failed to load car brands: $e");
    }
  }
}
