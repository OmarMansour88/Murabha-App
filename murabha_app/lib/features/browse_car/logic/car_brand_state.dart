part of 'car_brand_cubit.dart';

@immutable
sealed class CarBrandState {}

// Initial state before anything happens
final class CarBrandInitial extends CarBrandState {}

// Loading state when fetching data
final class CarBrandLoading extends CarBrandState {}

// Success state when data is fetched
final class CarBrandSuccess extends CarBrandState {
  final List<CarBrand> cars;

  CarBrandSuccess(this.cars);
}

// Error state when something goes wrong
final class CarBrandError extends CarBrandState {
  final String message;

  CarBrandError(this.message);
}
