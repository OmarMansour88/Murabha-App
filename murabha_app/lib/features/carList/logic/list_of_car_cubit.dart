import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'list_of_car_state.dart';

class ListOfCarCubit extends Cubit<ListOfCarState> {
  ListOfCarCubit() : super(ListOfCarInitial());
}
