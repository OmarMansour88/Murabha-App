part of 'car_versions_cubit_cubit.dart';

abstract class CarVersionsState {}

class CarVersionsInitial extends CarVersionsState {}

class CarVersionsLoading extends CarVersionsState {}

class CarVersionsLoaded extends CarVersionsState {
  final List<CarVersion> versions;

  CarVersionsLoaded(this.versions);
}

class CarVersionsError extends CarVersionsState {
  final String message;

  CarVersionsError(this.message);
}
