import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_cubit_state.freezed.dart';

@freezed
class LoginCubitState<T> with _$LoginCubitState<T> {
  const factory LoginCubitState.initial() = _Initial;
  const factory LoginCubitState.loading() = Loading;
  const factory LoginCubitState.success(T responsebody) = Success<T>;
  const factory LoginCubitState.failure(String? error) = Failure;
}
