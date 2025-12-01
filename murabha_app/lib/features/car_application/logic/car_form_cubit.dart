import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'car_form_state.dart';

class CarFormCubit extends Cubit<CarFormState> {
  CarFormCubit() : super(CarFormInitial());
}
