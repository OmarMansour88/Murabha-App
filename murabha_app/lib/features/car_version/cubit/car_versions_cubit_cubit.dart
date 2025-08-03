import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:murabha_app/features/car_version/data/models/car_version.dart';

part 'car_versions_cubit_state.dart';

class CarVersionsCubit extends Cubit<CarVersionsState> {
  CarVersionsCubit() : super(CarVersionsInitial());

  void loadVersions(String slug) {
    emit(CarVersionsLoading());
    // Mocked data
    final versions = [
      CarVersion(year: 2022, price: 25000, stock: 4, model: '', kilometer: 1000000, category: 'Automatic', status: '', bodyStyle: 'Sedan'),
      CarVersion(year: 2023, price: 27000, stock: 2, model: '', kilometer: 5000000, category: 'Manual', status: '', bodyStyle: 'Hatchback'),
      CarVersion(year: 2024, price: 29000, stock: 6, model: '', kilometer: 20000, category: 'Automatic', status: '', bodyStyle: 'SUV'),
      CarVersion(year: 2023, price: 27000, stock: 2, model: '', kilometer: 10000, category: 'Manual', status: '', bodyStyle: 'Sedan'),
      CarVersion(year: 2024, price: 29000, stock: 6, model: '', kilometer: 30000, category: 'Hybrid', status: '', bodyStyle: 'Hatchback'),
      CarVersion(year: 2023, price: 27000, stock: 2, model: '', kilometer: 40000, category: 'Manual', status: '', bodyStyle: 'SUV'),
      CarVersion(year: 2024, price: 29000, stock: 6, model: '', kilometer: 70000, category: 'Automatic', status: '', bodyStyle: 'Sedan'),
    ];

    emit(CarVersionsLoaded(versions));
  }
}
