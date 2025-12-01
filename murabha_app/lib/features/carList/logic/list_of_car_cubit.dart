import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:murabha_app/features/carList/data/repos/car_list_repos.dart';
import '../data/models/car_model.dart';

part 'list_of_car_state.dart';

class ListOfCarCubit extends Cubit<ListOfCarState> {
  final CarListRepository repo;

  ListOfCarCubit({required this.repo}) : super(ListOfCarInitial());

  /// Fetch cars by brand slug
  Future<void> fetchCars(String brandSlug) async {
    emit(CarListLoading());
    try {
      final cars = await repo.getCarsByBrand(brandSlug);
      emit(CarListSuccess(cars));
    } catch (e) {
      emit(CarListError(e.toString()));
    }
  }
}
