import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'car_properties_state.dart';

class CarPropertiesCubit extends Cubit<CarPropertiesState> {
  CarPropertiesCubit() : super(CarPropertiesInitial());
}
