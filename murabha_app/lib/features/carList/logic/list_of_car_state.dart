part of 'list_of_car_cubit.dart';

@immutable
sealed class ListOfCarState {}

final class ListOfCarInitial extends ListOfCarState {}

final class CarListLoading extends ListOfCarState {}

final class CarListSuccess extends ListOfCarState {
  final List<CarModel> cars;
  CarListSuccess(this.cars);
}

final class CarListError extends ListOfCarState {
  final String message;
  CarListError(this.message);
}
