import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:murabha_app/features/car_version_screen/data/models/car_version.dart';

part 'car_versions_cubit_state.dart';

class CarVersionsCubit extends Cubit<CarVersionsState> {
  CarVersionsCubit() : super(CarVersionsInitial());

  void loadVersions(String slug) {
    emit(CarVersionsLoading());
    // Mocked data
  final versions = [
    CarVersion(year: 2022, price: 25000, stock: 4),
    CarVersion(year: 2023, price: 27000, stock: 2),
    CarVersion(year: 2024, price: 29000, stock: 6),
  ];

    emit(CarVersionsLoaded(versions));
  }
}
